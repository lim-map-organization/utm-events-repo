import 'package:flutter/material.dart';
import 'package:mapproject/screens/AppointmentForm/widgets/bar.dart';
import 'package:mapproject/screens/AppointmentForm/widgets/body.dart';

class AppForm extends StatefulWidget {
  @override
  _AppFormState createState() => _AppFormState();
}

class _AppFormState extends State<AppForm> {
  DateTime pickedDate;
  void changeDate(date) {
    setState(() {
      pickedDate = date;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Bar(),
      body: Body(changeDate, pickedDate),
    );
  }
}