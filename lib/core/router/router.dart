import 'package:go_router/go_router.dart';
import 'package:tic_tac_toe/core/router/routes_enum.dart';
import 'package:tic_tac_toe/core/router/routes_extension.dart';

class GoRouting {
  static GoRouter initRouter() {
    return GoRouter(
      restorationScopeId: 'root',
      routes: Routes.values.map((Routes route) {
        return route.fetchGoRoute();
      }).toList(),
      initialLocation: '/',
    );
  }
}
