import 'package:tic_tac_toe/core/models/lobby.dart';
import 'package:tic_tac_toe/core/utilities/auth_service.dart';

class LobbyTileLogic {
  bool isHost(Lobby lobby) {
    return AuthService.userCredentials!.email == lobby.host.playerEmail;
  }
}