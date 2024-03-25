import 'package:equatable/equatable.dart';

abstract class AddAlarmEvent extends Equatable {
  const AddAlarmEvent();

  @override
  List<Object?> get props => [];
}

class SetAlarmEvent extends AddAlarmEvent {
  final String label;
  final String datetime;

  const SetAlarmEvent({
    required this.label,
    required this.datetime,
  });

  @override
  List<Object?> get props => [label, datetime];
}
