module tengine.extra.WindowParam;

import std;
import tengine;

class WindowParam: GameObject {
  Vec2 size() => ctx.windowSize;
}