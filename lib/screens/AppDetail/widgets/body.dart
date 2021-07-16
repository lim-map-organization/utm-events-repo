import 'package:flutter/material.dart';
import 'package:map_project/app/dependencies.dart';
import 'package:map_project/models/appinfo.dart';
import 'package:map_project/screens/AppDetail/appdetail_viewmodel.dart';
import 'package:map_project/screens/AppDetail/widgets/head.dart';
import 'package:map_project/screens/user/user_viewmodel.dart';
import 'package:map_project/screens/view.dart';

class Body extends StatelessWidget {
  AppInfo data;
  Body({required this.data});
  @override
  Widget build(BuildContext context) {
    print (dependency<UserViewmodel>().role);
    return View(
      viewmodel: AppDetailViewmodel(),
      progressBuilder: (context, viewmodel) => Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Center(child: CircularProgressIndicator()),
      ),
      builder: (context, viewmodel, progressBuilder) => SingleChildScrollView(
        child: Column(
          children: [
            Head(
              title: "Edit Appointment",
              desc: "Think twice before accept",
              image: "calender2.png",
            ),
            SizedBox(height: 5.0),
            Center(
              child: Text(
                'APPOINTMENT DETAIL',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30.0,
                ),
              ),
            ),
            Center(
              child: Image(
                image: AssetImage('asset/calender2.png'),
                height: MediaQuery.of(context).size.height * 1 / 5,
                width: MediaQuery.of(context).size.height * 3 / 4,
              ),
            ),
            Text(
              'Title',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
              ),
            ),
            Text(
              '${data.name}',
              style: TextStyle(
                  color: Theme.of(context).primaryColorDark,
                  fontSize: 15.0,
                  fontStyle: FontStyle.italic),
            ),
            SizedBox(
              height: 10.0,
            ),
            Text(
              'Date & Time',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
              ),
            ),
            Text(
              '${data.dateAndTime}',
              style: TextStyle(
                  color: Theme.of(context).primaryColorDark,
                  fontSize: 15.0,
                  fontStyle: FontStyle.italic),
            ),
            SizedBox(
              height: 10.0,
            ),
            Text(
              'Requested By',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
              ),
            ),
            Text(
              '${data.studentname}',
              style: TextStyle(
                  color: Theme.of(context).primaryColorDark,
                  fontSize: 15.0,
                  fontStyle: FontStyle.italic),
            ),
            SizedBox(
              height: 10.0,
            ),
            Text(
              'Staff',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
              ),
            ),
            Text(
              '${data.staffname}',
              style: TextStyle(
                  color: Theme.of(context).primaryColorDark,
                  fontSize: 15.0,
                  fontStyle: FontStyle.italic),
            ),
            SizedBox(
              height: 10.0,
            ),
            Text(
              'Status',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
              ),
            ),
            Text(
              '${data.status}',
              style: TextStyle(
                  color: Theme.of(context).primaryColorDark,
                  fontSize: 15.0,
                  fontStyle: FontStyle.italic),
            ),
            SizedBox(
              height: 10.0,
            ),
            dependency<UserViewmodel>().role == 'staff' &&
                    data.status == 'Pending'
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () async {
                          final _result = await viewmodel.updateStatus(data.id, data, 'Accepted');
                          viewmodel.turnBusy();
                          data = _result;
                          Navigator.pop(context);
                          viewmodel.turnIdle();
                        },
                        child: Text('Accept'),
                      ),
                      SizedBox(
                        width: 30.0,
                      ),
                      ElevatedButton(
                        onPressed: () async {
                          final _result = await viewmodel.updateStatus(data.id, data, 'Declined');
                          viewmodel.turnBusy();
                          data = _result;
                          Navigator.pop(context);
                          viewmodel.turnIdle();
                        },
                        child: Text('Decline'),
                      ),
                    ],
                  )
                : Text(''),
          ],
        ),
      ),
    );
  }
}
