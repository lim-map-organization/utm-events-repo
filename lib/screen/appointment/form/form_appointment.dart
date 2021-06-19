import 'package:baoren_workplace/model/user.dart';
import 'package:baoren_workplace/screen/appointment/form/body.dart';
import 'package:baoren_workplace/screen/appointment/widget/bar.dart';
import 'package:baoren_workplace/service/user_service.dart';
import 'package:flutter/material.dart';
class AppForm extends StatefulWidget {
  //const AppForm({ Key? key }) : super(key: key);
   static Route route() => MaterialPageRoute(
      builder: (context) => AppForm());

  @override
  AppFormState createState() => AppFormState();
}

class AppFormState extends State<AppForm> {

  String _appTitle = "";
  set appTitle(value) => setState(()=> _appTitle = value);
  get appTitle => _appTitle;

  String _appDate = "";
  set appDate(value) => setState(()=> _appDate = value);
  get appDate => _appDate;
  
  String _appTime = "";
  set appTime(value) => setState(()=> _appTime = value);
  get appTime => _appTime;

  String _appOrg = "School Of Computing";
  set appOrg(value) => setState(()=> _appOrg = value);
  get appOrg => _appOrg;

  String _appStaff;
  set appStaff(value) => setState(()=> _appStaff = value);
  get appStaff => _appStaff;

  String _appReason = "";
  set appReason(value) => setState(()=> _appReason = value);
  get appReason => _appReason;

  List<User> _staffList;
  get staffList => _staffList;
  set staffList(value) =>  _staffList = value;

  List<String> _staffListName = [];
  get staffListName => _staffListName;
  set staffListName(value) =>  _staffListName = value;

  @override
  void initState() {
    super.initState();
    UserService.getStaffsList().then((List<User> staffs){
      setState(() {
            staffList = staffs;
            appStaff = staffs[0].username;
          });
      //print("Home:$appStaff");
      staffList.forEach((item)=> staffListName.add(item.username));
      });
  }
  

  @override
  Widget build(BuildContext context) {
    
    return Container(
      child: SafeArea(
            child: Scaffold(
              appBar: Bar(title: "Add Appointment"),
              body: Padding(
                padding: const EdgeInsets.fromLTRB(30, 30, 30, 20),
                child: Body(state: this),
              ),
            ),
          ),
    );
  }
}