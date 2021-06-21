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
              child: Column(
                children: [
                  Image(image: AssetImage('asset/boy.png'), height: MediaQuery.of(context).size.height*1/8,),
                  Text('${viewmodel.user.username}\n${viewmodel.user.role} | ${viewmodel.user.faculty}'),
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
                viewmodel.user = Users();
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