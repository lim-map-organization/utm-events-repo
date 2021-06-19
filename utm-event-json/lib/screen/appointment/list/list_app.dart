import 'dart:async';
import 'package:baoren_workplace/model/appointment.dart';
import 'package:baoren_workplace/model/user.dart';
import 'package:baoren_workplace/screen/appointment/list/body.dart';
import 'package:baoren_workplace/screen/appointment/widget/bar.dart';
import 'package:baoren_workplace/service/app_service.dart';
import 'package:flutter/material.dart';

class AppList extends StatefulWidget {
  //const AppList({ Key? key }) : super(key: key);
  static Route route({add = true, user}) =>
      MaterialPageRoute(builder: (context) => AppList(add: add, user: user));

  bool _add;
  final User _user;

  get add => _add;
  get user => _user;

  AppList({add, user})
      : _add = add,
        _user = user;

  @override
  AppListState createState() => AppListState();
}

class AppListState extends State<AppList> {
  bool isFirst = true;

  List<Appointment> _appList;
  get appList => _appList;
  set appList(value) => _appList = value;

  Future<List<Appointment>> _appListFuture;
  get appListFuture => _appListFuture;
  set appListFuture(value) => _appListFuture = value;

  @override
  void initState() {
    super.initState();
    if(widget.user.identity == "student"){
      _appListFuture = AppService.getAppointmentListByUser(widget._user.id);
    }
    else{
      _appListFuture = AppService.getAppointmentListByStaff(widget.user.id);
    }
    if (widget.add && isFirst) {
      startTime();
    }
  }

  void addAppointment(Appointment app) async {
    if (widget.user != null) {
      app.user = widget.user.id;
      final Appointment _app = await AppService.addAppointment(app);
      setState(() {
        _appList.add(_app);
      });
    }
  }

  void updateApp({int index, Appointment app}) async {
    app.user = widget.user.id;
    //app.id = index;
    Appointment _app = await AppService.updateAppointment(app);
    setState(() {
      _appList[index] = _app;
    });
    print("Updated");
  }

  void removeApp(int index) async {
    await AppService.removeAppointment(_appList[index]);
    setState(() {
      _appList.removeAt(index);
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
              appBar: Bar(title: "Appointment List"),
              body: Body(state: this),
            ),
          );
  }

  startTime() async {
    var duration = new Duration(seconds: 1);
    return new Timer(duration, route);
  }

  route() async {
    final _app = await Navigator.pushNamed(context, '/add-app');
    setState(() {
      isFirst = false;
    });
    if (_app != null) {
      addAppointment(_app);
    }
  }
}
