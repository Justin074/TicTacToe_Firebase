import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:tic_tac_toe/core/models/lobby.dart';
import 'package:tic_tac_toe/core/styles/color_constants.dart';
import 'package:tic_tac_toe/core/styles/text_style_constants.dart';
import 'package:tic_tac_toe/src/game_board/view_logic/ready_button_logic.dart';

class ReadyButton extends StatefulWidget {
  const ReadyButton({
    Key? key,
    required this.lobby,
  }) : super(key: key);
  final Lobby lobby;

  @override
  State<ReadyButton> createState() => _ReadyButtonState();
}

class _ReadyButtonState extends State<ReadyButton>
    with TickerProviderStateMixin {
  late AnimationController _scoreController;
  late ReadyButtonLogic logic;

  @override
  void initState() {
    _scoreController = AnimationController(vsync: this);
    logic = ReadyButtonLogic();
    super.initState();
  }

  @override
  void dispose() {
    _scoreController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Animate(
      controller: _scoreController,
      effects: [
        ShimmerEffect(
          duration: 400.ms,
          curve: Curves.decelerate,
        ),
      ],
      child: GestureDetector(
        onTap: () {
          if (!_scoreController.isAnimating) {
            _scoreController.loop(count: 1);
            Future.delayed(250.ms).whenComplete(() async {
              await logic.setUserReady(widget.lobby);
            });
          }
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 10,
          ),
          child: Animate(
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.1,
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
                child: Text(
                  logic.buttonState(widget.lobby),
                  style: TextStyleConstants.buttonText,
                ),
              ),
            ),
          ).show(duration: 500.ms).then().scaleXY(duration: 250.ms),
        ),
      ),
    );
  }
}
