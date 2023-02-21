import 'package:tic_tac_toe/core/models/lobby.dart';
import 'package:tic_tac_toe/core/models/player_model.dart';
import 'package:tic_tac_toe/core/utilities/auth_service.dart';

class LobbyViewLogic {
  bool canViewLobby(Lobby lobby) {
    PlayerModel playerModel = AuthService.playerModel;

    final bool isInGameAsChallenger =
        lobby.challenger?.playerEmail == playerModel.playerEmail;
    final bool isInGameAsHost =
        lobby.host.playerEmail == playerModel.playerEmail;
    final bool hasNoChallenger = lobby.challenger == null;
    final bool isDone = lobby.isDone;

    return (isInGameAsChallenger || isInGameAsHost || hasNoChallenger) &&
        !isDone;
  }
}
