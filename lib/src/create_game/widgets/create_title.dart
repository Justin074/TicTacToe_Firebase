import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:tic_tac_toe/core/styles/color_constants.dart';
import 'package:tic_tac_toe/core/styles/text_style_constants.dart';

class CreateTitle extends StatelessWidget {
  const CreateTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Animate(
      child: const Text(
        'CREATE GAME',
        style: TextStyleConstants.titleText,
        textAlign: TextAlign.center,
      ),
    ).shimmer(duration: 400.ms, color: ColorConstants.background);
  }
}
