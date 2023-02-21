import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tic_tac_toe/core/router/routes_enum.dart';
import 'package:tic_tac_toe/core/styles/color_constants.dart';
import 'package:tic_tac_toe/core/utilities/auth_service.dart';
import 'package:tic_tac_toe/core/widgets/logout_button.dart';
import 'package:tic_tac_toe/src/options_menu/widgets/create_button.dart';
import 'package:tic_tac_toe/src/options_menu/widgets/options_title.dart';
import 'package:tic_tac_toe/src/options_menu/widgets/secondary_button.dart';

class OptionsMenuView extends StatefulWidget {
  const OptionsMenuView({Key? key}) : super(key: key);

  @override
  State<OptionsMenuView> createState() => _OptionsMenuViewState();
}

class _OptionsMenuViewState extends State<OptionsMenuView>
    with TickerProviderStateMixin {
  late User user;

  @override
  void initState() {
    user = AuthService.userCredentials!;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
      child: Scaffold(
        backgroundColor: ColorConstants.background,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: ColorConstants.background,
          automaticallyImplyLeading: false,
          actions: const <Widget>[
            LogoutButton(),
          ],
        ),
        extendBodyBehindAppBar: false,
        body: SafeArea(
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                OptionsTitle(title: user.displayName ?? 'N/A'),
                Column(
                  children: [
                    const CreateButton(),
                    SecondaryButton(
                      title: 'MULTIPLAYER',
                      onTap: () {
                        GoRouter.of(context).pushNamed(
                          Routes.lobbyList.routeName,
                        );
                      },
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
