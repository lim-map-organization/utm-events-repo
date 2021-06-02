class AppInfo {

  int _id;
  String _name;
  String _faculty;
  String _detail;
  String _status;
  DateTime _dateAndTime;
  int _staffid;

  get id => _id;
  set id(value) => _id = value;

  get name => _name;
  set name(value) => _name = value;

  get faculty => _faculty;
  set faculty(value) => _faculty = value;

  get detail => _detail;
  set detail(value) => _detail = value;

  get staffid => _staffid;
  set staffid(value) => _staffid = value;

  get status => _status;
  set status(value) => _status = value;

  get dateAndTime => _dateAndTime;
  set dateAndTime(value) => _dateAndTime = value;

  AppInfo({int id, String name='', String faculty='', String detail='', int staffid, DateTime dateAndTime
  })
    : _id = id,
    _name = name,
    _faculty = faculty,
    _detail = detail,
    _staffid = staffid,
    _dateAndTime = dateAndTime;

  AppInfo.copy(AppInfo from)
    : this(
      id: from.id,
      faculty: from.faculty,
      name: from.name,
      detail: from.detail,
      staffid: from.staffid,
      dateAndTime: from.dateAndTime
    );

}