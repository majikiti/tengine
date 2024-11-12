module game.Game;

import tengine;
import game;

alias Router = _Router!int;
alias RouteObject = _RouteObject!int;

enum Routes {
  Game, 
}

class Game: GameObject {
  Router router;

  this() {
  }

  override void setup() {
    router = register(new Router(Routes.Game, [
      Routes.Game: new GameScene(),
    ]));
  }

  override void loop() {
    if(im.keyOnce(27)) nuke;
  }
}
