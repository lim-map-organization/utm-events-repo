import 'package:flutter/material.dart';
import 'package:mapproject/screens/StudentHome/widgets/bar.dart';
import 'package:mapproject/screens/StudentHome/widgets/body.dart';
import 'package:mapproject/screens/StudentHome/widgets/drawer.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => Future.value(false),
      child: SafeArea(
        child: Scaffold(
          appBar: Bar(),
          body: Body(),
          drawer: DrawerWidget(),
        ),
      ),
    );
  }
}