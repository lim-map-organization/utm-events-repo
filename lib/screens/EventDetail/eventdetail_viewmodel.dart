import 'package:map_project/app/dependencies.dart';
import 'package:map_project/models/eventinfo.dart';
import 'package:map_project/screens/EventList/eventlist_viewmodel.dart';
import 'package:map_project/screens/viewmodel.dart';
import 'package:map_project/services/event/event_service.dart';

class EventDetailViewmodel extends Viewmodel {
  EventService get _service => dependency();
  EventListViewmodel get _eventlist => dependency();

  Future updateStatus(event, status) async {
    EventInfo eventinfo = EventInfo.copy(event);
    eventinfo.status = status;
    turnBusy();
    final _result = await _service.updateStatus(id: eventinfo.id, eventinfo: eventinfo);
    turnIdle();
    return _result;
  }
}