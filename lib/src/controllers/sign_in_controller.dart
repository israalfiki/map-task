import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../managers/auth_manager.dart';
import '../screens/map_screen.dart';

class SignInController extends GetxController{
 final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final _authManager = AuthManager();

  /// Sign in user
  Future<void> signInUser() async {
    final email = emailController.text;
    final password = passwordController.text;
    if (email.isNotEmpty && password.isNotEmpty) {
      try {
        await _authManager.signInUser(email: email, password: password);
        Get.to(const MapScreen());
      } catch (error) {
        print('error happened');
      }
    }
  }
}