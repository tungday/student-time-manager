import 'dart:ui';

class EventInfo {
  String? _title;
  String? _startTime;
  String? _endTime;
  String? _note;
  Color? _colorSelected;

  EventInfo(
      {String? title,
      String? startTime,
      String? endTime,
      String? note,
      Color? colorSelected})
      : _title = title,
        _startTime = startTime,
        _endTime = endTime,
        _note = note,
        _colorSelected = colorSelected;

  Color get colorSelected => _colorSelected!;

  set colorSelected(Color value) {
    _colorSelected = value;
  }

  String get note => _note ?? '';

  set note(String value) {
    _note = value;
  }

  String get endTime => _endTime ?? '';

  set endTime(String value) {
    _endTime = value;
  }

  String get startTime => _startTime ?? '';

  set startTime(String value) {
    _startTime = value;
  }

  String get title => _title!;

  set title(String value) {
    _title = value;
  }
}
