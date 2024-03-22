import 'package:flutter/material.dart';
import 'package:schedule/component/app_colors.dart';
import 'package:schedule/screen/task_manage/task_manage.dart';
import 'package:schedule/screen/time_table/home_page.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:schedule/screen/time_table/schedule_manage.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  void changeLanguage(){

  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: Locale('vi', ''),
      home: HomePage(callback: changeLanguage,),
      routes: {
        '/schedule_manage': (context) => TimeTableManage(),
        '/task_manage': (context) => const TaskManage()
      },
    );
  }
}
