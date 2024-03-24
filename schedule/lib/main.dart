import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:schedule/screen/alert/alarm_bloc.dart';
import 'package:schedule/screen/alert/alert_home.dart';
import 'package:schedule/screen/task_manage/task_manage.dart';
import 'package:schedule/screen/time_table/home_page.dart';
import 'package:schedule/screen/time_table/schedule_manage.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddAlarmBloc(), // Provide Bloc
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        locale: Locale('vi', ''),
        home: HomePage(callback: () {  },),
        routes: {
          '/schedule_manage': (context) => TimeTableManage(),
          '/task_manage': (context) => const TaskManage(),
          '/alert_home': (context) => const AlertHome(),
        },
      ),
    );
  }
}
