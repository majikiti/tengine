module tengine.assets.TextAsset;

import std;
import sdl;
import sdl_ttf;
import tengine;

class TextAsset: Asset {
  package Font font;
  int pt;

  this(int pt = cf.defaultFontSize, string path = cf.defaultFontPath) {
    this.font = new Font(pt, locateAsset(path));
    this.pt = pt;
  }

  Surface render(string text, SDL_Color c) {
    auto surface = TTF_RenderUTF8_Blended(font.data, text.toStringz, c);
    return new Surface(surface);
  }
}
