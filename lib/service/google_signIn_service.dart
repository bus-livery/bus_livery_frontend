import 'dart:developer';

import 'package:google_sign_in/google_sign_in.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class GoogleAuthService {
  final GoogleSignIn _googleSignIn = GoogleSignIn.instance;

  /// Initialize the GoogleSignIn
  Future<void> initialize() async {
    await _googleSignIn.initialize();

    // Listen to auth events
    _googleSignIn.authenticationEvents.listen(
      (event) {
        log("Auth Event: $event");
      },
      onError: (error) {
        log("Auth Error: $error");
      },
    );
  }

  /// Authenticate the user
  Future<GoogleSignInAccount?> authenticate() async {
    try {
      return await _googleSignIn.authenticate();
    } catch (e) {
      log("Google SignIn error: $e");
      return null;
    }
  }

  /// Sign out the user
  Future<void> signOut() async {
    try {
      await _googleSignIn.signOut();
    } catch (e) {
      log("Sign out error: $e");
    }
  }

  /// Disconnect (if needed)
  Future<void> disconnect() async {
    try {
      await _googleSignIn.disconnect();
    } catch (e) {
      print("Disconnect error: $e");
    }
  }

  /// Get current user
  // GoogleSignInAccount? get currentUser => _googleSignIn.;
}
