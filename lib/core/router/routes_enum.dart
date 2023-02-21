enum Routes {
  initial('initial'),
  home('home'),
  optionsMenu('optionsMenu'),
  createGame('createGame'),
  lobbyList('lobbyList'),
  gameBoard('gameBoard');

  const Routes(this.routeName);

  final String routeName;
  String get path => '/$routeName';
}
