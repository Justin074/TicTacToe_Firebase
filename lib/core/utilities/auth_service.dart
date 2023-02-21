import 'package:firebase_auth/firebase_auth.dart';
import 'package:tic_tac_toe/core/models/player_model.dart';

class AuthService {
  static User? userCredentials;

  static PlayerModel get playerModel => PlayerModel(
        playerName: userCredentials!.displayName ?? 'N/A',
        playerEmail: userCredentials!.email ?? 'N/A',
        selection: 'X',
      );
}
