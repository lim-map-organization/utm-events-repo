import 'package:flutter/material.dart';
import 'package:map_project/screens/EventForm/widgets/bar.dart';
import 'package:map_project/screens/EventForm/widgets/body.dart';

class EventForm extends StatefulWidget {
  @override
  _EventFormState createState() => _EventFormState();
}

class _EventFormState extends State<EventForm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Bar(),
      body: Body(),
    );
  }
}