import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:project_march/ui_ux_works/DataBase/hivee/hive_todo/homepage.dart';

void main() async {
  await Hive.initFlutter();
  var box = await Hive.openBox("my_box");
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(primarySwatch: Colors.deepPurple),
    home: HomePg(),
  ));
}

class mainApp extends StatelessWidget {
  const mainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
