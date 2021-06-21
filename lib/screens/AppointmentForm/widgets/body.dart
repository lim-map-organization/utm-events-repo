import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:map_project/app/route.dart';
import 'package:map_project/screens/AppointmentForm/appform_viewmodel.dart';
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
        child: Center (child: CircularProgressIndicator()),
      ),
      builder: (context, viewmodel, progressBuilder) => SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
              key: _formKey,
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
                _buildTextFormField(
                  hint: 'Appointment Title',
                  label: 'Title',
                  maxlines: 1,
                  minlines: 1,
                  onchanged: (val) {
                    viewmodel.title = val;
                  },
                  validator: (val) {
                    return val.length >= 1  ? 'Title must be filled!' : null;
                  }
                ),
                _buildDropDown(
                  label: 'Faculty/School',
                  hint: "Pick staff's school.",
                  validator: (val) {
                    return val == null ? 'Faculty must be selected!' : null;
                  },
                  onChanged: (val) async {
                    viewmodel.userListByFac = await viewmodel.getUsersByFac(val);
                    viewmodel.faculty = val;
                  },
                  items: [
                    DropdownMenuItem(
                      child: Text('School of Computing'),
                      value: 'School of Computing',
                    ),
                    DropdownMenuItem(
                      child: Text('School of Civil Engineering'),
                      value: 'School of Civil Engineering',
                    ),
                    DropdownMenuItem(
                      child: Text('School of Electrical Engineering'),
                      value: 'School of Electrical Engineering',
                    ),
                    DropdownMenuItem(
                      child: Text('School of Mechanical Engineering'),
                      value: 'School of Mechanical Engineering',
                    ),
                    DropdownMenuItem(
                      child: Text('School of Chemical and Energy Engineering'),
                      value: 'School of Chemical and Energy Engineering',
                    ),
                    DropdownMenuItem(
                      child: Text('School of Biosciences & Medical Engineering'),
                      value: 'School of Biosciences & Medical Engineering',
                    ),
                  ],
                ),
                _buildDropDown(
                  label: 'Staff Name',
                  hint: 'Pick staff name.',
                  validator: (val) {
                    return val == null ? 'Staff must be selected!' : null;
                  },
                  onChanged: (val) {
                    viewmodel.staffid = val;
                  },
                  items: viewmodel.userListByFac != null ?
                  viewmodel.userListByFac.map<DropdownMenuItem>((item) {
                    return DropdownMenuItem(
                      child: Text('${item.name}'),
                      value: item.id,
                    );
                  }).toList() : null,
                ),
                _buildTextFormField(
                  maxlines: 3,
                  minlines: 3,
                  hint: 'Give the best reason to convience the staff',
                  label: 'Details',
                  onchanged: (val) {
                    viewmodel.detail = val;
                  },
                  validator: (val) {
                    return val.length >= 1  ? 'Detail must be filled!' : null;
                  }
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
                          minTime: DateTime.now().add(const Duration(days: 2)),
                          maxTime: DateTime(2040),
                          onChanged: (date) {
                            viewmodel.date = date.year.toString() + '/' + date.month.toString() + "/" + date.day.toString()
                              + "  " + date.hour.toString().padLeft(2, '0') + ":" + date.minute.toString().padLeft(2, '0');
                          }
                        );
                      }
                    ),
                    Text(
                      '${viewmodel.date}',
                    ),
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
                          onPressed: () {
                            if (_formKey.currentState!.validate()){
                              viewmodel.status = 'Pending';
                              viewmodel.appinfo.dateAndTime = viewmodel.date;
                              viewmodel.studentid = viewmodel.user;
                              final _result = viewmodel.createApp(viewmodel.appinfo);
                              if (_result != null) {
                                Navigator.popAndPushNamed(context, appList);
                              }
                            }
                          },
                        ),
                      ),
                    ),
                  ]
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  DropdownButtonFormField _buildDropDown({label, hint, items, onChanged, validator}) {
    return
    DropdownButtonFormField(
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
      ),
      items: items,
      validator: validator,
      onChanged: onChanged,
    );
  }

  TextFormField _buildTextFormField({hint, label, onchanged, validator, minlines, maxlines}) {
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