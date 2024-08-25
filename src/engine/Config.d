module engine.Config;

import engine.core.Vec2;

package Config cf;

struct Color{
  ubyte r, g, b, a;
  
  this(ubyte _r, ubyte _g, ubyte _b, ubyte _a = 255){
    r = _r;
    g = _g;
    b = _b;
    a = _a;
  }
}


// Engine Settings
struct Config {

  Vec2 defaultWindowSize = Vec2(1280, 640);

  // Change in line 10 of Context.d
  // real initFps = 60.;

  Color bgColor = Color(0, 0, 0, 255);

  string defaultFontPath = "font/SawarabiGothic-Regular.ttf";
  int defaultFontSize = 16;

  char wakeupDebugKey = '\\';

}
