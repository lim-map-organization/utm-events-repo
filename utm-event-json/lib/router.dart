import 'package:baoren_workplace/model/appointment.dart';
import 'package:baoren_workplace/model/user.dart';
import 'package:baoren_workplace/screen/appointment/edit/edit_screen.dart';
import 'package:baoren_workplace/screen/appointment/form/form_appointment.dart';
import 'package:baoren_workplace/screen/appointment/list/list_app.dart';
import 'package:baoren_workplace/screen/authenticate/register/register_screen.dart';
import 'package:baoren_workplace/screen/event/edit/edit_screen.dart';
import 'package:baoren_workplace/screen/event/form/form_event.dart';
import 'package:baoren_workplace/screen/event/list/list_event.dart';
import 'package:flutter/material.dart';
import 'screen/authenticate/login/login_screen.dart';
import 'screen/wrapper/wrapper.dart';


Route<dynamic> createRoute(settings) {
  switch (settings.name) {

    case '/':
    case '/wrapper':
      return Wrapper.route();
    
    case '/login':
      return LoginScreen.route();

    case '/register':
      return RegisterScreen.route();
    
    case '/app-list':
      return AppList.route(add: false, user: settings.arguments as User);

    case '/app-form':
      return AppList.route(add: true, user: settings.arguments as User);
    
    case '/app-edit':
      return EditApp.route(list: settings.arguments as List);
    
    case '/add-app':
      return AppForm.route();

    case '/event-list':
      return EventList.route(add: false, user: settings.arguments as User);

    case '/event-form':
      return EventList.route(add: true, user: settings.arguments as User);
    
    case '/event-edit':
      return EditEvent.route(list: settings.arguments as List);
    
    case '/add-event':
      return EventForm.route();

    // case '/edit':
    //   return EditScreen.route(
    //       isEditing: true, data: settings.arguments as Todo);
  }
  return null;
}
