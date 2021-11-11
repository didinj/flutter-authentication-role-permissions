import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth_roleperm/models/roles.dart';
import 'package:flutter_auth_roleperm/screens/roledetailsscreen.dart';

class RoleListWidget extends StatelessWidget {
  final List<Roles> roles;

  const RoleListWidget({Key? key, required this.roles}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: roles.isEmpty ? 0 : roles.length,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 0.0),
          child: Card(
            color: const Color.fromARGB(255, 252, 142, 54),
            shape: RoundedRectangleBorder(
              side: const BorderSide(
                  color: Color.fromARGB(255, 0, 0, 0), width: 1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          RoleDetailsScreen(roles: roles[index], errMsg: '',)),
                );
              },
              child: ListTile(
                leading: const Icon(
                  Icons.group_work,
                  size: 48,
                  color: Color.fromARGB(255, 0, 0, 0),
                ),
                title: Text(
                  roles[index].roleName.toString(),
                  style: const TextStyle(
                    fontFamily: 'Roboto',
                    color: Color.fromARGB(255, 0, 0, 0),
                  ),
                ),
                subtitle: Text(
                  roles[index].roleDescription.toString(),
                  style: const TextStyle(
                    fontFamily: 'Roboto',
                    color: Color.fromARGB(255, 0, 0, 0),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
