import 'package:map_project/app/dependencies.dart';
import 'package:map_project/models/eventinfo.dart';
import 'package:map_project/services/event/event_service.dart';
import 'package:map_project/services/rest.dart';

class EventServiceRest implements EventService {
  RestService get rest => dependency();

  Future<List<EventInfo>?>? getEventListById({required String id}) async {
    try {
      final json = await rest.get('event/$id');
      return (json as List).map((item) {return EventInfo.fromJson(item);}).toList();
    } catch (e) {
      return null;
    }
  }

  Future<List<EventInfo>?>? getEventList() async {
    try {
      final json = await rest.get('event');
      return (json as List).map((item) { return EventInfo.fromJson(item);}).toList();
    } catch (e) {
      return null;
    }
  }

  Future<EventInfo?> createEvent({required EventInfo eventinfo}) async {
    try {
      final json = await rest.post('event', data: eventinfo);
      return EventInfo.fromJson(json);
    } catch (e) {
      return null;
    }
  }

  Future<EventInfo?> updateStatus({required String id, required EventInfo eventinfo}) async {
    try {
      final json = await rest.put('event/$id', data: eventinfo);
      return EventInfo.fromJson(json);
    } catch (e) {
      return null;
    }
  }
}