import 'package:get_it/get_it.dart';
import 'package:tic_tac_toe/core/providers/auth_provider.dart';
import 'package:tic_tac_toe/core/providers/lobby_provider.dart';

class DI {
  static init() {
    _registerProviders();
  }

  static Future<void> _registerProviders() async {
    GetIt.I.registerSingleton<AuthProvider>(AuthProvider());
    GetIt.I.registerSingleton<LobbyProvider>(LobbyProvider());
  }
}
