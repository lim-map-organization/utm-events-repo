import 'package:flutter/material.dart';
import 'package:map_project/app/dependencies.dart';
import 'package:map_project/models/appinfo.dart';
import 'package:map_project/screens/AppDetail/appdetail_viewmodel.dart';
import 'package:map_project/screens/AppList/applist_viewmodel.dart';
import 'package:map_project/screens/user/user_viewmodel.dart';
import 'package:map_project/screens/view.dart';

class Body extends StatelessWidget {
  final int index;
  Body({required this.index});
  @override
  Widget build(BuildContext context) {
    return View(
      viewmodel: AppDetailViewmodel(),
      progressBuilder: (context, viewmodel) => Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Center (child: CircularProgressIndicator()),
      ),
      builder: (context, viewmodel, progressBuilder) => SingleChildScrollView(
        child: Column(
          children: [
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
                height: MediaQuery.of(context).size.height *1/5,
                width: MediaQuery.of(context).size.height *3/4,
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
              '${dependency<AppListViewmodel>().appList[index].name}',
              style: TextStyle(
                color: Theme.of(context).primaryColorDark,
                fontSize: 15.0,
                fontStyle: FontStyle.italic
              ),
            ),
            SizedBox(height: 10.0,),
            Text(
              'Date & Time',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
              ),
            ),
            Text(
              '${dependency<AppListViewmodel>().appList[index].dateAndTime}',
              style: TextStyle(
                color: Theme.of(context).primaryColorDark,
                fontSize: 15.0,
                fontStyle: FontStyle.italic
              ),
            ),
            SizedBox(height: 10.0,),
            Text(
              'Requested By',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
              ),
            ),
            Text(
              '${dependency<AppListViewmodel>().appList[index].studentname}',
              style: TextStyle(
                color: Theme.of(context).primaryColorDark,
                fontSize: 15.0,
                fontStyle: FontStyle.italic
              ),
            ),
            SizedBox(height: 10.0,),
            Text(
              'Staff',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
              ),
            ),
            Text(
              '${dependency<AppListViewmodel>().appList[index].staffname}',
              style: TextStyle(
                color: Theme.of(context).primaryColorDark,
                fontSize: 15.0,
                fontStyle: FontStyle.italic
              ),
            ),
            SizedBox(height: 10.0,),
            Text(
              'Status',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
              ),
            ),
            Text(
              '${dependency<AppListViewmodel>().appList[index].status}',
              style: TextStyle(
                color: Theme.of(context).primaryColorDark,
                fontSize: 15.0,
                fontStyle: FontStyle.italic
              ),
            ),
            SizedBox(height: 10.0,),
            dependency<UserViewmodel>().role == 'staff' && dependency<AppListViewmodel>().appList[index].status == 'Pending' ?
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    viewmodel.updateStatus(index, dependency<AppListViewmodel>().appList[index], 'Accepted');
                  }, 
                  child: Text('Accept'),
                ),
                SizedBox(width: 30.0,),
                ElevatedButton(
                  onPressed: () {
                    viewmodel.updateStatus(index, dependency<AppListViewmodel>().appList[index], 'Declined');
                  }, 
                  child: Text('Decline'),
                ),
              ],
            ) : Text(''),
          ],
        ),
      ),
    );
  }
}