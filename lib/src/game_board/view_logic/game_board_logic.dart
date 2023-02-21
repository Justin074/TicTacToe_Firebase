import 'package:tic_tac_toe/core/models/lobby.dart';
import 'package:tic_tac_toe/core/models/player_model.dart';
import 'package:tic_tac_toe/core/repository/lobby_repository.dart';
import 'package:tic_tac_toe/src/game_board/widgets/victory_line.dart';

class GameBoardLogic {
  VictoryLine? getVictoryState(Lobby lobby) {
    final VictoryState? finishedState = _detectVictory(lobby.gameBoard.board);
    final bool isBoardDone = _isBoardDone(lobby.gameBoard.board);

    if (finishedState == null && isBoardDone) {
      LobbyRepository.finishGameBoard(lobby.id, null);
    }

    if (finishedState != null) {
      final PlayerModel winner =
          lobby.playerTurn == 0 ? lobby.challenger! : lobby.host;
      LobbyRepository.finishGameBoard(lobby.id, winner);

      return VictoryLine(
        state: finishedState,
      );
    }
    return null;
  }

  VictoryState? _detectVictory(List<String> gameBoard) {
    if (_horizontalTopCheck(gameBoard)) return VictoryState.horizontalTop;
    if (_horizontalMiddleCheck(gameBoard)) return VictoryState.horizontalMiddle;
    if (_horizontalBottomCheck(gameBoard)) return VictoryState.horizontalBottom;
    if (_verticalLeftCheck(gameBoard)) return VictoryState.verticalLeft;
    if (_verticalMiddleCheck(gameBoard)) return VictoryState.verticalMiddle;
    if (_verticalRightCheck(gameBoard)) return VictoryState.verticalRight;
    if (_diagonalLeftCheck(gameBoard)) return VictoryState.diagonalLeft;
    if (_diagonalRightCheck(gameBoard)) return VictoryState.diagonalRight;
    return null;
  }

  bool _isBoardDone(List<String> gameBoard) {
    return !gameBoard.any((String value) => value == '');
  }

  bool _horizontalTopCheck(List<String> gameBoard) {
    if (gameBoard[0] == '' || gameBoard[1] == '' || gameBoard[2] == '') {
      return false;
    }
    return gameBoard[0] == gameBoard[1] && gameBoard[1] == gameBoard[2];
  }

  bool _horizontalMiddleCheck(List<String> gameBoard) {
    if (gameBoard[3] == '' || gameBoard[4] == '' || gameBoard[5] == '') {
      return false;
    }
    return gameBoard[3] == gameBoard[4] && gameBoard[4] == gameBoard[5];
  }

  bool _horizontalBottomCheck(List<String> gameBoard) {
    if (gameBoard[6] == '' || gameBoard[7] == '' || gameBoard[8] == '') {
      return false;
    }
    return gameBoard[6] == gameBoard[7] && gameBoard[7] == gameBoard[8];
  }

  bool _verticalLeftCheck(List<String> gameBoard) {
    if (gameBoard[0] == '' || gameBoard[3] == '' || gameBoard[6] == '') {
      return false;
    }
    return gameBoard[0] == gameBoard[3] && gameBoard[3] == gameBoard[6];
  }

  bool _verticalMiddleCheck(List<String> gameBoard) {
    if (gameBoard[1] == '' || gameBoard[4] == '' || gameBoard[7] == '') {
      return false;
    }
    return gameBoard[1] == gameBoard[4] && gameBoard[4] == gameBoard[7];
  }

  bool _verticalRightCheck(List<String> gameBoard) {
    if (gameBoard[2] == '' || gameBoard[5] == '' || gameBoard[8] == '') {
      return false;
    }
    return gameBoard[2] == gameBoard[5] && gameBoard[5] == gameBoard[8];
  }

  bool _diagonalLeftCheck(List<String> gameBoard) {
    if (gameBoard[0] == '' || gameBoard[4] == '' || gameBoard[8] == '') {
      return false;
    }
    return gameBoard[0] == gameBoard[4] && gameBoard[4] == gameBoard[8];
  }

  bool _diagonalRightCheck(List<String> gameBoard) {
    if (gameBoard[2] == '' || gameBoard[4] == '' || gameBoard[6] == '') {
      return false;
    }
    return gameBoard[2] == gameBoard[4] && gameBoard[4] == gameBoard[6];
  }
}
