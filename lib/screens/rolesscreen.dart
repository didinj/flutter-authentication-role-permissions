import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth_roleperm/helpers/sliderightroute.dart';
import 'package:flutter_auth_roleperm/models/roles.dart';
import 'package:flutter_auth_roleperm/screens/addrolescreen.dart';
import 'package:flutter_auth_roleperm/screens/homescreen.dart';
import 'package:flutter_auth_roleperm/screens/loginscreen.dart';
import 'package:flutter_auth_roleperm/services/api_service.dart';
import 'package:flutter_auth_roleperm/widgets/rolelistwidget.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:http/http.dart';

class RolesScreen extends StatelessWidget {
  const RolesScreen({Key? key, required this.errMsg}) : super(key: key);
  final String errMsg;
  static const String _title = 'Roles';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: StatefulRolesWidget(errMsg: errMsg,),
    );
  }
}

class StatefulRolesWidget extends StatefulWidget {
  const StatefulRolesWidget({Key? key, required this.errMsg}) : super(key: key);
  final String errMsg;

  @override
  // ignore: no_logic_in_create_state
  State<StatefulRolesWidget> createState() => _StatefulRolesWidget(errMsg: errMsg);
}

class _StatefulRolesWidget extends State<StatefulRolesWidget> {
  _StatefulRolesWidget({required this.errMsg});
  final String errMsg;
  final ApiService api = ApiService();
  late List<Roles> roles = [];

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

  Future<Response> get listRoles async {
    EasyLoading.show();
    return await api.getRoleList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 252, 142, 54),
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Color.fromARGB(255, 26, 255, 1)),
        title: const Text(
          'Roles',
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
          onPressed: () =>
              Navigator.pushReplacement(context, SlideRightRoute(page: const HomeScreen(errMsg: '',))),
        ),
      ),
      body: Center(
      child: FutureBuilder(
        future: listRoles,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            Response resp = snapshot.data as Response;
            if (resp.statusCode == 200) {
              EasyLoading.dismiss();
              final jsonMap = json.decode(resp.body);
              roles = (jsonMap as List)
                  .map((roleItem) => Roles.fromJson(roleItem))
                  .toList();
              return roles.isNotEmpty
                  ? Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 10.0, horizontal: 10.0),
                child: RoleListWidget(roles: roles),
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
                        builder: (context) => const HomeScreen(errMsg: 'Permission Denied',)));
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
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const AddRoleScreen()));
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
        backgroundColor: const Color.fromARGB(255, 0, 0, 0),
      ),
    );
  }
}