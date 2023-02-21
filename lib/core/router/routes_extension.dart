import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tic_tac_toe/core/router/routes_enum.dart';
import 'package:tic_tac_toe/src/create_game/views/create_game_view.dart';
import 'package:tic_tac_toe/src/game_board/views/game_board_view.dart';
import 'package:tic_tac_toe/src/home/views/home_view.dart';
import 'package:tic_tac_toe/src/lobby_list/views/lobby_list_view.dart';
import 'package:tic_tac_toe/src/options_menu/views/options_menu_view.dart';

extension GoRoutesExtension on Routes {
  GoRoute fetchGoRoute() {
    switch (this) {
      case Routes.initial:
        return GoRoute(
          name: routeName,
          path: '/',
          builder: (BuildContext context, GoRouterState state) {
            return const HomeView();
          },
        );
      case Routes.home:
        return GoRoute(
          name: routeName,
          path: path,
          builder: (BuildContext context, GoRouterState state) {
            return const HomeView();
          },
        );
      case Routes.optionsMenu:
        return GoRoute(
          name: routeName,
          path: path,
          builder: (BuildContext context, GoRouterState state) {
            return const OptionsMenuView();
          },
        );
      case Routes.createGame:
        return GoRoute(
          name: routeName,
          path: path,
          builder: (BuildContext context, GoRouterState state) {
            return const CreateGameView();
          },
        );
      case Routes.lobbyList:
        return GoRoute(
          name: routeName,
          path: path,
          builder: (BuildContext context, GoRouterState state) {
            return const LobbyListView();
          },
        );
      case Routes.gameBoard:
        return GoRoute(
          name: routeName,
          path: path,
          builder: (BuildContext context, GoRouterState state) {
            return GameBoardView(
              lobbyId: state.extra! as String,
            );
          },
        );
    }
  }
}
