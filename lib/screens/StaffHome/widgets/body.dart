import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Widget> functions = [
    Row(
      children: <Widget>[
        Icon(Icons.calendar_today, size: MediaQuery.of(context).size.width / 6, color: Colors.blue,),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Manage Events',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15.0,
                ),
              ),
              Text(
                'Accept/Reject the event application made by students.',
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
        Icon(Icons.alarm, size: MediaQuery.of(context).size.width / 6, color: Colors.yellow,),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Manage Appointment List',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15.0,
                ),
              ),
              Text(
                'Accept/Reject the appointment made by students.',
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
              'Hi, TAN JUN HAN',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25.0,
              ),
            ),
            SizedBox(height: 5.0),
            Text(
              'Staff | School of Computing',
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