import 'package:firebase_auth/firebase_auth.dart';
import 'package:tic_tac_toe/core/models/auth_model.dart';
import 'package:tic_tac_toe/core/repository/auth_repository.dart';
import 'package:tic_tac_toe/core/utilities/base_notifier.dart';

class AuthProvider extends BaseNotifier<AuthModel> {
  AuthProvider() : super(classCreator: () => AuthModel());

  Future<bool> googleLogin() async {
    valueNotifier.value.isLoading = true;
    notifyClients();
    try {
      final UserCredential? userCredential = await AuthRepository.googleLogin();

      valueNotifier.value.isAuthenticated = true;
      if (userCredential?.user == null) {
        valueNotifier.value.isAuthenticated = false;
      }

      valueNotifier.value.isLoading = false;
    } catch (_) {
      valueNotifier.value.isLoading = false;
      valueNotifier.value.isAuthenticated = false;
    }

    notifyClients();
    return valueNotifier.value.isAuthenticated;
  }

  Future<void> googleLogout() async {
    valueNotifier.value.isLoading = true;
    valueNotifier.value.isAuthenticated = false;
    notifyClients();
    try {
      await AuthRepository.googleLogout();
    } catch (_) {
      valueNotifier.value.isLoading = false;
      valueNotifier.value.isAuthenticated = false;
    }
    valueNotifier.value.isLoading = false;
    notifyClients();
  }
}
