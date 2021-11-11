import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth_roleperm/helpers/sliderightroute.dart';
import 'package:flutter_auth_roleperm/screens/loginscreen.dart';
import 'package:flutter_auth_roleperm/screens/productsscreen.dart';
import 'package:flutter_auth_roleperm/screens/rolesscreen.dart';
import 'package:flutter_auth_roleperm/screens/usersscreen.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key, required this.errMsg}) : super(key: key);
  final String errMsg;
  static const String _title = 'Home';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: StatefulHomeWidget(errMsg: errMsg,),
    );
  }
}

class StatefulHomeWidget extends StatefulWidget {
  const StatefulHomeWidget({Key? key, required this.errMsg}) : super(key: key);
  final String errMsg;

  @override
  // ignore: no_logic_in_create_state
  State<StatefulHomeWidget> createState() => _StatefulHomeWidget(errMsg: errMsg);
}

class _StatefulHomeWidget extends State<StatefulHomeWidget> {
  _StatefulHomeWidget({required this.errMsg});
  final String errMsg;
  final storage = const FlutterSecureStorage();

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
          'Flutter Auth Role',
          style: TextStyle(
            height: 1.171875,
            fontSize: 18.0,
            fontFamily: 'Roboto Condensed',
            fontWeight: FontWeight.w500,
            color: Color.fromARGB(255, 26, 255, 1),
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 0, 0, 0),
      ),
      drawer: Drawer(
        child: Container(
          color: const Color.fromARGB(255, 252, 142, 54),
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              const DrawerHeader(
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 0, 0, 0),
                ),
                child: Center(
                  child: Text(
                    'MENU',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      height: 1.171875,
                      fontSize: 18.0,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w500,
                      color: Color.fromARGB(255, 26, 255, 1),
                    ),
                  ),
                ),
              ),
              Container(
                decoration: const BoxDecoration(
                  border: Border(
                    left: BorderSide(width: 6.0, color: Color.fromARGB(255, 0, 0, 0)),
                    bottom: BorderSide(width: 1.0, color: Color.fromARGB(255, 0, 0, 0)),
                  ),
                ),
                child: ListTile(
                  title: const Text(
                    'Users',
                    style: TextStyle(
                      height: 1.171875,
                      fontSize: 18.0,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w500,
                      color: Color.fromARGB(255, 26, 255, 1),
                    ),
                  ),
                  onTap: () {
                    Navigator.push(context,
                        SlideRightRoute(page: const UsersScreen(errMsg: '',)));
                  },
                ),
              ),
              Container(
                decoration: const BoxDecoration(
                  border: Border(
                    left: BorderSide(width: 6.0, color: Color.fromARGB(255, 0, 0, 0)),
                    bottom: BorderSide(width: 1.0, color: Color.fromARGB(255, 0, 0, 0)),
                  ),
                ),
                child: ListTile(
                  title: const Text(
                    'Roles',
                    style: TextStyle(
                      height: 1.171875,
                      fontSize: 18.0,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w500,
                      color: Color.fromARGB(255, 26, 255, 1),
                    ),
                  ),
                  onTap: () {
                    Navigator.push(context,
                        SlideRightRoute(page: const RolesScreen(errMsg: '',)));
                  },
                ),
              ),
              // Container(
              //   decoration: const BoxDecoration(
              //     border: Border(
              //       left: BorderSide(width: 6.0, color: Color.fromARGB(255, 0, 0, 0)),
              //       bottom: BorderSide(width: 1.0, color: Color.fromARGB(255, 0, 0, 0)),
              //     ),
              //   ),
              //   child: ListTile(
              //     title: const Text(
              //       'Permissions',
              //       style: TextStyle(
              //         height: 1.171875,
              //         fontSize: 18.0,
              //         fontFamily: 'Roboto',
              //         fontWeight: FontWeight.w500,
              //         color: Color.fromARGB(255, 26, 255, 1),
              //       ),
              //     ),
              //     onTap: () {
              //       Navigator.push(context,
              //           SlideRightRoute(page: const PermissionsScreen()));
              //     },
              //   ),
              // ),
              Container(
                decoration: const BoxDecoration(
                  border: Border(
                    left: BorderSide(width: 6.0, color: Color.fromARGB(255, 0, 0, 0)),
                    bottom: BorderSide(width: 1.0, color: Color.fromARGB(255, 0, 0, 0)),
                  ),
                ),
                child: ListTile(
                  title: const Text(
                    'Products',
                    style: TextStyle(
                      height: 1.171875,
                      fontSize: 18.0,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w500,
                      color: Color.fromARGB(255, 26, 255, 1),
                    ),
                  ),
                  onTap: () {
                    Navigator.push(context,
                        SlideRightRoute(page: const ProductsScreen(errMsg: '',)));
                  },
                ),
              ),
              Container(
                decoration: const BoxDecoration(
                  border: Border(
                    left: BorderSide(width: 6.0, color: Color.fromARGB(255, 0, 0, 0)),
                    bottom: BorderSide(width: 1.0, color: Color.fromARGB(255, 0, 0, 0)),
                  ),
                ),
                child: ListTile(
                  title: const Text(
                    'Logout',
                    style: TextStyle(
                      height: 1.171875,
                      fontSize: 18.0,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w500,
                      color: Color.fromARGB(255, 26, 255, 1),
                    ),
                  ),
                  onTap: () async {
                    await storage.deleteAll();
                    Navigator.push(context,
                        SlideRightRoute(page: const LoginScreen(errMsg: 'User logged out',)));
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      body: const Center(
        child: Text(
          'Welcome Home!\nThis is the Role Based Authentication\nwith Permissions Apps',
          textAlign: TextAlign.center,
          overflow: TextOverflow.visible,
          style: TextStyle(
            height: 1.171875,
            fontSize: 18.0,
            fontFamily: 'Roboto',
            fontWeight: FontWeight.w500,
            color: Color.fromARGB(255, 0, 0, 0),
          ),
        ),
      ),
    );
  }
}
