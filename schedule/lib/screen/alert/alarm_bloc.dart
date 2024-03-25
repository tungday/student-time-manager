import 'dart:async';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'alarm_event.dart';
import 'alarm_state.dart';
import 'model/Model.dart';

class AddAlarmBloc extends Bloc<AddAlarmEvent, AddAlarmState> {
  final List<Model> modelList = [];
  late SharedPreferences preferences;

  AddAlarmBloc() : super(AddAlarmState(isLoading: true)) {
    on<SetAlarmEvent>(_handleSetAlarmEvent);
  }

  void _handleSetAlarmEvent(SetAlarmEvent event, Emitter<AddAlarmState> emit) async {
    try {
      emit(AddAlarmState(isLoading: true));
      // Thêm logic xử lý đặt báo thức ở đây
      modelList.add(Model(
        label: event.label,
        datetime: event.datetime,

      ));
      // Lưu dữ liệu vào SharedPreferences
      await setDataToSharedPreferences();
      emit(AddAlarmState(isLoading: false));
    } catch (e) {
      // Xử lý lỗi nếu cần thiết
      emit(AddAlarmState(isLoading: false));
    }
  }

  Future<void> setDataToSharedPreferences() async {
    preferences = await SharedPreferences.getInstance();
    List<String> listofstring = modelList.map((e) => json.encode(e.toJson())).toList();
    await preferences.setStringList("data", listofstring);
  }
}
