module game.scenes.GameScene;

import tengine;
import game;

class GameScene: RouteObject {
  
  Transform tform;
  TextBox textBox;
  override void setup() {
    tform = register(new Transform);
    textBox = register(new TextBox("Hello World"));
  }

  override void loop(){

  }

  mixin(enableReincarnate);
}
