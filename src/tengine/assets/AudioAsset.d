module tengine.assets.AudioAsset;

import tengine;

class AudioAsset: Asset {
  Sound sound;
  Player player;

  this(string path) {
    sound = new Sound(locateAsset(path));
  }
}
