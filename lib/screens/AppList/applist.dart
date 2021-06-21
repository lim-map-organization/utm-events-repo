import 'package:flutter/material.dart';
import 'package:map_project/screens/AppList/widgets/bar.dart';
import 'package:map_project/screens/AppList/widgets/body.dart';

class AppList extends StatefulWidget {

  @override
  _AppListState createState() => _AppListState();
}

class _AppListState extends State<AppList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Bar(),
      body: Body(),
    );
  }
}