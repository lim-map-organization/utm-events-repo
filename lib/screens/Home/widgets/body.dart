import 'package:flutter/material.dart';
import 'package:map_project/app/dependencies.dart';
import 'package:map_project/app/route.dart';
import 'package:map_project/models/news.dart';
import 'package:map_project/screens/AppList/applist_viewmodel.dart';
import 'package:map_project/screens/EventList/eventlist_viewmodel.dart';
import 'package:map_project/screens/Home/home_viewmodel.dart';
import 'package:map_project/screens/Home/widgets/menubar.dart';
import 'package:map_project/screens/user/user_viewmodel.dart';
import 'package:map_project/screens/view.dart';

class Body extends StatelessWidget {
  //HomeViewmodel get vm => dependency();
  @override
  Widget build(BuildContext context) {
    return View(
      viewmodel: HomeViewmodel(),
      progressBuilder: (context, viewmodel) => Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Center(child: CircularProgressIndicator()),
      ),
      builder: (context, viewmodel, progressBuilder) => SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 30,10, 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                      flex: 5,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Hi, ${viewmodel.user.name}",
                            style: TextStyle(fontFamily: 'Now', fontSize: 40.0),
                          ),
                          SizedBox(height: 5.0),
                          Text(
                              "${viewmodel.user.role} | ${viewmodel.user.faculty}"),
                        ],
                      )),
                  //SizedBox(width: 10.0),
                  Flexible(flex: 2, child: Image.asset('asset/boy.png')),
                ],
              ),
            ),
            MenuBar(state: this, user: viewmodel.user),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 20, 10, 10),
              child: Column(
                children: [
                  Text("Latest News",style: TextStyle(color: Colors.blueGrey[900], fontFamily: 'Now', fontSize: 20.0),),
                  SizedBox(height: 10.0),
                  FutureBuilder<List<News>>(
                      future: viewmodel.newListFuture,
                      builder: (context, snapshot) {
                        print(snapshot.data);
                        if (snapshot.hasData) {
                          return SizedBox(
                              height: 380, child: buildListView(snapshot.data));
                        } else {
                          return Center(child: CircularProgressIndicator());
                        }
                      }),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  ListView buildListView(data) {
    return ListView.separated(
      itemCount: data.length,
      separatorBuilder: (context, index) => Divider(
        color: Colors.blueGrey,
      ),
      itemBuilder: (context, index) => ListTile(
        title: Text('${data[index].title}'),
        subtitle: Text('${data[index].desc}'),
        leading: CircleAvatar(
          backgroundImage: AssetImage('asset/${data[index].photo}'),
        )
        ,
      ),
    );
  }
}
