import 'package:tic_tac_toe/core/models/lobby.dart';
import 'package:tic_tac_toe/core/models/lobby_page_model.dart';
import 'package:tic_tac_toe/core/repository/lobby_repository.dart';
import 'package:tic_tac_toe/core/utilities/base_notifier.dart';

class LobbyProvider extends BaseNotifier<LobbyLoaderModel> {
  LobbyProvider() : super(classCreator: () => LobbyLoaderModel());

  Future<String?> createLobby(Lobby lobby) async {
    valueNotifier.value.isLoading = true;
    String? lobbyId;
    notifyClients();
    try {
      lobbyId = await LobbyRepository.createLobby(lobby);
    } catch (e) {
      lobbyId = null;
    }
    valueNotifier.value.isLoading = false;
    notifyClients();
    return lobbyId;
  }
}
