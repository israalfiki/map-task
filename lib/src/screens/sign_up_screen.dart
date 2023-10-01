import 'package:farmtopia_task/src/controllers/sign_up_controller.dart';
import 'package:farmtopia_task/src/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final controller = Get.find<SignUpController>();
    return Scaffold(
      body: Center(
        child: Padding(
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
                onPressed: () => controller.signUpUser(),
                child: const Text('Sign up'),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextButton(
              onPressed: () => Get.to(const LoginScreen()),
              child: const Text('Login'),
            )
          ]),
        ),
      ),
    );
  }
}
