import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:tic_tac_toe/core/styles/color_constants.dart';

class X extends StatelessWidget {
  const X({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Animate(
        child: Stack(
          children: [
            Animate(
              effects: [
                RotateEffect(
                    duration: 400.ms,
                    curve: Curves.decelerate,
                    begin: 0,
                    end: -0.125,
                    alignment: Alignment.center)
              ],
              child: Align(
                alignment: Alignment.center,
                child: Container(
                  width: 3,
                  decoration: const BoxDecoration(
                    shape: BoxShape.rectangle,
                    color: ColorConstants.xColorGame,
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                        color: ColorConstants.oColorGame,
                        spreadRadius: 0,
                        blurRadius: 2,
                        blurStyle: BlurStyle.outer,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Animate(
              effects: [
                RotateEffect(
                    duration: 400.ms,
                    curve: Curves.decelerate,
                    begin: 0,
                    end: 0.125,
                    alignment: Alignment.center)
              ],
              child: Align(
                alignment: Alignment.center,
                child: Container(
                  width: 3,
                  decoration: const BoxDecoration(
                    shape: BoxShape.rectangle,
                    color: ColorConstants.xColorGame,
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                        color: ColorConstants.oColorGame,
                        spreadRadius: 0,
                        blurRadius: 2,
                        blurStyle: BlurStyle.outer,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      )
          .rotate(duration: 400.ms, curve: Curves.decelerate)
          .slide(duration: 400.ms, curve: Curves.decelerate)
          .scaleXY(duration: 400.ms, curve: Curves.decelerate),
    );
  }
}
