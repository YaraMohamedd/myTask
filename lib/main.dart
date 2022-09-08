import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task/helpers/binding.dart';

import 'screens/splash_screen.dart';

void main()async {

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: Binding(),
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:   StartScreen(),
    );
  }
}
