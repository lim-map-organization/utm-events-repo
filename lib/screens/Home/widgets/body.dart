import 'package:flutter/material.dart';
import 'package:map_project/app/dependencies.dart';
import 'package:map_project/app/route.dart';
import 'package:map_project/screens/AppList/applist_viewmodel.dart';
import 'package:map_project/screens/EventList/eventlist_viewmodel.dart';
import 'package:map_project/screens/Home/home_viewmodel.dart';
import 'package:map_project/screens/user/user_viewmodel.dart';
import 'package:map_project/screens/view.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Widget> functions = [
      InkWell(
        child: Row(
          children: <Widget>[
            Icon(Icons.calendar_today, size: MediaQuery.of(context).size.width / 6, color: Colors.blue,),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Add New Event',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15.0,
                    ),
                  ),
                  Text(
                    'Apply an event application to get permission from UTM staff.',
                    style: TextStyle(
                      color: Colors.grey,
                      fontStyle: FontStyle.italic,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
        onTap: () {
          Navigator.pushNamed(context, eventForm);
        },
      ),
      InkWell(
        child: Row(
          children: <Widget>[
            Icon(Icons.alarm, size: MediaQuery.of(context).size.width / 6, color: Colors.yellow,),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Add New Appointment',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15.0,
                    ),
                  ),
                  Text(
                    'Apply an appointment application to get permission from UTM staff.',
                    style: TextStyle(
                      color: Colors.grey,
                      fontStyle: FontStyle.italic,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
        onTap: () {
          Navigator.pushNamed(context, appForm);
        },
      ),
      InkWell(
        child: Row(
          children: <Widget>[
            Icon(Icons.event, size: MediaQuery.of(context).size.width / 6, color: Colors.purple,),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'View Event List',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15.0,
                    ),
                  ),
                  Text(
                    'View all event application information made.',
                    style: TextStyle(
                      color: Colors.grey,
                      fontStyle: FontStyle.italic,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
        onTap: () {
          Navigator.pushNamed(context, eventList);
        },
      ),
      InkWell(
        child: Row(
          children: <Widget>[
            Icon(Icons.schedule, size: MediaQuery.of(context).size.width / 6, color: Colors.green,),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'View Appointment List',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15.0,
                    ),
                  ),
                  Text(
                    'View all appointment application information made.',
                    style: TextStyle(
                      color: Colors.grey,
                      fontStyle: FontStyle.italic,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
        onTap: () {
          Navigator.pushNamed(context, appList);
        },
      ),
    ];
    return View(
      viewmodel: HomeViewmodel(),
      progressBuilder: (context, viewmodel) => Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Center (child: CircularProgressIndicator()),
      ),
      builder: (context, viewmodel, progressBuilder) => SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Hi, ${viewmodel.user.name}',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25.0,
                ),
              ),
              SizedBox(height: 5.0),
              Text(
                '${viewmodel.user.role} | ${viewmodel.user.faculty}',
                style: TextStyle(
                  color: Colors.grey
                ),
              ),
              SizedBox(height: 5.0),
              ListView.separated(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: functions.length,
                separatorBuilder: (context, index) => Divider(),
                itemBuilder: (context, index) {
                  return functions[index];
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}