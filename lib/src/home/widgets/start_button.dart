import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';
import 'package:tic_tac_toe/core/providers/auth_provider.dart';
import 'package:tic_tac_toe/core/router/routes_enum.dart';
import 'package:tic_tac_toe/core/styles/color_constants.dart';
import 'package:tic_tac_toe/core/styles/text_style_constants.dart';

class StartButton extends StatefulWidget {
  const StartButton({
    Key? key,
    required this.authProvider,
  }) : super(key: key);

  final AuthProvider authProvider;

  @override
  State<StartButton> createState() => _StartButtonState();
}

class _StartButtonState extends State<StartButton>
    with TickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    _animationController = AnimationController(vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Animate(
      controller: _animationController,
      effects: [
        ShakeEffect(duration: 400.ms),
      ],
      child: GestureDetector(
        onTap: () {
          if (!_animationController.isAnimating) {
            _animationController.loop(count: 1, period: 300.ms);
            Future.delayed(250.ms).whenComplete(() async {
              final bool authenticated =
                  await widget.authProvider.googleLogin();
              if (mounted) {
                if (authenticated) {
                  GoRouter.of(context).pushNamed(
                    Routes.optionsMenu.routeName,
                  );
                }
              }
            });
          }
        },
        child: Column(
          children: [
            Animate(
              child: Container(
                width: MediaQuery.of(context).size.width * 0.25,
                height: MediaQuery.of(context).size.width * 0.25,
                decoration: const BoxDecoration(
                  color: ColorConstants.playButton,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.elliptical(100, 60),
                    bottomRight: Radius.elliptical(100, 60),
                    topLeft: Radius.elliptical(20, 20),
                    bottomLeft: Radius.elliptical(20, 20),
                  ),
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                      color: ColorConstants.playButtonShadow,
                      spreadRadius: 2,
                      blurRadius: 6,
                      offset: Offset(6, 6),
                    ),
                  ],
                ),
              ),
            )
                .slideY(
                  duration: 400.ms,
                )
                .scaleXY(duration: 400.ms),
            const SizedBox(
              height: 10,
            ),
            Animate(
              child: const Text(
                'PLAY',
                style: TextStyleConstants.playText,
              ),
            )
                .show(duration: 400.ms)
                .then()
                .fadeIn(duration: 200.ms)
                .scaleXY(duration: 200.ms),
          ],
        ),
      ),
    );
  }
}
