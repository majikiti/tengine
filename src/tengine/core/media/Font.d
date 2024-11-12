module tengine.core.media.Font;

import std;
import sdl;
import sdl_ttf;
import tengine.Config;
import tengine.libs;

shared static this() {
  TTF_Init;
}

shared static ~this() {
  TTF_Quit;
}

shared FontData[int][string] fonts;

class Font {
  private FontData font;

  this(int pt = cf.defaultFontSize, string path = cf.defaultFontPath) {
    auto cache = fonts.at[path][pt];
    if(cache) {
      font = cast(FontData)cache;
      return;
    }
    font = new FontData(path, pt);
    fonts[path][pt] = cast(shared FontData)font;
  }

  auto data() => font.data;
}

class FontData {
  private TTF_Font* data;

  this(string path, int pt) {
    data = TTF_OpenFont(path.toStringz, pt);
  }

  ~this() {
    TTF_CloseFont(data);
  }
}
