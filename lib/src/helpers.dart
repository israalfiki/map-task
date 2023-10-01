import 'package:firebase_auth/firebase_auth.dart';

/// check if user is logged in
bool checkUser() {
  bool isLoggedIn;
  final auth = FirebaseAuth.instance;
  isLoggedIn = auth.currentUser != null ? true : false;
  return isLoggedIn;
}
