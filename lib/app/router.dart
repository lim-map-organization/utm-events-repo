import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mapproject/screens/AppointmentForm/appform.dart';
import 'package:mapproject/screens/EventForm/eventform.dart';
import 'package:mapproject/screens/StaffHome/home.dart';
import 'package:mapproject/screens/Login/login.dart';
import 'package:mapproject/screens/Register/register.dart';
import 'package:mapproject/screens/StudentHome/home.dart';
import 'route.dart';

Route<dynamic> createRoute(settings) {
  switch (settings.name) {
    case initialScreen:
    case loginScreen:
      return MaterialPageRoute(
        builder: (context) => Login(),
      );
      break;
    case registerScreen:
      return MaterialPageRoute(
        builder: (context) => Register(),
      );
      break;
    case studentHome:
      return MaterialPageRoute(
        builder: (context) => Home(),
      );
      break;
    case staffHome:
      return MaterialPageRoute(
        builder: (context) => StaffHome(),
      );
      break;
    case appForm:
      return MaterialPageRoute(
        builder: (context) => AppForm(),
      );
      break;
    case eventForm:
      return MaterialPageRoute(
        builder: (context) => EventForm(),
      );
      break;
  }
  return null;
}