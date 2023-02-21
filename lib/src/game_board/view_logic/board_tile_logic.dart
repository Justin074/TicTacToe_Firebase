import 'package:flutter/material.dart';
import 'package:tic_tac_toe/core/models/lobby.dart';
import 'package:tic_tac_toe/core/models/player_model.dart';
import 'package:tic_tac_toe/core/repository/lobby_repository.dart';
import 'package:tic_tac_toe/core/utilities/auth_service.dart';
import 'package:tic_tac_toe/src/game_board/widgets/o.dart';
import 'package:tic_tac_toe/src/game_board/widgets/x.dart';

class BoardTileLogic {
  Widget? buildXorO(bool isMarked, bool isX) {
    if (!isMarked) return null;
    if (isX) return const X();
    return const O();
  }

  Future<void> markTile(Lobby lobby, int index, bool isMarked) async {
    if (!isMarked && !lobby.isDone && lobby.isReady) {
      final PlayerModel currentPlayer = AuthService.playerModel;
      int currentPlayerType = 0;

      if (lobby.host.playerEmail == currentPlayer.playerEmail) {
        currentPlayerType = 0;
      }
      if (lobby.challenger?.playerEmail == currentPlayer.playerEmail) {
        currentPlayerType = 1;
      }

      if (currentPlayerType == lobby.playerTurn) {
        lobby.gameBoard.board[index] = lobby.playerTurn == 0 ? 'X' : 'O';
        await LobbyRepository.setGameBoard(
          lobby.id,
          lobby.gameBoard,
          lobby.playerTurn == 0 ? 1 : 0,
        );
      }
    }
  }
}
