class PlayerModel {
  PlayerModel({
    required this.playerName,
    required this.playerEmail,
    required this.selection,
    this.isReady = false,
  });

  final String playerName;
  final String playerEmail;
  final String selection;
  bool isReady;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'playerName': playerName,
      'playerEmail': playerEmail,
      'selection': selection,
      'isReady': isReady,
    };
  }

  static PlayerModel? fromMap(
    Map<String, dynamic> document,
  ) {
    if (document['playerName'] == null) return null;
    return PlayerModel(
      playerName: document['playerName'],
      playerEmail: document['playerEmail'],
      selection: document['selection'],
      isReady: document['isReady'],
    );
  }
}
