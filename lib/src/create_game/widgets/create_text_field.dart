import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:tic_tac_toe/core/models/lobby.dart';
import 'package:tic_tac_toe/core/providers/lobby_provider.dart';
import 'package:tic_tac_toe/core/router/routes_enum.dart';
import 'package:tic_tac_toe/core/styles/color_constants.dart';
import 'package:tic_tac_toe/core/styles/text_style_constants.dart';
import 'package:tic_tac_toe/core/utilities/auth_service.dart';

class CreateTextField extends StatefulWidget {
  const CreateTextField({Key? key}) : super(key: key);

  @override
  State<CreateTextField> createState() => _CreateTextFieldState();
}

class _CreateTextFieldState extends State<CreateTextField>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late GlobalKey<FormState> _formKey;
  late TextEditingController _textEditingController;

  @override
  void initState() {
    _animationController = AnimationController(vsync: this);
    _formKey = GlobalKey<FormState>();
    _textEditingController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          Text(
            'CHOOSE A NAME',
            style: TextStyleConstants.titleText.copyWith(
              fontSize: 20,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 5,
          ),
          Form(
            key: _formKey,
            child: TextFormField(
              cursorColor: ColorConstants.formFieldBorder,
              controller: _textEditingController,
              validator: (String? value) {
                if (value == null) return 'Please enter a name';
                if (value.trim() == '') return 'Please enter a name';
                if (value.trim().length > 30) {
                  return 'Name must be less '
                      'than or equal to 30 characters';
                }
                if (value.trim().length < 5) {
                  return 'Name must be greater '
                      'than or equal to 5 characters';
                }
                return null;
              },
              decoration: const InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: ColorConstants.titleText,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: ColorConstants.formFieldBorder,
                  ),
                ),
                errorBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: ColorConstants.logoutShadow,
                  ),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: ColorConstants.logoutShadow,
                  ),
                ),
              ),
              style: TextStyleConstants.titleText.copyWith(
                fontSize: 15,
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Animate(
            controller: _animationController,
            effects: [
              ShakeEffect(duration: 250.ms),
            ],
            child: GestureDetector(
              onTap: () {
                if (!_animationController.isAnimating) {
                  _animationController.loop(count: 1);
                  Future.delayed(250.ms).whenComplete(() async {
                    final bool validData =
                        _formKey.currentState?.validate() ?? false;

                    if (validData) {
                      final String? lobbyId =
                          await GetIt.I<LobbyProvider>().createLobby(
                        Lobby(
                          lobbyName: _textEditingController.text,
                          host: AuthService.playerModel,
                        ),
                      );
                      if (mounted && lobbyId != null) {
                        GoRouter.of(context).pushNamed(
                          Routes.gameBoard.routeName,
                          extra: lobbyId,
                        );
                      }
                    }
                  });
                }
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 10,
                ),
                child: Animate(
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.1,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: ColorConstants.secondaryButtonBorder,
                      ),
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: <BoxShadow>[
                        const BoxShadow(
                          color: ColorConstants.secondaryButtonShadow,
                          spreadRadius: 0,
                          blurRadius: 10,
                          blurStyle: BlurStyle.outer,
                        ),
                        BoxShadow(
                          color: ColorConstants.secondaryButtonInsetShadow,
                          spreadRadius: 0,
                          blurRadius: MediaQuery.of(context).size.width,
                          blurStyle: BlurStyle.inner,
                        ),
                      ],
                    ),
                    child: const Center(
                      child: Text(
                        'SUBMIT',
                        style: TextStyleConstants.buttonText,
                      ),
                    ),
                  ),
                ).show(duration: 500.ms).then().scaleXY(duration: 250.ms),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
