import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:tic_tac_toe/core/styles/color_constants.dart';
import 'package:tic_tac_toe/core/styles/text_style_constants.dart';

class LobbyTitle extends StatelessWidget {
  const LobbyTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Animate(
      child: Text(
        'SELECT A LOBBY',
        style: TextStyleConstants.titleText.copyWith(
          fontSize: 38,
        ),
        textAlign: TextAlign.center,
      ),
    ).shimmer(duration: 400.ms, color: ColorConstants.background);
  }
}
