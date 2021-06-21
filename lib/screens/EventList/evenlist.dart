import 'package:flutter/material.dart';
import 'package:map_project/screens/EventList/widgets/bar.dart';
import 'package:map_project/screens/EventList/widgets/body.dart';

class EventList extends StatefulWidget {

  @override
  _EventListState createState() => _EventListState();
}

class _EventListState extends State<EventList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Bar(),
      body: Body(),
    );
  }
}