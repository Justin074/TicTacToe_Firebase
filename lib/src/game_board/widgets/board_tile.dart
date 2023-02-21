import 'package:flutter/material.dart';
import 'package:tic_tac_toe/core/models/lobby.dart';
import 'package:tic_tac_toe/core/styles/color_constants.dart';
import 'package:tic_tac_toe/src/game_board/view_logic/board_tile_logic.dart';

class BoardTile extends StatefulWidget {
  const BoardTile({
    Key? key,
    required this.index,
    required this.lobby,
    this.top = false,
    this.bottom = false,
    this.left = false,
    this.right = false,
    this.marked = false,
    this.isX = true,
  }) : super(key: key);

  final int index;
  final Lobby lobby;
  final bool top;
  final bool bottom;
  final bool left;
  final bool right;
  final bool marked;
  final bool isX;

  @override
  State<BoardTile> createState() => _BoardTileState();
}

class _BoardTileState extends State<BoardTile> {
  late BoardTileLogic logic;

  @override
  void initState() {
    logic = BoardTileLogic();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        await logic.markTile(
          widget.lobby,
          widget.index,
          widget.marked,
        );
      },
      child: Container(
        width: MediaQuery.of(context).size.width * 0.3128,
        height: MediaQuery.of(context).size.width * 0.3128,
        decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(
              color: ColorConstants.boardColorShadow,
              spreadRadius: 0,
              blurRadius: 1,
              blurStyle: BlurStyle.outer,
            ),
          ],
          border: Border(
            top: widget.top
                ? const BorderSide(
                    color: ColorConstants.boardColor,
                  )
                : BorderSide.none,
            bottom: widget.bottom
                ? const BorderSide(
                    color: ColorConstants.boardColor,
                  )
                : BorderSide.none,
            left: widget.left
                ? const BorderSide(
                    color: ColorConstants.boardColor,
                  )
                : BorderSide.none,
            right: widget.right
                ? const BorderSide(
                    color: ColorConstants.boardColor,
                  )
                : BorderSide.none,
          ),
        ),
        child: logic.buildXorO(
          widget.marked,
          widget.isX,
        ),
      ),
    );
  }
}
