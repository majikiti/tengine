module game.objects.SpriteBox;

import tengine;
import game;

class SpriteBox : GameObject{
  SpriteRenderer rend;
  Transform tform;
  ImageAsset ima;
  string path;
  this(string _path){
    path = _path;
  }

  override void setup(){
    tform = register(new Transform);
    ima = new ImageAsset(path);
    rend = register(new SpriteRenderer(ima));
  }


}
