import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:tic_tac_toe/core/models/lobby.dart';
import 'package:tic_tac_toe/core/repository/lobby_repository.dart';
import 'package:tic_tac_toe/core/styles/color_constants.dart';
import 'package:tic_tac_toe/core/widgets/back_button.dart';
import 'package:tic_tac_toe/src/lobby_list/view_logic/lobby_view_logic.dart';
import 'package:tic_tac_toe/src/lobby_list/widgets/lobby_tile.dart';
import 'package:tic_tac_toe/src/lobby_list/widgets/lobby_title.dart';

class LobbyListView extends StatefulWidget {
  const LobbyListView({Key? key}) : super(key: key);

  @override
  State<LobbyListView> createState() => _LobbyListViewState();
}

class _LobbyListViewState extends State<LobbyListView> {
  late LobbyViewLogic logic;

  @override
  void initState() {
    logic = LobbyViewLogic();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
      child: Scaffold(
        backgroundColor: ColorConstants.background,
        appBar: AppBar(
          backgroundColor: ColorConstants.background,
          elevation: 0,
          leading: const GlobalBackButton(),
        ),
        extendBodyBehindAppBar: false,
        body: SafeArea(
          child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
            stream: LobbyRepository.getLobbies(),
            builder: (
              BuildContext context,
              AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot,
            ) {
              List<Lobby> lobbies = <Lobby>[];
              if (snapshot.hasData) {
                lobbies = Lobby.fromQueryDoc(snapshot.data!.docs);
                lobbies.removeWhere((Lobby lobby) {
                  return !logic.canViewLobby(lobby);
                });
              }

              return SingleChildScrollView(
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const LobbyTitle(),
                        const SizedBox(
                          height: 20,
                        ),
                        ...lobbies.map((Lobby lobby) {
                          return LobbyTile(
                            lobby: lobby,
                          );
                        }).toList(),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
