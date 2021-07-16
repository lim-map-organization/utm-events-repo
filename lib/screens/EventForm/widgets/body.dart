import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:map_project/app/route.dart';
import 'package:map_project/screens/EventForm/eventform_viewmodel.dart';
import 'package:map_project/screens/EventForm/widgets/head.dart';
import 'package:map_project/screens/view.dart';

class Body extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return View(
      viewmodel: EventFormViewmodel(),
      progressBuilder: (context, viewmodel) => Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Center(child: CircularProgressIndicator()),
      ),
      builder: (context, viewmodel, progressBuilder) => SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(30, 30, 30, 20),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Head(
                  title: "Book Event Here",
                  desc: "Approve / Reject the event",
                  image: "event.png",
                ),
                SizedBox(
                  height: 5.0,
                ),
                _buildTextFormField(
                    hint: 'Event Name',
                    label: 'Event',
                    onchanged: (val) {
                      viewmodel.title = val;
                    },
                    
                    validator: (val) {
                      return val.length <= 1
                          ? 'Event name must be filled!'
                          : null;
                    }),
                _buildDropDown(
                  label: 'Venue',
                  hint: 'Pick venue',
                  onChanged: (val) {
                    viewmodel.venue = val;
                  },
                  validator: (val) {
                    return val == null ? 'Venue must be selected!' : null;
                  },
                  items: [
                    DropdownMenuItem(
                      child: Text('N24'),
                      value: 'N24',
                    ),
                    DropdownMenuItem(
                      child: Text('Sport Hall'),
                      value: 'Sport Hall',
                    ),
                  ],
                ),
                _buildDropDown(
                  label: 'Time Slot',
                  hint: 'Pick time slot.',
                  onChanged: (val) {
                    viewmodel.timeslot = val;
                  },
                  validator: (val) {
                    return val == null ? 'Timeslot must be selected!' : null;
                  },
                  items: [
                    DropdownMenuItem(
                      child: Text('Morning(7AM-12PM)'),
                      value: 'Morning(7AM-12PM)',
                    ),
                    DropdownMenuItem(
                      child: Text('Afternoon(1PM-6PM)'),
                      value: 'Afternoon(1PM-6PM)',
                    ),
                    DropdownMenuItem(
                      child: Text('Night(7PM-12AM)'),
                      value: 'Night(7PM-12AM)',
                    ),
                    DropdownMenuItem(
                      child: Text('Whole Day'),
                      value: 'Whole Day',
                    ),
                  ],
                ),
                _buildTextFormField(
                    hint: 'Organization Name',
                    label: 'Organization',
                    onchanged: (val) {
                      viewmodel.organization = val;
                    },
                    validator: (val) {
                      return val.length <= 1
                          ? 'Organization must be filled!'
                          : null;
                    }),
                _buildTextFormField(
                    hint: 'Official Letter Referral Code',
                    label: 'Code',
                    onchanged: (val) {
                      viewmodel.code = val;
                    },
                    validator: (val) {
                      return val.length <= 1 ? 'Code must be filled!' : null;
                    }),
                _buildTextFormField(
                    hint: 'Contact Number',
                    label: 'Contact',
                    onchanged: (val) {
                      viewmodel.contact = val;
                    },
                    validator: (val) {
                      return val.length < 10
                          ? 'Contact number must be at least 10 characters!'
                          : null;
                    }),
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
                          DatePicker.showDatePicker(context,
                              showTitleActions: true,
                              minTime:
                                  DateTime.now().add(const Duration(days: 2)),
                              maxTime: DateTime(2040), onChanged: (date) {
                            viewmodel.date = date.year.toString() +
                                '/' +
                                date.month.toString() +
                                "/" +
                                date.day.toString();
                          });
                        }),
                    Text('${viewmodel.date}'),
                  ],
                ),
                SizedBox(height: 10.0),
                Row(children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: ElevatedButton(
                        child: Text('ADD NEW EVENT',style: TextStyle(fontSize: 20.0),),
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 20),
                        ),
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            viewmodel.studentid = viewmodel.user;
                            viewmodel.eventinfo.dateAndTime = viewmodel.date;
                            viewmodel.status = 'Pending';
                            final _result =
                                viewmodel.createEvent(viewmodel.eventinfo);
                            if (_result != null) {
                              Navigator.popAndPushNamed(context, eventList);
                            }
                          }
                        },
                      ),
                    ),
                  ),
                ]),
              ],
            ),
          ),
        ),
      ),
    );
  }

  DropdownButtonFormField _buildDropDown(
      {label, hint, items, onChanged, validator}) {
    return DropdownButtonFormField(
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
      ),
      items: items,
      validator: validator,
      onChanged: onChanged,
    );
  }

  TextFormField _buildTextFormField({hint, label, onchanged, validator}) {
    return TextFormField(
        decoration: InputDecoration(
          hintText: hint,
          labelText: label,
        ),
        onChanged: onchanged,
        validator: validator);
  }
}
