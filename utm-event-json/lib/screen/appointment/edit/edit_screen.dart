import 'package:baoren_workplace/model/appointment.dart';
import 'package:baoren_workplace/model/user.dart';
import 'package:baoren_workplace/screen/appointment/edit/body.dart';
import 'package:baoren_workplace/screen/appointment/widget/bar.dart';
import 'package:baoren_workplace/service/user_service.dart';
import 'package:flutter/material.dart';
class EditApp extends StatefulWidget {
  //const EditApp({ Key? key }) : super(key: key);
   static Route route({list}) =>
      MaterialPageRoute(builder: (context) => EditApp(user: list[0], app: list[1]));

  final User _user;
  final Appointment _app;
  get app => _app;
  get user => _user;

  EditApp({user,app})
      : _user = user,
        _app = app;


  @override
  EditAppState createState() => EditAppState();
}

class EditAppState extends State<EditApp> {

  String _staffName;
  set staffName(value) => setState(()=> _staffName = value);
  get staffName => _staffName;
  
  @override
  void initState() {
    super.initState();
    UserService.getStaffsList().then((List<User> staffs){

      for(User staff in staffs){
        print(staff);
        if(staff.id == widget.app.staff){
          staffName = staff.username;
        }
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      child:SafeArea(
        child: Scaffold(
          appBar: (widget.user.identity == "student")? Bar(title: "Attend Appointment",): Bar(title: "Manage Appointment",),
          body: Padding(
            padding: const EdgeInsets.fromLTRB(30, 30, 30, 20),
            child: Body(state: this),
          ),
        ),
      ),
    );
  }
}