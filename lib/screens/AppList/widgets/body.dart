import 'package:flutter/material.dart';
import 'package:map_project/app/dependencies.dart';
import 'package:map_project/app/route.dart';
import 'package:map_project/models/appinfo.dart';
import 'package:map_project/screens/AppList/applist_viewmodel.dart';
import 'package:map_project/screens/view.dart';

class Body extends StatelessWidget {
  AppListViewmodel get vm => dependency();
  @override
  Widget build(BuildContext context) {
    print (vm.appListFuture);
    return View(
      viewmodel: vm,
      progressBuilder: (context, viewmodel) => Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Center (child: CircularProgressIndicator()),
      ),
      builder: (context, viewmodel, progressBuilder) {
        return FutureBuilder<List<AppInfo>?>(
          future: viewmodel.appListFuture,
          builder: (context, snapshot) {
            print(snapshot.data);
            print(viewmodel.appListFuture);
            if (snapshot.hasData) {
              viewmodel.appList = snapshot.data;
              return ListView.builder(
                itemCount: viewmodel.length,
                itemBuilder: (context, i) {
                  return ListTile(
                    title: Text('${viewmodel.appList[i].name}'),
                    subtitle: Text('Status: ${viewmodel.appList[i].status}'),
                    onTap: () {
                      Navigator.pushNamed(context, appDetail, arguments: i);
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