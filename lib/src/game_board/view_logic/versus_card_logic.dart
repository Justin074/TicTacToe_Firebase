import 'package:tic_tac_toe/core/models/lobby.dart';
import 'package:tic_tac_toe/core/models/player_model.dart';

class VersusCardLogic {
  String getPlayerState(Lobby lobby, PlayerModel player) {
    String playerState = '(Not Ready)';

    if (player.isReady) playerState = '(Ready)';
    if (lobby.isReady) {
      playerState = '(Waiting)';
      if (lobby.playerTurn == 0) {
        if (player.playerEmail == lobby.host.playerEmail) {
          playerState = '(Current Turn)';
        }
      } else {
        if (player.playerEmail == lobby.challenger!.playerEmail) {
          playerState = '(Current Turn)';
        }
      }
    }
    if (lobby.isDone) {
      playerState = '(Draw)';
      if (lobby.winner != null) {
        playerState = '(Lost)';
      }
      if (player.playerEmail == lobby.winner?.playerEmail) {
        playerState = '(Winner)';
      }
    }

    return playerState;
  }
}
