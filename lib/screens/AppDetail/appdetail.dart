import 'package:flutter/material.dart';
import 'package:map_project/app/dependencies.dart';
import 'package:map_project/models/appinfo.dart';
import 'package:map_project/screens/AppDetail/widgets/bar.dart';
import 'package:map_project/screens/AppDetail/widgets/body.dart';
import 'package:map_project/screens/AppList/applist_viewmodel.dart';

class AppDetail extends StatefulWidget {
  static Route route({index}) => MaterialPageRoute(
      builder: (context) => AppDetail(index: index));
  final int index;
  AppDetail({required this.index});
  @override
  _AppDetailState createState() => _AppDetailState();
}

class _AppDetailState extends State<AppDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Bar(),
      body: Body(index: widget.index),
    );
  }
}