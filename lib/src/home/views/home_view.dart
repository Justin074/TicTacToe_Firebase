import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:tic_tac_toe/core/models/auth_model.dart';
import 'package:tic_tac_toe/core/providers/auth_provider.dart';
import 'package:tic_tac_toe/core/styles/color_constants.dart';
import 'package:tic_tac_toe/core/widgets/page_loader.dart';
import 'package:tic_tac_toe/src/home/widgets/game_line.dart';
import 'package:tic_tac_toe/src/home/widgets/game_title.dart';
import 'package:tic_tac_toe/src/home/widgets/start_button.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late AuthProvider _authProvider;

  @override
  void initState() {
    _authProvider = GetIt.I<AuthProvider>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
      child: Scaffold(
        backgroundColor: ColorConstants.background,
        body: ValueListenableBuilder<AuthModel>(
          valueListenable: _authProvider.valueNotifier,
          builder: (BuildContext context, AuthModel authModel, Widget? child) {
            return SafeArea(
              child: Stack(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        const GameTitle(),
                        const GameLines(),
                        StartButton(
                          authProvider: _authProvider,
                        ),
                      ],
                    ),
                  ),
                  if (authModel.isLoading) const PageLoader(),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
