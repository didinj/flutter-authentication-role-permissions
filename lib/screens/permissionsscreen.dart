import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth_roleperm/helpers/sliderightroute.dart';
import 'package:flutter_auth_roleperm/screens/homescreen.dart';

class PermissionsScreen extends StatelessWidget {
  const PermissionsScreen({Key? key}) : super(key: key);
  static const String _title = 'Permissions';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: _title,
      home: StatefulPermissionsWidget(),
    );
  }
}

class StatefulPermissionsWidget extends StatefulWidget {
  const StatefulPermissionsWidget({Key? key}) : super(key: key);

  @override
  State<StatefulPermissionsWidget> createState() => _StatefulPermissionsWidget();
}

class _StatefulPermissionsWidget extends State<StatefulPermissionsWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 252, 142, 54),
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Color.fromARGB(255, 26, 255, 1)),
        title: const Text(
          'Permissions',
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
      body: const Center(
        child: Text(
          'Permissions Management',
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