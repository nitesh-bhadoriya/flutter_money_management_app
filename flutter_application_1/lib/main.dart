import 'package:flutter/material.dart';
import 'package:money_management_app/page/homepage.dart';
import 'package:money_management_app/theme.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive/hive.dart';

void main() async {
  //these loc creates a box for Hive DB in the application where we can make changes
  await Hive.initFlutter();
  await Hive.openBox('money');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Money manager',
      theme: myTheme,
      home: const HomePage(),
    );
  }
}
