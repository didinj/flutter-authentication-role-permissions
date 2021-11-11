import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth_roleperm/helpers/sliderightroute.dart';
import 'package:flutter_auth_roleperm/models/roles.dart';
import 'package:flutter_auth_roleperm/screens/roledetailsscreen.dart';
import 'package:flutter_auth_roleperm/screens/rolesscreen.dart';
import 'package:flutter_auth_roleperm/services/api_service.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class EditRoleScreen extends StatelessWidget {
  const EditRoleScreen({Key? key, required this.roles}) : super(key: key);
  final Roles roles;
  static const String _title = 'Edit Role';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: StatefulEditRoleWidget(roles: roles),
    );
  }
}

class StatefulEditRoleWidget extends StatefulWidget {
  const StatefulEditRoleWidget({Key? key, required this.roles}) : super(key: key);
  final Roles roles;

  @override
  // ignore: no_logic_in_create_state
  _EditRoleWidgetState createState() => _EditRoleWidgetState(roles: roles);
}

class _EditRoleWidgetState extends State<StatefulEditRoleWidget> {
  _EditRoleWidgetState({required this.roles});
  final Roles roles;
  final ApiService api = ApiService();
  final _editRoleFormKey = GlobalKey<FormState>();
  final _roleNameController = TextEditingController();
  final _roleDescriptionController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _roleNameController.text = roles.roleName.toString();
    _roleDescriptionController.text = roles.roleDescription.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 252, 142, 54),
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Color.fromARGB(255, 26, 255, 1)),
        title: const Text(
          'Edit Role',
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
              Navigator.pushReplacement(context, SlideRightRoute(page: RoleDetailsScreen(roles: roles, errMsg: '',))),
        ),

      ),
      body: SingleChildScrollView(
        child: Form(
          key: _editRoleFormKey,
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.fromLTRB(15, 80, 15, 20),
                child: Text(
                  'Please edit your role name and description',
                  overflow: TextOverflow.visible,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    height: 1.171875,
                    fontSize: 18.0,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w500,
                    color: Color.fromARGB(255, 0, 0, 0),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
                child: TextFormField(
                  controller: _roleNameController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your role name';
                    }
                    return null;
                  },
                  onChanged: (value) {},
                  autocorrect: true,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    errorStyle: TextStyle(color: Color.fromARGB(255, 26, 255, 1)),
                    fillColor: Color.fromARGB(255, 0, 0, 0),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                      borderSide: BorderSide(
                          color: Color.fromARGB(255, 128, 255, 0), width: 1),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                      borderSide: BorderSide(
                          color: Color.fromARGB(255, 128, 255, 0), width: 1),
                    ),
                    labelText: 'Role Name',
                    hintText: 'Role Name',
                    prefixIcon: Padding(
                      padding: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
                      child: Icon(
                        Icons.group_work,
                        color: Color.fromARGB(255, 128, 255, 0),
                        size: 24,
                      ),
                    ),
                    labelStyle: TextStyle(
                        height: 1.171875,
                        fontSize: 24.0,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w300,
                        color: Color.fromARGB(255, 128, 255, 0)),
                    hintStyle: TextStyle(
                        height: 1.171875,
                        fontSize: 24.0,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w300,
                        color: Color.fromARGB(255, 128, 255, 0)),
                    filled: true,
                  ),
                  style: const TextStyle(
                      color: Color.fromARGB(255, 128, 255, 0), fontSize: 24.0),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
                child: TextFormField(
                  controller: _roleDescriptionController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your role description';
                    }
                    return null;
                  },
                  onChanged: (value) {},
                  autocorrect: true,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    errorStyle: TextStyle(color: Color.fromARGB(255, 26, 255, 1)),
                    fillColor: Color.fromARGB(255, 0, 0, 0),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                      borderSide: BorderSide(
                          color: Color.fromARGB(255, 128, 255, 0), width: 1),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                      borderSide: BorderSide(
                          color: Color.fromARGB(255, 235, 235, 235), width: 1),
                    ),
                    labelText: 'Role Description',
                    hintText: 'Role Description',
                    prefixIcon: Padding(
                      padding: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
                      child: Icon(
                        Icons.text_fields,
                        color: Color.fromARGB(255, 128, 255, 0),
                        size: 24,
                      ),
                    ),
                    labelStyle: TextStyle(
                        height: 1.171875,
                        fontSize: 24.0,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w300,
                        color: Color.fromARGB(255, 128, 255, 0)),
                    hintStyle: TextStyle(
                        height: 1.171875,
                        fontSize: 24.0,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w300,
                        color: Color.fromARGB(255, 128, 255, 0)),
                    filled: true,
                  ),
                  style: const TextStyle(
                      color: Color.fromARGB(255, 128, 255, 0), fontSize: 24.0),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                child: SizedBox(
                  height: 60.0,
                  width: MediaQuery.of(context).size.width * 1.0,
                  child: ElevatedButton.icon(
                    icon: const Icon(
                      Icons.login,
                      color: Color.fromARGB(255, 0, 0, 0),
                      size: 24.0,
                    ),
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0),
                            side: const BorderSide(color: Color.fromARGB(255, 128, 255, 0), width: 1.0),
                          )),
                      backgroundColor: MaterialStateProperty.all<Color>(
                          const Color.fromARGB(255, 255, 200, 0)),
                    ),
                    onPressed: () async {
                      if (_editRoleFormKey.currentState!.validate()) {
                        _editRoleFormKey.currentState!.save();
                        EasyLoading.show();
                        var res = await api.updateRole(
                            roles.id, _roleNameController.text, _roleDescriptionController.text);

                        switch (res.statusCode) {
                          case 200:
                            EasyLoading.dismiss();
                            Navigator.pushReplacement(
                                context, SlideRightRoute(page: const RolesScreen(errMsg: 'Updated Successfully',)));
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
                              content: Text("Update Failed"),
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
                              content: Text("Update Failed"),
                            ));
                            break;
                        }
                      }
                    },
                    label: const Text('UPDATE',
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
      ),
    );
  }
}