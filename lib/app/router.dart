import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:map_project/models/appinfo.dart';
import 'package:map_project/models/eventinfo.dart';
import 'package:map_project/screens/AppDetail/appdetail.dart';
import 'package:map_project/screens/AppList/applist.dart';
import 'package:map_project/screens/AppointmentForm/appform.dart';
import 'package:map_project/screens/EventDetail/eventdetail.dart';
import 'package:map_project/screens/EventForm/eventform.dart';
import 'package:map_project/screens/EventList/evenlist.dart';
import 'package:map_project/screens/Home/home.dart';
import 'package:map_project/screens/Login/login.dart';
import 'package:map_project/screens/Register/register.dart';
import 'route.dart';

Route<dynamic>? createRoute(settings) {
  switch (settings.name) {
    case initialScreen:
    case loginScreen:
      return MaterialPageRoute(
        builder: (context) => Login(),
      );
    case registerScreen:
      return MaterialPageRoute(
        builder: (context) => Register(),
      );
    case home:
      return MaterialPageRoute(
        builder: (context) => Home(),
      );
    case appForm:
      return MaterialPageRoute(
        builder: (context) => AppForm(),
      );
    case eventForm:
      return MaterialPageRoute(
        builder: (context) => EventForm(),
      );
    case appList:
      return MaterialPageRoute(
        builder: (context) => AppList(),
      );
    case eventList:
      return MaterialPageRoute(
        builder: (context) => EventList(),
      );
    case appDetail:
      return AppDetail.route(index: settings.arguments as int);
    case eventDetail:
      return EventDetail.route(data: settings.arguments as EventInfo);
  }
  return null;
}