import 'package:flutter/material.dart';
import 'package:tic_tac_toe/core/styles/color_constants.dart';

class PageLoader extends StatelessWidget {
  const PageLoader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      color: ColorConstants.backgroundTransparent,
      child: const Center(
        child: CircularProgressIndicator(
          color: ColorConstants.gameLines,
        ),
      ),
    );
  }
}
