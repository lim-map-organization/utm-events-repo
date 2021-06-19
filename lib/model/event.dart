class Event {
  int _id;
  String _event;
  String _date;
  String _timeslot;
  String _venue;
  String _letter;
  int _user;
  String _status;
  String _organization;
  String _contactNo;

  get id => _id;
  set id(value) => _id = value;
  
  get user => _user;
  set user(value) => _user = value;

  get event => _event;
  set event(value) => _event = value;

  get date => _date;
  set date(value) => _date = value;

  get timeslot => _timeslot;
  set timeslot(value) => _timeslot = value;

  get venue => _venue;
  set venue(value) => _venue = value;

  get letter => _letter;
  set letter(value) => _letter = value;

  
  get status => _status;
  set status(value) => _status = value;

  get contactNo => _contactNo;
  set contactNo(value) => _contactNo = value;

  get organization => _organization;
  set organization(value) => _organization = value;

  Event(
      {int id,
      String event = '',
      String date = '',
      String timeslot = '',
      String venue = '',
      String letter = '',
      String status = '',
      int user,
      String contactNo = '',
      String organization = ''})
      : _id = id,
        _event = event,
        _date = date,
        _timeslot = timeslot,
        _venue = venue,
        _user = user,
        _status = status,
        _letter = letter,
        _contactNo = contactNo,
        _organization = organization;

  Event.copy(Event from)
      : this(
            id: from.id,
            event: from.event,
            date: from.date,
            timeslot: from.timeslot,
            venue: from.venue,
            letter: from.letter,
            status: from.status,
            user: from.user,
            contactNo: from.contactNo,
            organization: from.organization);


  //from Json
  Event.fromJson(Map<String, dynamic> json): 
    this(id: json['id'], event: json['event'], date: json['date'], timeslot:json['timeslot'], venue:json['venue'],organization:json['organization'],letter:json['letter'],contactNo:json['contactNo'],status:json['status'],user:json['user']);

  //toJson
  Map<String, dynamic> toJson() => {
        'id': id,
        'event': event,
        'date': date,
        'timeslot': timeslot,
        'venue': venue,
        'organization': organization,
        'user': user,
        'status': status,
        'contactNo': contactNo,
        'letter': letter,
      };
  }