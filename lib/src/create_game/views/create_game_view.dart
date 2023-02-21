import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:tic_tac_toe/core/models/lobby_page_model.dart';
import 'package:tic_tac_toe/core/providers/lobby_provider.dart';
import 'package:tic_tac_toe/core/styles/color_constants.dart';
import 'package:tic_tac_toe/core/widgets/back_button.dart';
import 'package:tic_tac_toe/core/widgets/page_loader.dart';
import 'package:tic_tac_toe/src/create_game/widgets/create_text_field.dart';
import 'package:tic_tac_toe/src/create_game/widgets/create_title.dart';

class CreateGameView extends StatefulWidget {
  const CreateGameView({Key? key}) : super(key: key);

  @override
  State<CreateGameView> createState() => _CreateGameViewState();
}

class _CreateGameViewState extends State<CreateGameView> {
  late LobbyProvider _lobbyProvider;

  @override
  void initState() {
    _lobbyProvider = GetIt.I<LobbyProvider>();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
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
        body: ValueListenableBuilder<LobbyLoaderModel>(
          valueListenable: _lobbyProvider.valueNotifier,
          builder: (
            BuildContext context,
            LobbyLoaderModel model,
            Widget? child,
          ) {
            return SafeArea(
              child: Stack(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const <Widget>[
                        CreateTitle(),
                        CreateTextField(),
                      ],
                    ),
                  ),
                  if (model.isLoading) const PageLoader(),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
