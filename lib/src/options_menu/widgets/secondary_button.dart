import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:tic_tac_toe/core/styles/color_constants.dart';
import 'package:tic_tac_toe/core/styles/text_style_constants.dart';

class SecondaryButton extends StatefulWidget {
  const SecondaryButton({
    Key? key,
    required this.title,
    required this.onTap,
  }) : super(key: key);

  final String title;
  final Function onTap;

  @override
  State<SecondaryButton> createState() => _SecondaryButtonState();
}

class _SecondaryButtonState extends State<SecondaryButton> with TickerProviderStateMixin {
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
    return Animate(
      controller: _animationController,
      effects: [
        ShakeEffect(duration: 250.ms),
      ],
      child: GestureDetector(
        onTap: () {
          if (!_animationController.isAnimating) {
            _animationController.loop(count: 1);
            Future.delayed(250.ms).whenComplete(() {
              widget.onTap();
            });
          }
        },
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Animate(
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.2,
              decoration: BoxDecoration(
                border: Border.all(
                  color: ColorConstants.secondaryButtonBorder,
                ),
                borderRadius: BorderRadius.circular(10),
                boxShadow: <BoxShadow>[
                  const BoxShadow(
                    color: ColorConstants.secondaryButtonShadow,
                    spreadRadius: 0,
                    blurRadius: 10,
                    blurStyle: BlurStyle.outer,
                  ),
                  BoxShadow(
                    color: ColorConstants.secondaryButtonInsetShadow,
                    spreadRadius: 0,
                    blurRadius: MediaQuery.of(context).size.width,
                    blurStyle: BlurStyle.inner,
                  ),
                ],
              ),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Icon(
                      Icons.people_alt_outlined,
                      color: ColorConstants.titleText,
                      size: 30,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      widget.title,
                      style: TextStyleConstants.buttonText,
                    ),
                  ],
                ),
              ),
            ),
          ).show(duration: 250.ms).then().scaleXY(duration: 250.ms),
        ),
      ),
    );
  }
}
