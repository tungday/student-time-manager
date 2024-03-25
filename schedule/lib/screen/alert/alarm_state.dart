import 'package:equatable/equatable.dart';

class AddAlarmState extends Equatable {
  final bool isLoading;

  const AddAlarmState({
    required this.isLoading,
  });

  @override
  List<Object?> get props => [isLoading];

  factory AddAlarmState.initial() => AddAlarmState(isLoading: false);
}
