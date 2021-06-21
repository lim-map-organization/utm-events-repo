import 'package:flutter/material.dart';
import 'package:map_project/screens/Register/widgets/bar.dart';
import 'package:map_project/screens/Register/widgets/body.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Bar(),
      body: Body(),
    );
  }
}