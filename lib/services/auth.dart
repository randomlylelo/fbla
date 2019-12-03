import 'package:fbla/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Auth {
  // Declare Variables
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Create User
  User _createUID(FirebaseUser user) {
    return user != null ? User(uid: user.uid) : null;
  }

  // Student Sign In (Anon)
  Future signInStudent() async {
    try {
      AuthResult result = await _auth.signInAnonymously();
      return _createUID(result.user);
    } catch(e) {
      print(e.toString());
      return null;
    }
  }

  // Admin/Advisor/Officer Sign In.

  // Sign Out.
}