import 'dart:developer';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthHelper {
  // singleton Class
  AuthHelper._();

  // object
  static final AuthHelper authHelper = AuthHelper._();
  GoogleSignIn googleSignIn = GoogleSignIn();
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  Future<void> singInGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await googleSignIn.signIn();

    //  Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    await firebaseAuth.signInWithCredential(credential);
  }

  void singOutGoogle() async {
    await googleSignIn.signOut();
  }

  // Guest-user Anonymous
  loginAnonymously() async {
    try {
      await firebaseAuth.signInAnonymously();
      return true;
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case "operation-not-allowed":
          break;
        default:
          log("Exception: ${e.code}");
      }
      return false;
    }
  }
}
