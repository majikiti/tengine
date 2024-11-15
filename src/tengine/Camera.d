module tengine.Camera;

import std;
import tengine;

// HikakinTVでカメラとか扱ったことあんまないけど
class Camera: Loggable {
  Vec2 pos; // カメラ絶対位置
  Vec2 size;
  Vec2 center; // 画面サイズ分のバイアス
  GameObject fgo; // FocusGameObject
  bool follow = false;

  struct Limit {
    Vec2 max;
    Vec2 min;
  }
  Limit lim;

  // この汚さどうにかしてくださいおねがいしますなんでもしますから
  this(Vec2 center = Vec2(0, 0),
    Vec2 limax = Vec2(real.infinity, real.infinity),
    Vec2 limin = Vec2(-real.infinity, -real.infinity),
  ) {
    this.center = center;
    lim.max = limax;
    lim.min = limin;
  }

  void focus(GameObject fgo, bool follow) {
    if(!fgo.has!Transform){
      warn("Camera: It has no-one of Transform", fgo);
      return;
    }
    this.fgo = fgo;
    this.follow = follow;
    return;
  }

  void loop() {
    // focus
    auto gos = ctx.root.everyone.filter!(e => e.has!Focus).array;
    ushort prio = ushort.max;
    GameObject gobj = null;
    bool follow = false;
    foreach(i, f; gos){
      if(f.component!Focus.priority == prio) warn("Duplicate Focus priority: ", gobj, ", ", f);
      if(f.component!Focus.priority < prio && f.component!Focus.enable){
        gobj = f;
        prio = f.component!Focus.priority;
        follow = f.component!Focus.follow;
      }
    }
    if(gobj !is null) focus(gobj, follow);

    // window size
    size = ctx.windowSize;
    center = ctx.windowSize / 2;
    if(fgo !is null) {
      if(this.follow){
        auto dif = fgo.component!Transform.pos - center - pos;
        // dif.sizeの係数 : 追尾速度
        auto d = min(0.5, max(0.01, 0.0003*dif.size));
        pos += dif * d;
      } else pos = fgo.component!Transform.pos - center;
    }

    // 範囲外 カメラ もうやめて
    pos.x = max(min(pos.x, lim.max.x), lim.min.x);
    pos.y = max(min(pos.y, lim.max.y), lim.min.y);
  }
}
