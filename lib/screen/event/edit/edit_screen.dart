import 'package:baoren_workplace/model/event.dart';
import 'package:baoren_workplace/model/user.dart';
import 'package:baoren_workplace/screen/event/edit/body.dart';
import 'package:baoren_workplace/screen/event/widget/bar.dart';
import 'package:flutter/material.dart';
class EditEvent extends StatefulWidget {
  //const EditEvent({ Key? key }) : super(key: key);
   static Route route({list}) =>
      MaterialPageRoute(builder: (context) => EditEvent(user: list[0], event: list[1]));

  final User _user;
  final Event _event;
  get event => _event;
  get user => _user;

  EditEvent({user,event})
      : _user = user,
        _event = event;


  @override
  EditEventState createState() => EditEventState();
}

class EditEventState extends State<EditEvent> {

  // String _staffName;
  // set staffName(value) => setState(()=> _staffName = value);
  // get staffName => _staffName;
  
  @override
  Widget build(BuildContext context) {
    return Container(
      child:SafeArea(
        child: Scaffold(
          appBar: (widget.user.identity == "student")? Bar(title: "Attend Event",): Bar(title: "Manage Event",),
          body: Padding(
            padding: const EdgeInsets.fromLTRB(30, 30, 30, 20),
            child: Body(state: this),
          ),
        ),
      ),
    );
  }
}