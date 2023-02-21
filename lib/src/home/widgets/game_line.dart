import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:tic_tac_toe/core/styles/color_constants.dart';
import 'package:tic_tac_toe/core/styles/text_style_constants.dart';

class GameLines extends StatelessWidget {
  const GameLines({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Animate(
          child: const Text(
            'X',
            style: TextStyleConstants.lineText,
          ),
        ).scaleXY(duration: 400.ms),
        Animate(
          child: Container(
            width: MediaQuery.of(context).size.width * 0.3,
            height: 10,
            decoration: BoxDecoration(
              color: ColorConstants.gameLines,
              borderRadius: BorderRadius.circular(25),
              boxShadow: const <BoxShadow>[
                BoxShadow(
                  color: ColorConstants.lighterBackground,
                  spreadRadius: 2,
                  blurRadius: 5,
                ),
              ],
            ),
          ),
        ).scaleXY(duration: 400.ms).fadeIn(duration: 400.ms),
        Animate(
          child: const Text(
            'O',
            style: TextStyleConstants.lineText,
          ),
        ).scaleXY(duration: 400.ms).fadeIn(duration: 400.ms),
        Animate(
          child: Container(
            width: MediaQuery.of(context).size.width * 0.3,
            height: 10,
            decoration: BoxDecoration(
              color: ColorConstants.gameLines,
              borderRadius: BorderRadius.circular(25),
              boxShadow: const <BoxShadow>[
                BoxShadow(
                  color: ColorConstants.lighterBackground,
                  spreadRadius: 2,
                  blurRadius: 5,
                ),
              ],
            ),
          ),
        ).scaleXY(duration: 400.ms).fadeIn(duration: 400.ms),
        Animate(
          child: const Text(
            'X',
            style: TextStyleConstants.lineText,
          ),
        ).scaleXY(duration: 400.ms).fadeIn(duration: 400.ms),
      ],
    );
  }
}
