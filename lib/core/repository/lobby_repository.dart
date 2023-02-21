import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tic_tac_toe/core/models/game_board_model.dart';
import 'package:tic_tac_toe/core/models/lobby.dart';
import 'package:tic_tac_toe/core/models/player_model.dart';
import 'package:tic_tac_toe/core/utilities/auth_service.dart';

class LobbyRepository {
  static Future<String?> createLobby(
    Lobby lobby,
  ) async {
    String? lobbyId;
    try {
      FirebaseFirestore db = FirebaseFirestore.instance;
      DocumentReference<Map<String, dynamic>> docRef =
          await db.collection('lobbies').add(lobby.toMap());
      lobbyId = docRef.id;
    } catch (e) {
      lobbyId = null;
    }
    return lobbyId;
  }

  static Stream<QuerySnapshot<Map<String, dynamic>>> getLobbies() {
    FirebaseFirestore db = FirebaseFirestore.instance;
    return db.collection('lobbies').snapshots();
  }

  static Stream<DocumentSnapshot<Map<String, dynamic>>> getSingleLobby(
    String lobbyId,
  ) {
    FirebaseFirestore db = FirebaseFirestore.instance;
    return db.collection('lobbies').doc(lobbyId).snapshots();
  }

  static Future<void> joinLobby(Lobby lobby) async {
    if (lobby.challenger == null &&
        lobby.host.playerEmail != AuthService.userCredentials!.email) {
      FirebaseFirestore db = FirebaseFirestore.instance;
      DocumentReference<Map<String, dynamic>> document =
          db.collection('lobbies').doc(lobby.id);
      await document.update(
        <String, dynamic>{
          'challenger': AuthService.playerModel.toMap(),
        },
      );
    }
  }

  static Future<void> updatePlayer(
    String lobbyId,
    int player,
    PlayerModel playerData,
  ) async {
    FirebaseFirestore db = FirebaseFirestore.instance;
    DocumentReference<Map<String, dynamic>> document =
        db.collection('lobbies').doc(lobbyId);
    if (player == 0) {
      await document.update(
        <String, dynamic>{
          'host': playerData.toMap(),
        },
      );
    } else {
      await document.update(
        <String, dynamic>{
          'challenger': playerData.toMap(),
        },
      );
    }
  }

  static Future<void> setLobbyReady(String lobbyId) async {
    FirebaseFirestore db = FirebaseFirestore.instance;
    DocumentReference<Map<String, dynamic>> document =
        db.collection('lobbies').doc(lobbyId);
    await document.update(
      <String, dynamic>{
        'isReady': true,
      },
    );
  }

  static Future<void> setGameBoard(
    String lobbyId,
    GameBoardModel boardData,
    int newTurn,
  ) async {
    FirebaseFirestore db = FirebaseFirestore.instance;
    DocumentReference<Map<String, dynamic>> document =
        db.collection('lobbies').doc(lobbyId);
    await document.update(
      <String, dynamic>{
        'gameBoard': boardData.board,
        'playerTurn': newTurn,
      },
    );
  }

  static Future<void> finishGameBoard(
      String lobbyId, PlayerModel? winner) async {
    FirebaseFirestore db = FirebaseFirestore.instance;
    DocumentReference<Map<String, dynamic>> document =
        db.collection('lobbies').doc(lobbyId);
    await document.update(
      <String, dynamic>{
        'isDone': true,
        'winner': winner?.toMap(),
      },
    );
  }

  static Future<void> deleteLobby(String lobbyId) async {
    FirebaseFirestore db = FirebaseFirestore.instance;
    DocumentReference<Map<String, dynamic>> document =
        db.collection('lobbies').doc(lobbyId);
    await document.delete();
  }
}
