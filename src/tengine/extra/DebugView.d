module tengine.extra.DebugView;

import std;
import sdl_mixer;
import tengine;

class DebugView: GameObject {
  Text lt;

  this() {
    layer = 254;
  }

  override void setup() {
    auto tform = register(new Transform(Transform.Org.Real));
    tform.pos = Vec2(8, 8);

    auto font = new TextAsset;
    lt = register(new Text(font));
  }

  override void loop() {
    if(ctx.fps < 30) lt.setColor(255, 64, 64);
    else             lt.setColor(64, 64, 255);

    string lstr;
    lstr ~= [
      "DEBUG MODE\n",
      ctx.fps.to!string ~ " fps",
      everyone.length.to!string ~ " objects",
      "Camera " ~ (ctx.camera.pos + ctx.camera.center).toString,
      "Audio " ~ iota(Mix_AllocateChannels(-1)).map!Mix_Playing.to!string,
      "\n",
    ].join('\n');
    foreach(i, ly; ctx.layers){
      lstr ~= "Layer" ~ i.to!string ~ ": " ~ ly.length.to!string ~ " drawing\n";
    }
    lt.text = lstr;
  }
}
