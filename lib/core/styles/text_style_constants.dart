import 'package:flutter/cupertino.dart';
import 'package:tic_tac_toe/core/styles/color_constants.dart';

class TextStyleConstants {
  static const titleText = TextStyle(
    color: ColorConstants.titleText,
    fontWeight: FontWeight.bold,
    fontSize: 45,
    shadows: <Shadow>[
      Shadow(
        color: ColorConstants.titleTextShadow,
        blurRadius: 30,
      )
    ],
  );

  static const lineText = TextStyle(
    color: ColorConstants.gameLines,
    fontWeight: FontWeight.bold,
    fontSize: 50,
    shadows: <Shadow>[
      Shadow(
        color: ColorConstants.titleTextShadow,
        blurRadius: 18,
      )
    ],
  );

  static const playText = TextStyle(
    color: ColorConstants.greyText,
    fontWeight: FontWeight.w700,
    fontSize: 25,
    shadows: <Shadow>[
      Shadow(
        color: ColorConstants.titleTextShadow,
        blurRadius: 18,
      )
    ],
  );

  static const buttonText = TextStyle(
    color: ColorConstants.titleText,
    fontWeight: FontWeight.w700,
    fontSize: 30,
  );
}
