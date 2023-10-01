import 'package:farmtopia_task/src/managers/auth_manager.dart';
import 'package:farmtopia_task/src/screens/map_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final _authManager = AuthManager();

  /// sign up
  Future<void> signUpUser() async {
    final email = emailController.text;
    final password = passwordController.text;
    if (email.isNotEmpty && password.isNotEmpty) {
      try {
        await _authManager.signUpUser(email: email, password: password);
        Get.to(const MapScreen());
      } catch (error) {
        print('error happened');
      }
    }
  }
}
