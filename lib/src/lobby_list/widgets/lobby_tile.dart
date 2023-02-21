import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';
import 'package:tic_tac_toe/core/extensions/string_extensions.dart';
import 'package:tic_tac_toe/core/models/lobby.dart';
import 'package:tic_tac_toe/core/repository/lobby_repository.dart';
import 'package:tic_tac_toe/core/router/routes_enum.dart';
import 'package:tic_tac_toe/core/styles/color_constants.dart';
import 'package:tic_tac_toe/core/styles/text_style_constants.dart';
import 'package:tic_tac_toe/src/lobby_list/view_logic/lobby_tile_logic.dart';

class LobbyTile extends StatefulWidget {
  const LobbyTile({Key? key, required this.lobby}) : super(key: key);

  final Lobby lobby;

  @override
  State<LobbyTile> createState() => _LobbyTileState();
}

class _LobbyTileState extends State<LobbyTile> with TickerProviderStateMixin {
  late AnimationController _animationController;
  late LobbyTileLogic logic;

  @override
  void initState() {
    _animationController = AnimationController(vsync: this);
    logic = LobbyTileLogic();
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
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: 100,
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
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '${widget.lobby.host.playerName}:',
                      style: TextStyleConstants.titleText.copyWith(
                          fontSize: 18, fontWeight: FontWeight.normal),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      widget.lobby.lobbyName,
                      style: TextStyleConstants.titleText.copyWith(
                          fontSize: 18, fontWeight: FontWeight.normal),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
                Animate(
                  controller: _animationController,
                  effects: [
                    ShakeEffect(duration: 250.ms),
                  ],
                  child: GestureDetector(
                    onTap: () {
                      if (!_animationController.isAnimating) {
                        _animationController.loop(count: 1);
                        Future.delayed(250.ms).whenComplete(() {
                          LobbyRepository.joinLobby(
                            widget.lobby,
                          );
                          GoRouter.of(context).pushNamed(
                            Routes.gameBoard.routeName,
                            extra: widget.lobby.id,
                          );
                        });
                      }
                    },
                    child: Container(
                      width: 120,
                      height: 50,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: widget.lobby.host.selection.isO ||
                                  logic.isHost(widget.lobby)
                              ? ColorConstants.logoutBorder
                              : ColorConstants.oColor,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(5),
                        boxShadow: <BoxShadow>[
                          BoxShadow(
                            color: widget.lobby.host.selection.isO ||
                                    logic.isHost(widget.lobby)
                                ? ColorConstants.logoutShadow
                                : ColorConstants.oColorShadow,
                            spreadRadius: 0,
                            blurRadius: 6,
                            blurStyle: BlurStyle.outer,
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          if (widget.lobby.host.selection.isO ||
                              logic.isHost(widget.lobby))
                            Text(
                              'JOIN AS - ',
                              style: TextStyleConstants.titleText.copyWith(
                                fontSize: 18,
                                fontWeight: FontWeight.normal,
                                color: ColorConstants.xColor,
                              ),
                            ),
                          if (widget.lobby.host.selection.isO ||
                              logic.isHost(widget.lobby))
                            Text(
                              'X',
                              style: TextStyleConstants.titleText.copyWith(
                                fontSize: 18,
                                fontWeight: FontWeight.normal,
                                color: ColorConstants.xColor,
                              ),
                            ),
                          if (widget.lobby.host.selection.isX &&
                              !logic.isHost(widget.lobby))
                            Text(
                              'JOIN AS - ',
                              style: TextStyleConstants.titleText.copyWith(
                                fontSize: 18,
                                fontWeight: FontWeight.normal,
                                color: ColorConstants.oColor,
                              ),
                            ),
                          if (widget.lobby.host.selection.isX &&
                              !logic.isHost(widget.lobby))
                            Text(
                              'O',
                              style: TextStyleConstants.titleText.copyWith(
                                fontSize: 18,
                                fontWeight: FontWeight.normal,
                                color: ColorConstants.oColor,
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    )
        .slideX(duration: 250.ms)
        .scaleX(duration: 250.ms)
        .fadeIn(duration: 250.ms);
  }
}
