import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';
import 'package:tic_tac_toe/core/router/routes_enum.dart';
import 'package:tic_tac_toe/core/styles/color_constants.dart';
import 'package:tic_tac_toe/core/styles/text_style_constants.dart';

class CreateButton extends StatefulWidget {
  const CreateButton({Key? key}) : super(key: key);

  @override
  State<CreateButton> createState() => _CreateButtonState();
}

class _CreateButtonState extends State<CreateButton> with TickerProviderStateMixin {
  late AnimationController _createController;

  @override
  void initState() {
    _createController = AnimationController(vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _createController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Animate(
      controller: _createController,
      effects: [
        ShakeEffect(duration: 250.ms),
      ],
      child: GestureDetector(
        onTap: () {
          if (!_createController.isAnimating) {
            _createController.loop(count: 1);
            Future.delayed(250.ms).whenComplete(() {
              GoRouter.of(context).pushNamed(
                Routes.createGame.routeName,
              );
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
                  color: ColorConstants.mainButtonBorder,
                ),
                borderRadius: BorderRadius.circular(10),
                boxShadow: <BoxShadow>[
                  const BoxShadow(
                    color: ColorConstants.mainButtonShadow,
                    spreadRadius: 0,
                    blurRadius: 10,
                    blurStyle: BlurStyle.outer,
                  ),
                  BoxShadow(
                    color: ColorConstants.mainButtonInsetShadow,
                    spreadRadius: 0,
                    blurRadius: MediaQuery.of(context).size.width,
                    blurStyle: BlurStyle.inner,
                  ),
                ],
              ),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const <Widget>[
                    Icon(
                      Icons.create_outlined,
                      color: ColorConstants.titleText,
                      size: 30,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      'CREATE GAME',
                      style: TextStyleConstants.buttonText,
                    ),
                  ],
                ),
              ),
            ),
          ).scaleXY(duration: 250.ms),
        ),
      ),
    );
  }
}
