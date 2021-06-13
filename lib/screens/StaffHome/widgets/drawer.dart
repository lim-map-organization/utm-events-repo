import 'package:flutter/material.dart';

class DrawerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          DrawerHeader(
            child: Text('Tan Jun Han\nStaff | School of Computing'),
          ),
          Expanded(
            child: Column(
              children: <Widget>[
                ListTile(
                  title: Text('Home'),
                  onTap: () {},
                ),
                ListTile(
                  title: Text('Appointment'),
                  onTap: () {},
                ),
                ListTile(
                  title: Text('Event Application'),
                  onTap: () {},
                ),
              ],
            ),
          ),
          Divider(),
          ListTile(
            title: Text('Settings'),
            onTap: () {},
          ),
          ListTile(
            title: Text('Log Out'),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}