import 'package:flutter/material.dart';
import 'package:tic_tac_toe/core/extensions/string_extensions.dart';
import 'package:tic_tac_toe/core/models/lobby.dart';
import 'package:tic_tac_toe/src/game_board/view_logic/game_board_logic.dart';

import 'board_tile.dart';

class GameBoard extends StatefulWidget {
  const GameBoard({
    Key? key,
    required this.lobby,
  }) : super(key: key);

  final Lobby lobby;

  @override
  State<GameBoard> createState() => _GameBoardState();
}

class _GameBoardState extends State<GameBoard> {
  late GameBoardLogic logic;

  @override
  void initState() {
    logic = GameBoardLogic();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: Alignment.center,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    BoardTile(
                      top: true,
                      bottom: true,
                      left: true,
                      right: true,
                      marked: widget.lobby.gameBoard.board[0] != '',
                      isX: widget.lobby.gameBoard.board[0].isX,
                      index: 0,
                      lobby: widget.lobby,
                    ),
                    BoardTile(
                      top: true,
                      bottom: true,
                      marked: widget.lobby.gameBoard.board[1] != '',
                      isX: widget.lobby.gameBoard.board[1].isX,
                      index: 1,
                      lobby: widget.lobby,
                    ),
                    BoardTile(
                      top: true,
                      bottom: true,
                      left: true,
                      right: true,
                      marked: widget.lobby.gameBoard.board[2] != '',
                      isX: widget.lobby.gameBoard.board[2].isX,
                      index: 2,
                      lobby: widget.lobby,
                    ),
                  ],
                ),
                Row(
                  children: [
                    BoardTile(
                      bottom: true,
                      left: true,
                      right: true,
                      marked: widget.lobby.gameBoard.board[3] != '',
                      isX: widget.lobby.gameBoard.board[3].isX,
                      index: 3,
                      lobby: widget.lobby,
                    ),
                    BoardTile(
                      bottom: true,
                      marked: widget.lobby.gameBoard.board[4] != '',
                      isX: widget.lobby.gameBoard.board[4].isX,
                      index: 4,
                      lobby: widget.lobby,
                    ),
                    BoardTile(
                      bottom: true,
                      left: true,
                      right: true,
                      marked: widget.lobby.gameBoard.board[5] != '',
                      isX: widget.lobby.gameBoard.board[5].isX,
                      index: 5,
                      lobby: widget.lobby,
                    ),
                  ],
                ),
                Row(
                  children: [
                    BoardTile(
                      bottom: true,
                      left: true,
                      right: true,
                      marked: widget.lobby.gameBoard.board[6] != '',
                      isX: widget.lobby.gameBoard.board[6].isX,
                      index: 6,
                      lobby: widget.lobby,
                    ),
                    BoardTile(
                      bottom: true,
                      marked: widget.lobby.gameBoard.board[7] != '',
                      isX: widget.lobby.gameBoard.board[7].isX,
                      index: 7,
                      lobby: widget.lobby,
                    ),
                    BoardTile(
                      bottom: true,
                      left: true,
                      right: true,
                      marked: widget.lobby.gameBoard.board[8] != '',
                      isX: widget.lobby.gameBoard.board[8].isX,
                      index: 8,
                      lobby: widget.lobby,
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
        logic.getVictoryState(widget.lobby) ?? const SizedBox(),
      ],
    );
  }
}
