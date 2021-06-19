import 'package:baoren_workplace/model/news.dart';
import 'package:baoren_workplace/screen/home/body.dart';
import 'package:flutter/material.dart';

class NewList extends StatelessWidget {
  NewList({state}) : _state = state;
  final Body _state;
  //const NewList({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //print(_state.getNews());
    return FutureBuilder<List<News>>(
      future: _state.getFutureNews(),
      builder: (context, snapshot) {
        if(snapshot.hasData){
          return SizedBox(height: 380, child: buildListView(snapshot.data));
        }
        else{
          return Center(child: CircularProgressIndicator());
        }
      }
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
          leading: CircleAvatar(backgroundImage: AssetImage('asset/${data[index].photo}') ,)
          //,
        ),
      );
  }
}