import 'package:flutter/material.dart';
import 'package:map_project/app/dependencies.dart';
import 'package:map_project/app/route.dart';
import 'package:map_project/models/users.dart';
import 'package:map_project/screens/AppList/applist_viewmodel.dart';
import 'package:map_project/screens/EventList/eventlist_viewmodel.dart';
import 'package:map_project/screens/Home/home_viewmodel.dart';
import 'package:map_project/screens/user/user_viewmodel.dart';
import 'package:map_project/screens/view.dart';

class DrawerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return View(
      viewmodel: HomeViewmodel(),
      progressBuilder: (context, viewmodel) => Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Center (child: CircularProgressIndicator()),
      ),
      builder: (context, viewmodel, progressBuilder) => Drawer(
        child: Column(
          children: <Widget>[
            DrawerHeader(
               decoration: BoxDecoration(
          color: Colors.blueGrey,
        ),
              child: Stack(
                children: <Widget>[
                  Align(
                    alignment: Alignment.centerRight+ Alignment(0.2, -0.3),
                    child: Image.asset('asset/boy.png',height: 110,),
                  ),
                  Align(
                    alignment: Alignment.centerLeft+ Alignment(0.1, -0.5),
                    child: Text(
                      '${viewmodel.user.username}',
                      style: TextStyle(color: Colors.white, fontSize: 30.0),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft + Alignment(0.1, 0),
                    child: Text(
                      '${viewmodel.user.faculty.replaceAll("School of","")}',
                      style: TextStyle(
                        color: Colors.white70,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft + Alignment(0.1, .5),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child:Padding(
                        padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                        child: Text('${viewmodel.user.role.replaceAll("s","S")}', style: TextStyle(color: Colors.blueGrey, fontWeight: FontWeight.bold),),
                      ) ,
                      ),
                  ),
                ],
                ),
            ),
            Expanded(
              child: Column(
                children: <Widget>[
                  _buildListTile(
                    title: Text('Home'),
                    ontap: () {
                      Navigator.popAndPushNamed(context, home);
                    }
                  ),
                  _buildListTile(
                    title: Text('Appointment'),
                    ontap: () {
                      Navigator.pushNamed(context, appList);
                    }
                  ),
                  _buildListTile(
                    title: Text('Event Application'),
                    ontap: () {
                      Navigator.pushNamed(context, eventList);
                    }
                  ),
                ],
              ),
            ),
            Divider(),
            _buildListTile(
              title: Text('Log Out'),
              ontap: () {
                viewmodel.user = null;
                Navigator.popAndPushNamed(context, loginScreen);
              }
            ),
          ],
        ),
      ),
    );
  }
  ListTile _buildListTile({title, ontap}) {
    return ListTile(
      title: title,
      onTap: ontap,
    );
  }
}