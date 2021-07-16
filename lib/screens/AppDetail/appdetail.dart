import 'package:flutter/material.dart';
import 'package:map_project/models/appinfo.dart';
import 'package:map_project/screens/AppDetail/widgets/bar.dart';
import 'package:map_project/screens/AppDetail/widgets/body.dart';

class AppDetail extends StatefulWidget {
  static Route route({data}) => MaterialPageRoute(
      builder: (context) => AppDetail(app: data,));
  final AppInfo app;
  AppDetail({required this.app});
  @override
  _AppDetailState createState() => _AppDetailState();
}

class _AppDetailState extends State<AppDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Bar(),
      body: Body(data: widget.app),
    );
  }
}