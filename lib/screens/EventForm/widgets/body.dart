import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

class Body extends StatelessWidget {
  final Function changeDate;
  final DateTime pickedDate;
  Body(this.changeDate, this.pickedDate);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'BOOK EVENT HERE',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 25.0,
            ),
          ),
          SizedBox(height: 5.0),
          Text(
            'ENTER THE EVENT DETAILS',
            style: TextStyle(
              color: Colors.grey
            ),
          ),
          SizedBox(height: 5.0,),
          TextFormField(
            decoration: InputDecoration(
              hintText: 'Event Name',
              labelText: 'Event Name',
            ),
            onChanged: (val) {},
          ),
          DropdownButtonFormField(
            decoration: const InputDecoration(
              labelText: 'Venue',
              hintText: "Pick venue",
            ),
            items: [
              DropdownMenuItem(
                child: Text('N24'),
                value: 1,
              ),
              DropdownMenuItem(
                child: Text('Sport Hall'),
                value: 2,
              ),
            ],
            onChanged: (val) {},
          ),
          DropdownButtonFormField(
            decoration: const InputDecoration(
              labelText: 'Time Slot',
              hintText: 'Pick time slot.',
            ),
            items: [
              DropdownMenuItem(
                child: Text('Morning(7AM-12PM)'),
                value: 1,
              ),
              DropdownMenuItem(
                child: Text('Afternoon(1PM-6PM)'),
                value: 2,
              ),
              DropdownMenuItem(
                child: Text('Night(7PM-12AM)'),
                value: 3,
              ),
              DropdownMenuItem(
                child: Text('Whole Day'),
                value: 4,
              ),
            ],
            onChanged: (val) {},
          ),
          TextFormField(
            decoration: InputDecoration(
              hintText: 'Organization Name',
              labelText: 'Organization',
            ),
            onChanged: (val) {},
          ),
          TextFormField(
            decoration: InputDecoration(
              hintText: 'Official Letter Referral Code',
              labelText: 'Code',
            ),
            onChanged: (val) {},
          ),
          TextFormField(
            decoration: InputDecoration(
              hintText: 'Contact Number',
              labelText: 'Contact',
            ),
            onChanged: (val) {},
          ),
          SizedBox(height: 5.0),
          Text(
            'Pick date & time',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.grey,
            ),
          ),
          Row(
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.calendar_today),
                onPressed: () {
                  DatePicker.showDateTimePicker(
                    context,
                    showTitleActions: true,
                    minTime: DateTime.now(),
                    maxTime: DateTime(2040),
                    onChanged: (date) {
                      changeDate(date);
                    }
                  );
                }
              ),
              pickedDate != null ? Text(
                '$pickedDate',
              ) : Text('')
            ],
          ),
          SizedBox(height: 10.0),
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: ElevatedButton(
                    child: Text('ADD NEW EVENT'),
                    onPressed: () {},
                  ),
                ),
              ),
            ]
          ),
        ],
      ),
    );
  }
}