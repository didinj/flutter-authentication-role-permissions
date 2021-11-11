import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth_roleperm/helpers/sliderightroute.dart';
import 'package:flutter_auth_roleperm/screens/rolesscreen.dart';
import 'package:flutter_auth_roleperm/services/api_service.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class AddRoleScreen extends StatelessWidget {
  const AddRoleScreen({Key? key}) : super(key: key);
  static const String _title = 'Add Role';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: _title,
      home: StatefulAddRoleWidget(),
    );
  }
}

class StatefulAddRoleWidget extends StatefulWidget {
  const StatefulAddRoleWidget({Key? key}) : super(key: key);

  @override
  // ignore: no_logic_in_create_state
  _AddRoleWidgetState createState() => _AddRoleWidgetState();
}

class _AddRoleWidgetState extends State<StatefulAddRoleWidget> {
  final ApiService api = ApiService();
  final _addRoleFormKey = GlobalKey<FormState>();
  final _roleNameController = TextEditingController();
  final _roleDescriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 252, 142, 54),
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Color.fromARGB(255, 26, 255, 1)),
        title: const Text(
          'Add Role',
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
              context, SlideRightRoute(page: const RolesScreen(errMsg: ''))),
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _addRoleFormKey,
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.fromLTRB(15, 80, 15, 20),
                child: Text(
                  'Please fill your role name and description',
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
                padding:
                const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
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
                  obscureText: true,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    errorStyle:
                    TextStyle(color: Color.fromARGB(255, 26, 255, 1)),
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
                padding:
                const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
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
                    errorStyle:
                    TextStyle(color: Color.fromARGB(255, 26, 255, 1)),
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
                padding:
                const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                child: SizedBox(
                  height: 60.0,
                  width: MediaQuery.of(context).size.width * 1.0,
                  child: ElevatedButton.icon(
                    icon: const Icon(
                      Icons.save,
                      color: Color.fromARGB(255, 0, 0, 0),
                      size: 24.0,
                    ),
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0),
                            side: const BorderSide(
                                color: Color.fromARGB(255, 128, 255, 0),
                                width: 1.0),
                          )),
                      backgroundColor: MaterialStateProperty.all<Color>(
                          const Color.fromARGB(255, 255, 200, 0)),
                    ),
                    onPressed: () async {
                      if (_addRoleFormKey.currentState!.validate()) {
                        _addRoleFormKey.currentState!.save();
                        EasyLoading.show();
                        var res = await api.addRole(
                            _roleNameController.text,
                            _roleDescriptionController.text);

                        switch (res.statusCode) {
                          case 201:
                            EasyLoading.dismiss();
                            Navigator.pushReplacement(
                                context, SlideRightRoute(page: const RolesScreen(errMsg: 'Role Added Successfully',)));
                            break;
                          case 400:
                            EasyLoading.dismiss();
                            var data = jsonDecode(res.body);
                            if (data["msg"]) {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                content: Text(data["msg"].toString()),
                              ));
                            }
                            ScaffoldMessenger.of(context)
                                .showSnackBar(const SnackBar(
                              content: Text("Failed to Add Role"),
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
                              content: Text("Failed to Add Role"),
                            ));
                            break;
                        }
                      }
                    },
                    label: const Text('SAVE',
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
