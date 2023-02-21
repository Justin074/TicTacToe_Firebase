import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:tic_tac_toe/core/models/lobby.dart';
import 'package:tic_tac_toe/core/styles/color_constants.dart';
import 'package:tic_tac_toe/core/styles/text_style_constants.dart';
import 'package:tic_tac_toe/src/game_board/view_logic/versus_card_logic.dart';

class VersusCard extends StatefulWidget {
  const VersusCard({
    Key? key,
    required this.lobby,
  }) : super(key: key);

  final Lobby lobby;

  @override
  State<VersusCard> createState() => _VersusCardState();
}

class _VersusCardState extends State<VersusCard> {
  late VersusCardLogic logic;

  @override
  void initState() {
    logic = VersusCardLogic();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Animate(
      child: Card(
        color: ColorConstants.formFieldBorderShadow,
        shadowColor: ColorConstants.background,
        elevation: 6,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Text(
                    widget.lobby.host.playerName,
                    style: TextStyleConstants.titleText.copyWith(
                      fontSize: 18,
                      fontWeight: FontWeight.normal,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    logic.getPlayerState(
                      widget.lobby,
                      widget.lobby.host,
                    ),
                    style: TextStyleConstants.titleText.copyWith(
                      fontSize: 18,
                      fontWeight: FontWeight.normal,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              Text(
                'VS',
                style: TextStyleConstants.titleText
                    .copyWith(fontSize: 18, fontWeight: FontWeight.normal),
                textAlign: TextAlign.center,
              ),
              Column(
                children: [
                  Text(
                    widget.lobby.challenger?.playerName ?? '(Waiting)',
                    style: TextStyleConstants.titleText
                        .copyWith(fontSize: 18, fontWeight: FontWeight.normal),
                    textAlign: TextAlign.center,
                  ),
                  if (widget.lobby.challenger != null)
                    Text(
                      logic.getPlayerState(
                        widget.lobby,
                        widget.lobby.challenger!,
                      ),
                      style: TextStyleConstants.titleText.copyWith(
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                      ),
                      textAlign: TextAlign.center,
                    ),
                ],
              ),
            ],
          ),
        ),
      ),
    ).shimmer(
      duration: 400.ms,
      curve: Curves.decelerate,
      color: ColorConstants.titleText,
    );
  }
}
