import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth_roleperm/helpers/sliderightroute.dart';
import 'package:flutter_auth_roleperm/models/roles.dart';
import 'package:flutter_auth_roleperm/screens/addpermissionsscreen.dart';
import 'package:flutter_auth_roleperm/screens/editrolescreen.dart';
import 'package:flutter_auth_roleperm/screens/rolesscreen.dart';
import 'package:flutter_auth_roleperm/services/api_service.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class RoleDetailsScreen extends StatelessWidget {
  const RoleDetailsScreen({Key? key, required this.roles, required this.errMsg}) : super(key: key);
  final Roles roles;
  final String errMsg;
  static const String _title = 'Users';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: StatefulRoleDetailsWidget(roles: roles, errMsg: errMsg,),
    );
  }
}

class StatefulRoleDetailsWidget extends StatefulWidget {
  const StatefulRoleDetailsWidget({Key? key, required this.roles, required this.errMsg})
      : super(key: key);
  final Roles roles;
  final String errMsg;

  @override
  // ignore: no_logic_in_create_state
  _RoleDetailsWidgetState createState() => _RoleDetailsWidgetState(roles: roles, errMsg: errMsg);
}

class _RoleDetailsWidgetState extends State<StatefulRoleDetailsWidget> {
  _RoleDetailsWidgetState({required this.roles, required this.errMsg});

  final Roles roles;
  final String errMsg;
  final ApiService api = ApiService();

