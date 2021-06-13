import 'package:flutter/material.dart';
import 'package:mapproject/screens/StaffHome/widgets/bar.dart';
import 'package:mapproject/screens/StaffHome/widgets/body.dart';
import 'package:mapproject/screens/StaffHome/widgets/drawer.dart';

class StaffHome extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<StaffHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Bar(),
      body: Body(),
      drawer: DrawerWidget(),
    );
  }
}