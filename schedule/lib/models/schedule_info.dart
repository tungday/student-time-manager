class ScheduleInfo {
  ScheduleInfo(
      {String? subject,
      String? teacher,
      String? room,
      String? timeIn, String? timeOut, String? activity})
      : _subject = subject,
        _teacher = teacher,
        _room = room,
        _timeIn = timeIn,
        _timeOut = timeOut,
  _activity = activity
  ;
  String? _subject;
  String? _teacher;
  String? _room;
  String? _activity;
  String? _timeIn;
  String? _timeOut;


  String get activity => _activity!;

  set activity(String value) {
    _activity = value;
  }

  set subject(String value) {
    _subject = value;
  }


  set teacher(String value) {
    _teacher = value;
  }

  set room(String value) {
    _room = value;
  }

  String get timeIn => _timeIn!;

  set timeIn(String value) {
    _timeIn = value;
  }

  String get subject => _subject!;

  String get teacher => _teacher!;

  String get room => _room!;

  String get timeOut => _timeOut!;

  set timeOut(String value) {
    _timeOut = value;
  }
}
