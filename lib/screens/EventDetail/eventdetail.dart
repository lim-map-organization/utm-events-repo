import 'package:flutter/material.dart';
import 'package:map_project/models/eventinfo.dart';
import 'package:map_project/screens/EventDetail/widgets/bar.dart';
import 'package:map_project/screens/EventDetail/widgets/body.dart';

class EventDetail extends StatefulWidget {
  static Route route({data}) => MaterialPageRoute(
      builder: (context) => EventDetail(event: data,));
  final EventInfo event;
  EventDetail({required this.event});
  @override
  _EventDetailState createState() => _EventDetailState();
}

class _EventDetailState extends State<EventDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Bar(),
      body: Body(event: widget.event),
    );
  }
}