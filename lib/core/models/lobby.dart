import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tic_tac_toe/core/models/game_board_model.dart';
import 'package:tic_tac_toe/core/models/player_model.dart';

class Lobby {
  Lobby({
    required this.lobbyName,
    required this.host,
    this.id = '',
    this.isReady = false,
    this.isDone = false,
    this.winner,
    this.challenger,
    this.allPlayersLeft = false,
    this.playerTurn = 0,
  });

  final String lobbyName;
  final PlayerModel host;
  String id;
  bool isReady;
  bool isDone;
  int playerTurn;
  PlayerModel? winner;
  PlayerModel? challenger;
  bool allPlayersLeft;
  GameBoardModel gameBoard = GameBoardModel();

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'lobbyName': lobbyName,
      'isReady': isReady,
      'isDone': isDone,
      'host': host.toMap(),
      'challenger': challenger?.toMap() ?? <String, dynamic>{},
      'winner': winner?.toMap() ?? <String, dynamic>{},
      'gameBoard': gameBoard.board,
      'playerTurn': playerTurn,
      'allPlayersLeft': allPlayersLeft,
    };
  }

  static List<Lobby> fromQueryDoc(
    List<QueryDocumentSnapshot<Map<String, dynamic>>> documents,
  ) {
    return documents.map(
      (QueryDocumentSnapshot<Map<String, dynamic>> document) {
        final Lobby lobby = Lobby(
          id: document.id,
          lobbyName: document.get('lobbyName'),
          host: PlayerModel.fromMap(document.get('host'))!,
          playerTurn: document.get('playerTurn'),
          allPlayersLeft: document.get('allPlayersLeft'),
        );
        lobby.challenger = PlayerModel.fromMap(document.get('challenger'));
        lobby.winner = PlayerModel.fromMap(document.get('winner'));
        lobby.isReady = document.get('isReady');
        lobby.isDone = document.get('isDone');
        lobby.gameBoard.board = List<String>.from(document.get('gameBoard'));
        return lobby;
      },
    ).toList();
  }

  static Lobby fromDocSnapshot(
    DocumentSnapshot<Map<String, dynamic>> document,
  ) {
    final Lobby lobby = Lobby(
      id: document.id,
      lobbyName: document.get('lobbyName'),
      host: PlayerModel.fromMap(document.get('host'))!,
      playerTurn: document.get('playerTurn'),
      allPlayersLeft: document.get('allPlayersLeft'),
    );
    lobby.challenger = PlayerModel.fromMap(document.get('challenger'));
    lobby.winner = PlayerModel.fromMap(document.get('winner'));
    lobby.isReady = document.get('isReady');
    lobby.isDone = document.get('isDone');
    lobby.gameBoard.board = List<String>.from(document.get('gameBoard'));
    return lobby;
  }
}
