module game.objects.TextBox;

import engine;
import game;

class TextBox : GameObject{
  Text text;
  Transform tform;
  TextAsset txa;
  string str, path;
  int pt;
  this(string _str, int _pt = opts.defaultFontSize, string _path = opts.defaultFontPath){
    str = _str;
    pt = _pt;
    path = _path;
  }

  override void setup(){
    tform = register(new Transform);
    txa = new TextAsset(pt, path);
    text = register(new Text(txa));
    text.text = str;
    text.setColor(255,255,255);
  }


}
