import 'package:flutter/material.dart';
import 'package:map_project/screens/AppointmentForm/widgets/bar.dart';
import 'package:map_project/screens/AppointmentForm/widgets/body.dart';

class AppForm extends StatefulWidget {
  @override
  _AppFormState createState() => _AppFormState();
}

class _AppFormState extends State<AppForm> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Bar(),
      body: Body(),
    );
  }
}