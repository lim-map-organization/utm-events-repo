class EventInfo {

  int _id;
  String _name;
  String _venue;
  String _timeslot;
  String _organization;
  String _code;
  String _contact;
  DateTime _dateAndTime;

  get id => _id;
  set id(value) => _id = value;

  get name => _name;
  set name(value) => _name = value;

  get timeslot => _timeslot;
  set timeslot(value) => _timeslot = value;

  get venue => _venue;
  set venue(value) => _venue = value;

  get organization => _organization;
  set organization(value) => _organization = value;

  get code => _code;
  set code(value) => _code = value;

  get contact => _contact;
  set contact(value) => _contact = value;

  get dateAndTime => _dateAndTime;
  set dateAndTime(value) => _dateAndTime = value;

  EventInfo({int id, String name='', String venue='', String organization='', String code='', 
    String contact='', String timeslot='', DateTime dateAndTime
  })
    : _id = id,
    _name = name,
    _venue = venue,
    _organization = organization,
    _code = code,
    _contact = contact,
    _timeslot = timeslot,
    _dateAndTime = dateAndTime;

  EventInfo.copy(EventInfo from)
    : this(
      id: from.id,
      venue: from.venue,
      name: from.name,
      organization: from.organization,
      code: from.code,
      contact: from.contact,
      timeslot: from.timeslot,
      dateAndTime: from.dateAndTime
    );

}