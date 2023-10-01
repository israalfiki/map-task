import 'package:firebase_auth/firebase_auth.dart';

class AuthManager {
  final _auth = FirebaseAuth.instance;

  /// Sign up user with email & password
  Future<String?> signUpUser(
      {required String email, required String password}) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      return 'success';
    } on FirebaseAuthException catch (error) {
      if (error.code == 'weak-password') {
        return 'Weak Password';
      } else if (error.code == 'email-already-in-use') {
        return 'Email already in use';
      } else {
        return error.message;
      }
    } catch (error) {
      return error.toString();
    }
  }

  // Sign in user
  Future<String?> signInUser(
      {required String email, required String password}) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      return 'success';
    } on FirebaseAuthException catch (error) {
      if (error.code == 'user-not-found') {
        return 'No user found for this email';
      } else if (error.code == 'wrong-password') {
        return 'Wrong password';
      } else {
        return error.message;
      }
    } catch (error) {
      return error.toString();
    }
  }

  /// Sign out user
  void signOut() => _auth.signOut();

  // get current user
  User getUser() => _auth.currentUser!;
}
