import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:localdatabase/model/user.dart';
import 'package:localdatabase/screen/add_user.dart';
import 'package:localdatabase/screen/all_user.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: AllUser(),
      debugShowCheckedModeBanner: false,
    );
  }
}
