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
            'BOOK NEW APPOINTMENT',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 25.0,
            ),
          ),
          SizedBox(height: 5.0),
          Text(
            'WE ARRANGE FOR YOU',
            style: TextStyle(
              color: Colors.grey
            ),
          ),
          SizedBox(height: 5.0,),
          TextFormField(
            decoration: InputDecoration(
              hintText: 'Appointment Title',
              labelText: 'Title',
            ),
            onChanged: (val) {},
          ),
          DropdownButtonFormField(
            decoration: const InputDecoration(
              labelText: 'Faculty/School',
              hintText: "Pick staff's school.",
            ),
            items: [
              DropdownMenuItem(
                child: Text('School of Computing'),
                value: 1,
              ),
              DropdownMenuItem(
                child: Text('School of Civil Engineering'),
                value: 2,
              ),
              DropdownMenuItem(
                child: Text('School of Electrical Engineering'),
                value: 3,
              ),
              DropdownMenuItem(
                child: Text('School of Mechanical Engineering'),
                value: 4,
              ),
              DropdownMenuItem(
                child: Text('School of Chemical and Energy Engineering'),
                value: 5,
              ),
              DropdownMenuItem(
                child: Text('School of Biosciences & Medical Engineering'),
                value: 6,
              ),
            ],
            onChanged: (val) {},
          ),
          DropdownButtonFormField(
            decoration: const InputDecoration(
              labelText: 'Staff Name',
              hintText: 'Pick staff name.',
            ),
            items: [
              DropdownMenuItem(
                child: Text('Dr. Jumail'),
                value: 1,
              ),
              DropdownMenuItem(
                child: Text('Dr. Noraini'),
                value: 2,
              ),
            ],
            onChanged: (val) {},
          ),
          TextFormField(
            minLines: 3,
            maxLines: 3,
            decoration: InputDecoration(
              hintText: 'Give the best reason to convience the lecturer',
              labelText: 'Details',
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
                    child: Text('ADD APPOINTMENT'),
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