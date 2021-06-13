import 'package:flutter/material.dart';

import 'package:mapproject/app/route.dart';

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
      onTap: () async{
        await Navigator.pushNamed(context, appForm);
      },
    ),
    Row(
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
    Row(
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
  ];
    return SingleChildScrollView(
        child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Hi, LIM BAO REN',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25.0,
              ),
            ),
            SizedBox(height: 5.0),
            Text(
              'Student | School of Computing',
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
    );
  }
}