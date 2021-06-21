import 'package:flutter/material.dart';
import 'package:map_project/app/dependencies.dart';
import 'package:map_project/models/eventinfo.dart';
import 'package:map_project/screens/EventDetail/eventdetail_viewmodel.dart';
import 'package:map_project/screens/user/user_viewmodel.dart';
import 'package:map_project/screens/view.dart';

class Body extends StatelessWidget {
  EventInfo event;
  Body({required this.event});
  @override
  Widget build(BuildContext context) {
    return View(
      viewmodel: EventDetailViewmodel(),
      progressBuilder: (context, viewmodel) => Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Center (child: CircularProgressIndicator()),
      ),
      builder: (context, viewmodel, progressBuilder) => SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Text(
                'EVENT DETAIL',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30.0,
                ),
              ),
            ),
            Center(
              child: Image(
                image: AssetImage('asset/calendar1.png'),
                height: MediaQuery.of(context).size.height *1/5,
                width: MediaQuery.of(context).size.height *3/4,
              ),
            ),
            Text(
              'Title',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
              ),
            ),
            Text(
              '${event.name}',
              style: TextStyle(
                color: Theme.of(context).primaryColorDark,
                fontSize: 15.0,
                fontStyle: FontStyle.italic
              ),
            ),
            SizedBox(height: 10.0,),
            Text(
              'Date',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
              ),
            ),
            Text(
              '${event.dateAndTime}',
              style: TextStyle(
                color: Theme.of(context).primaryColorDark,
                fontSize: 15.0,
                fontStyle: FontStyle.italic
              ),
            ),
            SizedBox(height: 10.0,),
            Text(
              'Venue',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
              ),
            ),
            Text(
              '${event.venue}',
              style: TextStyle(
                color: Theme.of(context).primaryColorDark,
                fontSize: 15.0,
                fontStyle: FontStyle.italic
              ),
            ),
            SizedBox(height: 10.0,),
            Text(
              'Time Slot',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
              ),
            ),
            Text(
              '${event.timeslot}',
              style: TextStyle(
                color: Theme.of(context).primaryColorDark,
                fontSize: 15.0,
                fontStyle: FontStyle.italic
              ),
            ),
            SizedBox(height: 10.0,),
            Text(
              'Code',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
              ),
            ),
            Text(
              '${event.code}',
              style: TextStyle(
                color: Theme.of(context).primaryColorDark,
                fontSize: 15.0,
                fontStyle: FontStyle.italic
              ),
            ),
            SizedBox(height: 10.0,),
            Text(
              'Requested By',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
              ),
            ),
            Text(
              '${event.organization}',
              style: TextStyle(
                color: Theme.of(context).primaryColorDark,
                fontSize: 15.0,
                fontStyle: FontStyle.italic
              ),
            ),
            SizedBox(height: 10.0,),
            Text(
              'Contact',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
              ),
            ),
            Text(
              '${event.contact}',
              style: TextStyle(
                color: Theme.of(context).primaryColorDark,
                fontSize: 15.0,
                fontStyle: FontStyle.italic
              ),
            ),
            SizedBox(height: 10.0,),
            Text(
              'Status',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
              ),
            ),
            Text(
              '${event.status}',
              style: TextStyle(
                color: Theme.of(context).primaryColorDark,
                fontSize: 15.0,
                fontStyle: FontStyle.italic
              ),
            ),
            SizedBox(height: 10.0,),
            dependency<UserViewmodel>().role == 'student' ? Text('') : 
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () async {
                    final _result = await viewmodel.updateStatus(event, 'Accepted');
                    if (_result != null) {
                      viewmodel.turnBusy();
                      event = _result;
                      viewmodel.turnIdle();
                    }
                  }, 
                  child: Text('Accept'),
                ),
                SizedBox(width: 30.0,),
                ElevatedButton(
                  onPressed: () async {
                    final _result = await viewmodel.updateStatus(event, 'Declined');
                    if (_result != null) {
                      viewmodel.turnBusy();
                      event = _result;
                      viewmodel.turnIdle();
                    }
                  }, 
                  child: Text('Decline'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}