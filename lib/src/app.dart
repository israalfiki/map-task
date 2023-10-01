import 'package:farmtopia_task/src/screens/login_screen.dart';
import 'package:farmtopia_task/src/screens/map_screen.dart';
import 'package:farmtopia_task/src/screens/sign_up_screen.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../src/bindings/bindings.dart';
import 'helpers.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    final isLoggedIn = checkUser();
    return GetMaterialApp(
      home: isLoggedIn? const MapScreen(): const LoginScreen(),
      initialBinding: InitialBindings(),
      debugShowCheckedModeBanner: false,
    );
  }
}
