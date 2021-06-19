import 'package:baoren_workplace/model/user.dart';
import 'package:baoren_workplace/screen/event/form/body.dart';
import 'package:baoren_workplace/screen/event/widget/bar.dart';
import 'package:flutter/material.dart';
class EventForm extends StatefulWidget {
  //const EventForm({ Key? key }) : super(key: key);
   static Route route() => MaterialPageRoute(
      builder: (context) => EventForm());

  @override
  EventFormState createState() => EventFormState();
}

class EventFormState extends State<EventForm> {

  String _eventTitle = "";
  set eventTitle(value) => setState(()=> _eventTitle = value);
  get eventTitle => _eventTitle;

  String _eventDate = "";
  set eventDate(value) => setState(()=> _eventDate = value);
  get eventDate => _eventDate;

  String _eventVenue = "";
  set eventVenue(value) => setState(()=> _eventVenue = value);
  get eventVenue => _eventVenue;
  
  String _eventTimeslot = "Whole Day";
  set eventTimeslot(value) => setState(()=> _eventTimeslot = value);
  get eventTimeslot => _eventTimeslot;

  String _eventOrg = "School Of Computing";
  set eventOrg(value) => setState(()=> _eventOrg = value);
  get eventOrg => _eventOrg;

  String _eventLetter;
  set eventLetter(value) => setState(()=> _eventLetter = value);
  get eventLetter => _eventLetter;

  String _eventPhone = "";
  set eventPhone(value) => setState(()=> _eventPhone = value);
  get eventPhone => _eventPhone;

  // List<User> _staffList;
  // get staffList => _staffList;
  // set staffList(value) =>  _staffList = value;

  // List<String> _staffListName = [];
  // get staffListName => _staffListName;
  // set staffListName(value) =>  _staffListName = value;

  // @override
  // void initState() {
  //   super.initState();
  //   UserService.getStaffsList().then((List<User> staffs){
  //     setState(() {
  //           staffList = staffs;
  //           appStaff = staffs[0].username;
  //         });
  //     //print("Home:$appStaff");
  //     staffList.forEach((item)=> staffListName.add(item.username));
  //     });
  // }
  

  @override
  Widget build(BuildContext context) {
    
    return Container(
      child: SafeArea(
            child: Scaffold(
              appBar: Bar(title: "Add Event"),
              body: Padding(
                padding: const EdgeInsets.fromLTRB(30, 30, 30, 20),
                child: Body(state: this,),
              ),
            ),
          ),
    );
  }
}