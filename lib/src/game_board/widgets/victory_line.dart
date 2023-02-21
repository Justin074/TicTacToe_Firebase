import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:tic_tac_toe/core/styles/color_constants.dart';

enum VictoryState {
  verticalLeft,
  verticalMiddle,
  verticalRight,
  horizontalTop,
  horizontalMiddle,
  horizontalBottom,
  diagonalLeft,
  diagonalRight
}

class VictoryLine extends StatelessWidget {
  const VictoryLine({
    Key? key,
    required this.state,
  }) : super(key: key);

  final VictoryState state;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Center(
        child: Animate(
          effects: [
            if (state == VictoryState.diagonalRight)
              RotateEffect(
                duration: 400.ms,
                curve: Curves.decelerate,
                begin: 0,
                end: 0.1259,
                alignment: Alignment.center,
              ),
            if (state == VictoryState.diagonalLeft)
              RotateEffect(
                duration: 400.ms,
                curve: Curves.decelerate,
                begin: 0,
                end: -0.1259,
                alignment: Alignment.center,
              ),
            if (state == VictoryState.horizontalMiddle)
              RotateEffect(
                duration: 400.ms,
                curve: Curves.decelerate,
                begin: 0,
                end: 0.25,
                alignment: Alignment.center,
              ),
            if (state == VictoryState.horizontalTop)
              RotateEffect(
                duration: 400.ms,
                curve: Curves.decelerate,
                begin: 0,
                end: 0.25,
                alignment: Alignment.center,
              ),
            if (state == VictoryState.horizontalTop)
              MoveEffect(
                duration: 400.ms,
                curve: Curves.decelerate,
                begin: Offset.zero,
                end: Offset(0, -(MediaQuery.of(context).size.width * 0.3128)),
              ),
            if (state == VictoryState.horizontalBottom)
              RotateEffect(
                duration: 400.ms,
                curve: Curves.decelerate,
                begin: 0,
                end: 0.25,
                alignment: Alignment.center,
              ),
            if (state == VictoryState.horizontalBottom)
              MoveEffect(
                duration: 400.ms,
                curve: Curves.decelerate,
                begin: Offset.zero,
                end: Offset(0, MediaQuery.of(context).size.width * 0.3128),
              ),
            if (state == VictoryState.verticalRight)
              MoveEffect(
                duration: 400.ms,
                curve: Curves.decelerate,
                begin: Offset.zero,
                end: Offset(
                  MediaQuery.of(context).size.width * 0.3128,
                  0,
                ),
              ),
            if (state == VictoryState.verticalLeft)
              MoveEffect(
                duration: 400.ms,
                curve: Curves.decelerate,
                begin: Offset.zero,
                end: Offset(
                  -1 * (MediaQuery.of(context).size.width * 0.3128),
                  0,
                ),
              ),
          ],
          child: Container(
            width: 3.8,
            height: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: ColorConstants.gameWinColor,
              boxShadow: const <BoxShadow>[
                BoxShadow(
                  spreadRadius: 0,
                  blurRadius: 3,
                  blurStyle: BlurStyle.outer,
                  color: ColorConstants.gameWinColorShadow,
                ),
              ],
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      ),
    );
  }
}
