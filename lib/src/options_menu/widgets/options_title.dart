import 'package:flutter/material.dart';
import 'package:tic_tac_toe/core/styles/text_style_constants.dart';

class OptionsTitle extends StatelessWidget {
  const OptionsTitle({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          'Welcome,',
          style: TextStyleConstants.titleText,
          textAlign: TextAlign.center,
        ),
        Text(
          title,
          style: TextStyleConstants.titleText.copyWith(
            fontSize: 35,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
