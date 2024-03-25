class ActivityInfo {
  ActivityInfo(
      {String? subject,
      String? note,
      String? timeIn, String? timeOut, String? activity})
      : _subject = subject,
        _note = note,
        _timeIn = timeIn,
        _timeOut = timeOut,
  _activity = activity
  ;
  String? _subject;
  String? _note;
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


  set note(String value) {
    _note = value;
  }


  String get timeIn => _timeIn!;

  set timeIn(String value) {
    _timeIn = value;
  }

  String get subject => _subject!;

  String get note => _note!;


  String get timeOut => _timeOut!;

  set timeOut(String value) {
    _timeOut = value;
  }
}
