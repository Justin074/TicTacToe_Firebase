import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:tic_tac_toe/core/styles/color_constants.dart';

class O extends StatelessWidget {
  const O({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Animate(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: ColorConstants.oColorGame,
                width: 1.5,
              ),
              boxShadow: const <BoxShadow>[
                BoxShadow(
                  color: ColorConstants.xColorGame,
                  spreadRadius: 0,
                  blurRadius: 2,
                  blurStyle: BlurStyle.outer,
                )
              ]),
        ),
      ),
    )
        .scaleXY(duration: 400.ms, curve: Curves.decelerate)
        .slideY(duration: 400.ms, curve: Curves.decelerate)
        .flip(duration: 400.ms, curve: Curves.decelerate);
  }
}
