import 'package:get_it/get_it.dart';
import 'package:tic_tac_toe/core/models/lobby.dart';
import 'package:tic_tac_toe/core/models/player_model.dart';
import 'package:tic_tac_toe/core/providers/lobby_provider.dart';
import 'package:tic_tac_toe/core/repository/lobby_repository.dart';
import 'package:tic_tac_toe/core/utilities/auth_service.dart';

class ReadyButtonLogic {
  Future<void> setUserReady(Lobby lobby) async {
    final PlayerModel currentPlayer = AuthService.playerModel;
    currentPlayer.isReady = true;

    if (lobby.host.playerEmail == currentPlayer.playerEmail) {
      lobby.host.isReady = true;
      await LobbyRepository.updatePlayer(
        lobby.id,
        0,
        currentPlayer,
      );
    } else if (lobby.challenger?.playerEmail == currentPlayer.playerEmail) {
      lobby.challenger!.isReady = true;
      await LobbyRepository.updatePlayer(
        lobby.id,
        1,
        currentPlayer,
      );
    }

    if (lobby.host.isReady && (lobby.challenger?.isReady ?? false)) {
      await LobbyRepository.setLobbyReady(lobby.id);
    }
  }

  String buttonState(Lobby lobby) {
    String buttonState = 'READY UP!';
    final PlayerModel currentPlayer = AuthService.playerModel;

    if (lobby.host.playerEmail == currentPlayer.playerEmail) {
      if (lobby.host.isReady) buttonState = 'WAITING';
    } else if (lobby.challenger?.playerEmail == currentPlayer.playerEmail) {
      if (lobby.challenger?.isReady ?? false) {
        buttonState = 'WAITING';
      }
    }

    return buttonState;
  }
}
