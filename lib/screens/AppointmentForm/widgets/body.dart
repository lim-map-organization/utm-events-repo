import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:map_project/app/route.dart';
import 'package:map_project/models/users.dart';
import 'package:map_project/screens/AppointmentForm/appform_viewmodel.dart';
import 'package:map_project/screens/AppointmentForm/widgets/head.dart';
import 'package:map_project/screens/view.dart';

class Body extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return View(
      viewmodel: AppFormViewmodel(),
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
                  title: "Book Appointment",
                  desc: "we arrange for you",
                  image: "calender2.png",
                ),
                SizedBox(height: 5.0),
                _buildTextFormField(
                    hint: 'Appointment Title',
                    label: 'Title',
                    maxlines: 1,
                    minlines: 1,
                    onchanged: (val) {
                      viewmodel.title = val;
                    },
                    validator: (val) {
                      return val.length < 1 ? 'Title must be filled!' : null;
                    }),
                _buildDropDown(
                  label: 'Faculty/School',
                  hint: "Pick staff's school.",
                  validator: (val) {
                    return val == null ? 'Faculty must be selected!' : null;
                  },
                  onChanged: (val) {
                    viewmodel.userListByFac = viewmodel.getUsersByFac(val);
                    viewmodel.faculty = val;
                  },
                  items: [
                    DropdownMenuItem(
                      //child: Text('School of Computing'),
                      child: new Container(
                        width: 170.0,
                        child: new Text(
                          "School of Computing",
                          overflow: TextOverflow.visible,
                        ),
                      ),
                      value: 'School of Computing',
                    ),
                    DropdownMenuItem(
                      //child: Text('School of Civil Engineering'),
                      child: new Container(
                        width: 170.0,
                        child: new Text(
                          "School of Civil Engineering",
                          overflow: TextOverflow.visible,
                        ),
                      ),
                      value: 'School of Civil Engineering',
                    ),
                    DropdownMenuItem(
                      //child: Text('School of Electrical Engineering'),
                      child: new Container(
                        width: 170.0,
                        child: new Text(
                          "School of Electrical Engineering",
                          overflow: TextOverflow.visible,
                        ),
                      ),
                      value: 'School of Electrical Engineering',
                    ),
                    DropdownMenuItem(
                      //child: Text('School of Mechanical Engineering'),
                      child: new Container(
                        width: 170.0,
                        child: new Text(
                          "School of Mechanical Engineering",
                          overflow: TextOverflow.visible,
                        ),
                      ),
                      value: 'School of Mechanical Engineering',
                    ),
                    DropdownMenuItem(
                      //child: Text('School of Chemical and Energy Engineering'),
                      child: new Container(
                        width: 170.0,
                        child: new Text(
                          "School of Chemical and Energy Engineering",
                          overflow: TextOverflow.visible,
                        ),
                      ),
                      value: 'School of Chemical and Energy Engineering',
                    ),
                    DropdownMenuItem(
                      //child:
                      //    Text('School of Biosciences & Medical Engineering'),
                      child: new Container(
                        width: 170.0,
                        child: new Text(
                          "School of Biosciences & Medical Engineering",
                          overflow: TextOverflow.visible,
                        ),
                      ),
                      value: 'School of Biosciences & Medical Engineering',
                    ),
                  ],
                ),
                FutureBuilder<List<Users>?>(
                    future: viewmodel.userListByFac,
                    builder: (context, snapshot) {
                      return _buildDropDown(
                        label: 'Staff Name',
                        hint: 'Pick staff name.',
                        validator: (val) {
                          return val == null ? 'Staff must be selected!' : null;
                        },
                        onChanged: (val) {
                          viewmodel.staffid = val;
                        },
                        items: snapshot.hasData
                            ? snapshot.data!.map<DropdownMenuItem>((item) {
                                return DropdownMenuItem(
                                  child: Text('${item.name}'),
                                  value: item.id,
                                );
                              }).toList()
                            : null,
                      );
                    }),
                _buildTextFormField(
                    maxlines: 3,
                    minlines: 3,
                    hint: 'Give the best reason to convience the staff',
                    label: 'Details',
                    onchanged: (val) {
                      viewmodel.detail = val;
                    },
                    validator: (val) {
                      return val.length < 1 ? 'Detail must be filled!' : null;
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
                          DatePicker.showDateTimePicker(context,
                              showTitleActions: true,
                              minTime:
                                  DateTime.now().add(const Duration(days: 2)),
                              maxTime: DateTime(2040), onChanged: (date) {
                            viewmodel.date = date.year.toString() +
                                '/' +
                                date.month.toString() +
                                "/" +
                                date.day.toString() +
                                "  " +
                                date.hour.toString().padLeft(2, '0') +
                                ":" +
                                date.minute.toString().padLeft(2, '0');
                          });
                        }),
                    Text(
                      '${viewmodel.date}',
                    ),
                  ],
                ),
                SizedBox(height: 10.0),
                Row(children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 20),
                        ),
                        child: Text(
                          'ADD APPOINTMENT',
                          style: TextStyle(fontSize: 20),
                        ),
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            viewmodel.status = 'Pending';
                            viewmodel.appinfo.dateAndTime = viewmodel.date;
                            viewmodel.studentid = viewmodel.user;
                            final _result =
                                viewmodel.createApp(viewmodel.appinfo);
                            if (_result != null) {
                              Navigator.popAndPushNamed(context, appList);
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
      {label, hint, items, onChanged, validator, value}) {
    return DropdownButtonFormField(
        decoration: InputDecoration(
          labelText: label,
          hintText: hint,
        ),
        items: items,
        validator: validator,
        onChanged: onChanged,
        value: value);
  }

  TextFormField _buildTextFormField(
      {hint, label, onchanged, validator, minlines, maxlines}) {
    return TextFormField(
      decoration: InputDecoration(
        hintText: hint,
        labelText: label,
      ),
      onChanged: onchanged,
      validator: validator,
      minLines: minlines,
      maxLines: maxlines,
    );
  }
}
