import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_car/config/theme.dart';
import 'package:smart_car/controller/theme_controller.dart';
import 'package:smart_car/view/map/map.dart';

import 'view/home/home_screen.dart';

void main() {

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Car Dashboard UI',
      theme: darkTheme(context),
      //theme: lightTheme(context),
     // darkTheme: darkTheme(context),
      home:  HomeScreen(),
    );
  }
}
