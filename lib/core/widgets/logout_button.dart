import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:tic_tac_toe/core/providers/auth_provider.dart';
import 'package:tic_tac_toe/core/router/routes_enum.dart';
import 'package:tic_tac_toe/core/styles/color_constants.dart';

class LogoutButton extends StatefulWidget {
  const LogoutButton({Key? key}) : super(key: key);

  @override
  State<LogoutButton> createState() => _LogoutButtonState();
}

class _LogoutButtonState extends State<LogoutButton>
    with TickerProviderStateMixin {
  late AnimationController _logoutController;

  @override
  void initState() {
    _logoutController = AnimationController(vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _logoutController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        right: 5,
        top: 5,
      ),
      child: Center(
        child: Animate(
          controller: _logoutController,
          effects: [
            ShimmerEffect(
              duration: 250.ms,
              color: ColorConstants.logoutShadow,
            )
          ],
          child: GestureDetector(
            onTap: () {
              if (!_logoutController.isAnimating) {
                _logoutController.loop(count: 1);
                Future.delayed(250.ms).whenComplete(
                  () async {
                    await GetIt.I<AuthProvider>().googleLogout();
                    if (mounted) {
                      GoRouter.of(context).goNamed(Routes.home.routeName);
                    }
                  },
                );
              }
            },
            child: Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                border: Border.all(
                  color: ColorConstants.logoutBorder,
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(5),
                boxShadow: const <BoxShadow>[
                  BoxShadow(
                    color: ColorConstants.logoutShadow,
                    spreadRadius: 0,
                    blurRadius: 6,
                    blurStyle: BlurStyle.outer,
                  ),
                ],
              ),
              child: const  Icon(
                Icons.logout,
                size: 30,
                color: ColorConstants.logoutIcon,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
