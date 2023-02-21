import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:tic_tac_toe/core/models/lobby.dart';
import 'package:tic_tac_toe/core/repository/lobby_repository.dart';
import 'package:tic_tac_toe/core/styles/color_constants.dart';
import 'package:tic_tac_toe/core/widgets/back_button.dart';
import 'package:tic_tac_toe/src/game_board/widgets/game_board.dart';
import 'package:tic_tac_toe/src/game_board/widgets/ready_button.dart';
import 'package:tic_tac_toe/src/game_board/widgets/versus_card.dart';

class GameBoardView extends StatefulWidget {
  const GameBoardView({
    Key? key,
    required this.lobbyId,
  }) : super(key: key);

  final String lobbyId;

  @override
  State<GameBoardView> createState() => _GameBoardViewState();
}

class _GameBoardViewState extends State<GameBoardView>{
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
      stream: LobbyRepository.getSingleLobby(widget.lobbyId),
      builder: (
        BuildContext context,
        AsyncSnapshot<DocumentSnapshot<Map<String, dynamic>>> snapshot,
      ) {
        bool isLoading = true;
        Lobby? lobby;
        if (snapshot.hasData) {
          isLoading = false;
          lobby = Lobby.fromDocSnapshot(snapshot.data!);
        }
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
          child: Scaffold(
            backgroundColor: ColorConstants.background,
            extendBodyBehindAppBar: false,
            appBar: AppBar(
              backgroundColor: ColorConstants.background,
              elevation: 0,
              leading: const GlobalBackButton(),
            ),
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: isLoading
                    ? const Center(
                        child: CircularProgressIndicator(
                          color: ColorConstants.gameLines,
                        ),
                      )
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          VersusCard(
                            lobby: lobby!,
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.939,
                            height: MediaQuery.of(context).size.width * 0.939,
                            child: GameBoard(
                              lobby: lobby,
                            ),
                          ),
                          if (!lobby.isReady)
                            ReadyButton(
                              lobby: lobby,
                            ),
                        ],
                      ),
              ),
            ),
          ),
        );
      },
    );
  }
}
