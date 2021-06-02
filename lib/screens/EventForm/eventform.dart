import 'package:flutter/material.dart';
import 'package:mapproject/screens/EventForm/widgets/bar.dart';
import 'package:mapproject/screens/EventForm/widgets/body.dart';

class EventForm extends StatefulWidget {
  @override
  _EventFormState createState() => _EventFormState();
}

class _EventFormState extends State<EventForm> {
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