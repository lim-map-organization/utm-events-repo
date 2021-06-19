import 'dart:async';
import 'package:baoren_workplace/model/event.dart';
import 'package:baoren_workplace/model/user.dart';
import 'package:baoren_workplace/screen/event/list/body.dart';
import 'package:baoren_workplace/screen/event/widget/bar.dart';
import 'package:baoren_workplace/service/event_service.dart';
import 'package:flutter/material.dart';

class EventList extends StatefulWidget {
  //const EventList({ Key? key }) : super(key: key);
  static Route route({add = true, user}) =>
      MaterialPageRoute(builder: (context) => EventList(add: add, user: user));

  bool _add;
  final User _user;

  get add => _add;
  get user => _user;

  EventList({add, user})
      : _add = add,
        _user = user;

  @override
  EventListState createState() => EventListState();
}

class EventListState extends State<EventList> {
  bool isFirst = true;

  List<Event> _eventList;
  get eventList => _eventList;
  set eventList(value) => _eventList = value;

  Future<List<Event>> _eventListFuture;
  get eventListFuture => _eventListFuture;
  set eventListFuture(value) => _eventListFuture = value;

  @override
  void initState() {
    super.initState();
    if(widget.user.identity == "student"){
      _eventListFuture = EventService.getEventListByUser(widget._user.id);
    }
    else{
      _eventListFuture = EventService.getEventList();
    }
    if (widget.add && isFirst) {
      startTime();
    }
  }

  void addEvent(Event event) async {
    if (widget.user != null) {
      event.user = widget.user.id;
      final Event _event = await EventService.addEvent(event);
      setState(() {
        eventList.add(_event);
      });
    }
  }

  void updateEvent({int index, Event event}) async {
    //event.user = widget.user.id;
    //app.id = index;
    Event _event = await EventService.updateEvent(event);
    setState(() {
      _eventList[index] = _event;
    });
    print("Updated");
  }

  void removeEvent(int index) async {
    await EventService.removeEvent(_eventList[index]);
    setState(() {
      _eventList.removeAt(index);
    });
  }

  // final Future<String> calculation = Future<String>.delayed(
  //     const Duration(seconds: 2),
  //     () => 'Data Loaded',
  //   );

  @override
  Widget build(BuildContext context) {
    return (widget.add && isFirst)
        ? Scaffold(
            body: Center(child: CircularProgressIndicator()),
          )
        : SafeArea(
            child: Scaffold(
              appBar: Bar(title: "Event List"),
              body: Body(state: this),
            ),
          );
  }

  startTime() async {
    var duration = new Duration(seconds: 1);
    return new Timer(duration, route);
  }

  route() async {
    final _app = await Navigator.pushNamed(context, '/add-event');
    setState(() {
      isFirst = false;
    });
    if (_app != null) {
      addEvent(_app);
    }
  }
}