  @override
  void initState() {
    super.initState();

    if (errMsg.isNotEmpty) {
      Future.delayed(Duration.zero, () {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(errMsg),
        ));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 252, 142, 54),
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Color.fromARGB(255, 26, 255, 1)),
        title: const Text(
          'Role Details',
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
              context, SlideRightRoute(page: const RolesScreen(errMsg: '',))),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20.0),
          child: Card(
              child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.0),
                    color: const Color.fromARGB(255, 252, 142, 54),
                    border: Border.all(color: const Color.fromARGB(255, 0, 0, 0)),
                  ),
                  padding: const EdgeInsets.all(10.0),
                  width: 440,
                  child: Column(
                    children: <Widget>[
                      Container(
                        margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                        child: Column(
                          children: <Widget>[
                            Text('Role Name:',
                                style: TextStyle(
                                    color: Colors.black.withOpacity(0.8))),
                            Text(widget.roles.roleName.toString(),
                                style: Theme.of(context).textTheme.subtitle1)
                          ],
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                        child: Column(
                          children: <Widget>[
                            Text('Role Description:',
                                style: TextStyle(
                                    color: Colors.black.withOpacity(0.8))),
                            Text(widget.roles.roleDescription.toString(),
                                style: Theme.of(context).textTheme.subtitle1)
                          ],
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.fromLTRB(20, 0, 20, 10),
                        child: Column(
                          children: <Widget>[
                            Text('Permissions:',
                                style: TextStyle(
                                    color: Colors.black.withOpacity(0.8))),
                            Text(widget.roles.permissions.toString(),
                                style: Theme.of(context).textTheme.subtitle1)
                          ],
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                        child: Column(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 30, vertical: 10),
                              child: SizedBox(
                                height: 60.0,
                                width: MediaQuery.of(context).size.width * 1.0,
                                child: ElevatedButton.icon(
                                  icon: const Icon(
                                    Icons.edit,
                                    color: Color.fromARGB(255, 0, 0, 0),
                                    size: 24.0,
                                  ),
                                  style: ButtonStyle(
                                    shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(5.0),
                                          side: const BorderSide(
                                              color:
                                              Color.fromARGB(255, 128, 255, 0),
                                              width: 1.0),
                                        )),
                                    backgroundColor: MaterialStateProperty.all<
                                        Color>(
                                        const Color.fromARGB(255, 255, 200, 0)),
                                  ),
                                  onPressed: () async {
                                    Navigator.pushReplacement(
                                        context,
                                        SlideRightRoute(
                                            page: EditRoleScreen(
                                              roles: roles,
                                            )));
                                  },
                                  label: const Text('EDIT',
                                      style: TextStyle(
                                        height: 1.171875,
                                        fontSize: 24.0,
                                        fontFamily: 'Roboto',
                                        fontWeight: FontWeight.w400,
                                        color: Color.fromARGB(255, 0, 0, 0),
                                      )),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 30, vertical: 10),
                              child: SizedBox(
                                height: 60.0,
                                width: MediaQuery.of(context).size.width * 1.0,
                                child: ElevatedButton.icon(
                                  icon: const Icon(
                                    Icons.delete,
                                    color: Color.fromARGB(255, 0, 0, 0),
                                    size: 24.0,
                                  ),
                                  style: ButtonStyle(
                                    shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(5.0),
                                          side: const BorderSide(
                                              color:
                                              Color.fromARGB(255, 128, 255, 0),
                                              width: 1.0),
                                        )),
                                    backgroundColor: MaterialStateProperty.all<
                                        Color>(
                                        const Color.fromARGB(255, 255, 200, 0)),
                                  ),
                                  onPressed: () async {
                                    _confirmDialog();
                                  },
                                  label: const Text('DELETE',
                                      style: TextStyle(
                                        height: 1.171875,
                                        fontSize: 24.0,
                                        fontFamily: 'Roboto',
                                        fontWeight: FontWeight.w400,
                                        color: Color.fromARGB(255, 0, 0, 0),
                                      )),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 30, vertical: 10),
                              child: SizedBox(
                                height: 60.0,
                                width: MediaQuery.of(context).size.width * 1.0,
                                child: ElevatedButton.icon(
                                  icon: const Icon(
                                    Icons.update,
                                    color: Color.fromARGB(255, 0, 0, 0),
                                    size: 24.0,
                                  ),
                                  style: ButtonStyle(
                                    shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(5.0),
                                          side: const BorderSide(
                                              color:
                                              Color.fromARGB(255, 128, 255, 0),
                                              width: 1.0),
                                        )),
                                    backgroundColor: MaterialStateProperty.all<
                                        Color>(
                                        const Color.fromARGB(255, 255, 200, 0)),
                                  ),
                                  onPressed: () async {
                                    Navigator.pushReplacement(
                                        context,
                                        SlideRightRoute(
                                            page: AddPermissionsScreen(
                                              role: roles,
                                            )));
                                  },
                                  label: const Text('PERMISSIONS',
                                      style: TextStyle(
                                        height: 1.171875,
                                        fontSize: 24.0,
                                        fontFamily: 'Roboto',
                                        fontWeight: FontWeight.w400,
                                        color: Color.fromARGB(255, 0, 0, 0),
                                      )),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ))),
        ),
      ),
    );
  }

  Future<void> _confirmDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Warning!'),
          content: SingleChildScrollView(
            child: ListBody(
              children: const <Widget>[
                Text('Are you sure want delete this item?'),
              ],
            ),
          ),
          actions: <Widget>[
            ElevatedButton(
              child: const Text('Yes'),
              onPressed: () async {
                EasyLoading.show();
                var res = await api.deleteRole(widget.roles.id.toString());

                switch (res.statusCode) {
                  case 200:
                    EasyLoading.dismiss();
                    Navigator.pushReplacement(
                        context, SlideRightRoute(page: const RolesScreen(errMsg: 'Deleted Successfully',)));
                    break;
                  case 400:
                    EasyLoading.dismiss();
                    var data = jsonDecode(res.body);
                    if (data["msg"] != null) {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text(data["msg"].toString()),
                      ));
                    }
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text("Delete Failed"),
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
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text("Delete Failed"),
                    ));
                    break;
                }
              },
            ),
            ElevatedButton(
              child: const Text('No'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
