import 'package:baoren_workplace/model/appointment.dart';
import 'package:baoren_workplace/screen/appointment/edit/edit_screen.dart';
import 'package:baoren_workplace/screen/appointment/list/list_app.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  //const Body({ Key? key }) : super(key: key);
  Body({state}) : _state = state;
  final AppListState _state;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Appointment>>(
        future: _state.appListFuture,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            _state.appList = snapshot.data;
            return buildListView();
          } else {
            return Center(child: CircularProgressIndicator());
          }
        });
  }

  ListView buildListView() {
    return ListView.separated(
      itemCount: _state.appList.length,
      separatorBuilder: (context, index) => Divider(
        color: Colors.blueGrey,
      ),
      itemBuilder: (context, index) => InkWell(
        onLongPress: () => (_state.appList[index].status == "reject")
            ? OnLongPressed(index)
            : null,
        onTap: () => OnTapItem(index, context, _state.appList[index]),
        child: Padding(
          padding: EdgeInsets.fromLTRB(20, 20, 20, 10),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Expanded(
                flex: 2,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${_state.appList[index].title}',
                        style: TextStyle(
                            fontSize: 20.0, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 5.0),
                      Text(
                          '${_state.appList[index].date} | ${_state.appList[index].time}')
                    ])),
            Expanded(
                child: Center(
              child: Text(
                _state.appList[index].status,
                style: TextStyle(fontFamily: "Now", fontSize: 32.0),
              ),
            )),
          ]),
        ),
      ),
    );
  }

  void OnTapItem(index, context, app) async {
    bool staffStyle = (_state.appList[index].status.toLowerCase() == "pending" &&
        _state.widget.user.identity == "staff");
    bool studStyle = (_state.appList[index].status.toLowerCase() == "approve" &&
        _state.widget.user.identity == "student");
    if (staffStyle || studStyle) {
      final _app = await Navigator.pushNamed(context, '/app-edit',
          arguments: [_state.widget.user, app]);
      // if(_app != null){
      //   _state.addTodo(_app);
      // }
      // print("OnTap: ${index}");
      // _state.updateTodo(index: index,todo: _app);
      if (_app != null) {
        _state.updateApp(index: index, app: _app);
      }
    }
    else{
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Waiting For Approval")));
    }
  }

  void OnLongPressed(index) {
    _state.removeApp(index);
  }
}
