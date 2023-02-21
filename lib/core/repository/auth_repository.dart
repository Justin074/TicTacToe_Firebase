import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:tic_tac_toe/core/utilities/auth_service.dart';

class AuthRepository {
  static Future<UserCredential?> googleLogin() async {
    try {
      final FirebaseAuth auth = FirebaseAuth.instance;
      final GoogleSignIn googleSignIn = GoogleSignIn(
        clientId: 'Your Client Id Here',
      );

      GoogleSignInAccount? googleSignInAuth = await googleSignIn.signIn();

      if (googleSignInAuth != null) {
        AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: (await googleSignInAuth.authentication).accessToken,
          idToken: (await googleSignInAuth.authentication).idToken,
        );

        UserCredential googleCredentials = await auth.signInWithCredential(
          credential,
        );

        AuthService.userCredentials = googleCredentials.user;

        return googleCredentials;
      }
      return null;
    } catch (e) {
      return null;
    }
  }

  static Future<void> googleLogout() async {
    AuthService.userCredentials = null;
    final GoogleSignIn googleSignIn = GoogleSignIn(
      clientId: 'Your Client Id Here',
    );
    await googleSignIn.signOut();
  }
}
