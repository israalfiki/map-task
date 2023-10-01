import 'package:farmtopia_task/src/controllers/sign_in_controller.dart';
import 'package:farmtopia_task/src/screens/map_screen.dart';
import 'package:farmtopia_task/src/screens/sign_up_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final controller = Get.find<SignInController>();
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          TextField(
            decoration: const InputDecoration(hintText: 'Email'),
            controller: controller.emailController,
          ),
          const SizedBox(
            height: 15,
          ),
          TextField(
            decoration: const InputDecoration(hintText: 'Password'),
            controller: controller.passwordController,
          ),
          const SizedBox(
            height: 50,
          ),
          SizedBox(
            width: context.width,
            height: 40,
            child: ElevatedButton(
              onPressed: () => controller.signInUser(),
              child: const Text('Login'),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          TextButton(
            onPressed: () => Get.to(const SignUpScreen()),
            child: const Text('Sign up'),
          )
        ]),
      ),
    );
  }
}
