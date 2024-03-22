class ScheduleInfo {
  ScheduleInfo(
      {String? subject,
      String? teacher,
      String? room,
      DateTime? time})
      : _subject = subject,
        _teacher = teacher,
        _room = room,
        _time = time
  ;
  final String? _subject;
  final String? _teacher;
  final String? _room;
  final DateTime? _time;
  get subject => _subject;
}
