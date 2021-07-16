import 'package:flutter/material.dart';
import 'package:map_project/app/dependencies.dart';
import 'package:map_project/app/route.dart';
import 'package:map_project/models/eventinfo.dart';
import 'package:map_project/screens/EventList/eventlist_viewmodel.dart';
import 'package:map_project/screens/view.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return View(
      viewmodel: EventListViewmodel(),
      progressBuilder: (context, viewmodel) => Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Center (child: CircularProgressIndicator()),
      ),
      builder: (context, viewmodel, progressBuilder) {
        return FutureBuilder<List<EventInfo>?>(
          future: viewmodel.eventListFuture,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              print(snapshot.data);
              viewmodel.eventList = snapshot.data;
              return ListView.builder(
                itemCount: viewmodel.length,
                itemBuilder: (context, i) {
                  return ListTile(
                    title: Text('${viewmodel.eventList[i].name}'),
                    subtitle: Text('Status: ${viewmodel.eventList[i].status}'),
                    onTap: () async {
                      await Navigator.pushNamed(context, eventDetail, arguments: viewmodel.eventList[i]);
                      Navigator.pop(context);
                    }
                  );
                }
              );
            } else {
              return Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Center (child: CircularProgressIndicator()),
              );
            }
          }
        );
      }
    );
  }
}