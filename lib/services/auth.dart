import 'package:firebase_auth/firebase_auth.dart';

class Auth {
  // Declare Variables
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Student Sign In (Anon)
  Future signInStudent() async {
    try {
      AuthResult result = await _auth.signInAnonymously();
      return result.user;
    } catch(e) {
      print(e.toString());
      return null;
    }
  }

  // Admin/Advisor/Officer Sign In.

  // Sign Out.
}