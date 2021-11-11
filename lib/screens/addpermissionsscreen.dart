import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth_roleperm/helpers/sliderightroute.dart';
import 'package:flutter_auth_roleperm/models/permissions.dart';
import 'package:flutter_auth_roleperm/models/roles.dart';
import 'package:flutter_auth_roleperm/screens/loginscreen.dart';
import 'package:flutter_auth_roleperm/screens/roledetailsscreen.dart';
import 'package:flutter_auth_roleperm/services/api_service.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:http/http.dart';

class AddPermissionsScreen extends StatelessWidget {
  const AddPermissionsScreen({Key? key, required this.role}) : super(key: key);
  final Roles role;
  static const String _title = 'Add/Update Permissions';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: StatefulAddPermissionWidget(role: role,),
    );
  }
}

class StatefulAddPermissionWidget extends StatefulWidget {
  const StatefulAddPermissionWidget({Key? key, required this.role}) : super(key: key);
  final Roles role;

  @override
  // ignore: no_logic_in_create_state
  _AddPermissionWidgetState createState() => _AddPermissionWidgetState(role: role);
}

class _AddPermissionWidgetState extends State<StatefulAddPermissionWidget> {
  _AddPermissionWidgetState({ required this.role });
  final Roles role;
  final ApiService api = ApiService();
  final _addPermissionFormKey = GlobalKey<FormState>();
  late List<Permissions> permissions = [];

  Future<Response> get listPermissions async {
    EasyLoading.show();
    return await api.getPermissionList();
  }

  bool setValue(int index) {
    bool permVal = false;
    var matchPerm = role.permissions!.where((perm) => perm.id == permissions[index].id);
    if(matchPerm.isNotEmpty) {
      permVal = true;
    }
    return permVal;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 252, 142, 54),
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Color.fromARGB(255, 26, 255, 1)),
        title: const Text(
          'Add/Update Permissions',
          style: TextStyle(
            height: 1.171875,
            fontSize: 18.0,
            fontFamily: 'Roboto Condensed',
            fontWeight: FontWeight.w500,
            color: Color.fromARGB(255, 26, 255, 1),
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 0, 0, 0),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back,
              color: Color.fromARGB(255, 26, 255, 1)),
          onPressed: () => Navigator.pushReplacement(
              context, SlideRightRoute(page: RoleDetailsScreen(roles: role, errMsg: ''))),
        ),
      ),
      body: Center(
        child: FutureBuilder(
          future: listPermissions,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              Response resp = snapshot.data as Response;
              if (resp.statusCode == 200) {
                EasyLoading.dismiss();
                final jsonMap = json.decode(resp.body);
                permissions = (jsonMap as List)
                    .map((roleItem) => Permissions.fromJson(roleItem))
                    .toList();
                return permissions.isNotEmpty
                    ? Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 10.0),
                  child: ListView.builder(
                    itemCount: permissions.isEmpty ? 0 : permissions.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 0.0),
                        child: CheckboxListTile(
                          title: Text(
                            permissions[index].permDescription.toString(),
                            style: const TextStyle(
                              fontFamily: 'Roboto',
                              color: Color.fromARGB(255, 0, 0, 0),
                            ),
                          ),
                          value: setValue(index),
                          controlAffinity: ListTileControlAffinity.leading,
                          onChanged: (bool? newValue) {
                            if (newValue == true) {
                              var matchPerm = role.permissions!.where((perm) => perm.id == permissions[index].id);
                              if(matchPerm.isEmpty) {
                                setState(() {
                                  role.permissions!.add(permissions[index]);
                                });
                              }
                            } else {
                              var matchPerm = role.permissions!.where((perm) => perm.id == permissions[index].id);
                              if(matchPerm.isNotEmpty) {
                                setState(() {
                                  role.permissions!.removeWhere((item) => item.id == permissions[index].id);
                                });
                              }
                            }
                          },
                        ),
                      );
                    },
                  ),
                )
                    : const Center(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: 10.0, horizontal: 20.0),
                    child: Text(
                      'No roles found',
                      overflow: TextOverflow.visible,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        height: 1.171875,
                        fontSize: 24.0,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w300,
                        color: Color.fromARGB(255, 255, 255, 255),
                      ),
                    ),
                  ),
                );
              } else if (resp.statusCode == 401) {
                EasyLoading.dismiss();
                Future.delayed(Duration.zero, () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginScreen(errMsg: 'Unauthenticated',)));
                });
              } else if (resp.statusCode == 403) {
                EasyLoading.dismiss();
                Future.delayed(Duration.zero, () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => RoleDetailsScreen(roles: role, errMsg: 'Permission Denied')));
                });
              }
            } else if (snapshot.hasError) {
              EasyLoading.dismiss();
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text('${snapshot.error}'),
              ));
            }
            return const Center(
              child: Text(''''''),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          EasyLoading.show();
          List<int?> permissionsInt = role.permissions!.map((e) => e.id).toList();
          var res = await api.addPermissiontoRole(role.id, permissionsInt);

          switch (res.statusCode) {
            case 200:
              EasyLoading.dismiss();
              Navigator.pushReplacement(
                  context, SlideRightRoute(page: RoleDetailsScreen(roles: role, errMsg: 'Permission added to role successfully')));
              break;
            case 400:
              EasyLoading.dismiss();
              var data = jsonDecode(res.body);
              ScaffoldMessenger.of(context)
                  .showSnackBar(const SnackBar(
                content: Text("Failed to Add Permissions"),
              ));
              break;
            case 403:
              EasyLoading.dismiss();
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                content: Text("Permission Denied"),
              ));
              break;
            default:
              EasyLoading.dismiss();
              ScaffoldMessenger.of(context)
                  .showSnackBar(const SnackBar(
                content: Text("Failed to Add Permissions"),
              ));
              break;
          }
        },
        tooltip: 'Increment',
        child: const Icon(Icons.save),
        backgroundColor: const Color.fromARGB(255, 0, 0, 0),
      ),
    );
  }
}
