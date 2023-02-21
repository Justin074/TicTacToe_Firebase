import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';
import 'package:tic_tac_toe/core/styles/color_constants.dart';

class GlobalBackButton extends StatefulWidget {
  const GlobalBackButton({Key? key, this.onTap}) : super(key: key);
  final Function? onTap;

  @override
  State<GlobalBackButton> createState() => _GlobalBackButtonState();
}

class _GlobalBackButtonState extends State<GlobalBackButton>
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
    return Padding(
      padding: const EdgeInsets.only(
        left: 5,
        top: 5,
      ),
      child: Center(
        child: Animate(
          controller: _animationController,
          effects: [
            ShimmerEffect(
              duration: 250.ms,
              color: ColorConstants.logoutShadow,
            )
          ],
          child: GestureDetector(
            onTap: () {
              if (!_animationController.isAnimating) {
                _animationController.loop(count: 1);
                Future.delayed(250.ms).whenComplete(() {
                  if (widget.onTap != null) {
                    widget.onTap!();
                  } else {
                    GoRouter.of(context).pop();
                  }
                });
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
              child: const Icon(
                Icons.arrow_back_outlined,
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
