import 'package:map_project/models/eventinfo.dart';

abstract class EventService {
  Future<List<EventInfo>?>? getEventListById({required String id});

  Future<List<EventInfo>?>? getEventList();

  Future<EventInfo?> createEvent({required EventInfo eventinfo});

  Future<EventInfo?> updateStatus({required String id, required EventInfo eventinfo});
}