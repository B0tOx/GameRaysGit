class Ray {
  PVector pos, dir;
  float angle;
  int scl;

  Ray(PVector pos1, float angle, int scl) {
    this.pos = pos1;
    this.angle = angle;
    this.dir = new PVector(1, 0);
    this.dir.rotate(radians(-angle));
    this.dir.normalize();
    this.scl = scl;
  }

  PVector cast(PVector tpos, PVector ppos, Map map) {
    if (angle >= 0 && angle < 90 || angle == 360) {
      float angle1 = angle;
      if (angle == 360) angle1 = 0;
      float dy = tpos.y;
      float tanDy = dy / tan(radians(angle1));
      PVector intersectY1 = new PVector(ppos.x + tanDy, ppos.y - dy);
      float deltaY = 1/tan(radians(angle1));

      float dx = 1 - tpos.x;
      float tanDx = -dx * tan(radians(angle1));
      PVector intersectX1 = new PVector(ppos.x + dx, ppos.y + tanDx);
      float deltaX = -tan(radians(angle1)); 

      for (;; ) {
        while (intersectY1.x <= intersectX1.x || intersectY1.y >= intersectX1.y) {           
          Square square1 = map.squares[int(intersectY1.x)][int(intersectY1.y - 0.1)];
          if (square1.type != 0) {
            PVector pt = new PVector(intersectY1.x, intersectY1.y);
            return pt;
          }
          intersectY1.y -= 1;
          intersectY1.x += deltaY;
        }
        while (intersectX1.x <= intersectY1.x || intersectX1.y >= intersectY1.y ) {
          Square square1 = map.squares[int(intersectX1.x + 0.1)][int(intersectX1.y)];
          if (square1.type != 0) {
            PVector pt = new PVector(intersectX1.x, intersectX1.y);
            return pt;
          }
          intersectX1.x += 1;
          intersectX1.y += deltaX;
        }
      }
    } else if (angle >= 90 && angle <= 180) {
      float angle1 = abs(180 - angle);
      float dy = tpos.y;
      float tanDy = -dy / tan(radians(angle1));
      PVector intersectY1 = new PVector(ppos.x + tanDy, ppos.y - dy);
      float deltaY = -1/tan(radians(angle1));

      float dx = tpos.x;
      float tanDx = -dx * tan(radians(angle1));
      PVector intersectX1 = new PVector(ppos.x - dx, ppos.y + tanDx);
      float deltaX = -tan(radians(angle1));

      for (;; ) {
        while (intersectY1.x >= intersectX1.x || intersectY1.y >= intersectX1.y) {           
          Square square1 = map.squares[int(intersectY1.x)][int(intersectY1.y - 0.1)];
          if (square1.type != 0) {
            PVector pt = new PVector(intersectY1.x, intersectY1.y);
            return pt;
          }
          intersectY1.y -= 1;
          intersectY1.x += deltaY;
        }
        while (intersectX1.x >= intersectY1.x || intersectX1.y >= intersectY1.y ) {
          Square square1 = map.squares[int(intersectX1.x - 0.1)][int(intersectX1.y)];
          if (square1.type != 0) {
            PVector pt = new PVector(intersectX1.x, intersectX1.y);
            return pt;
          }
          intersectX1.x -= 1;
          intersectX1.y += deltaX;
        }
      }
    } else if (angle > 180 && angle < 270) {
      float angle1 = abs(270 - angle);
      float dy = 1 - tpos.y;
      float tanDy =  -dy * tan(radians(angle1));
      PVector intersectY1 = new PVector(ppos.x + tanDy, ppos.y + dy);
      float deltaY = -1 * tan(radians(angle1));

      float dx = tpos.x;
      float tanDx = dx / tan(radians(angle1));
      PVector intersectX1 = new PVector(ppos.x - dx, ppos.y + tanDx);
      float deltaX = 1 / tan(radians(angle1));

      for (;; ) {
        while (intersectY1.x >= intersectX1.x || intersectY1.y <= intersectX1.y) {           
          Square square1 = map.squares[int(intersectY1.x)][int(intersectY1.y + 0.1)];
          if (square1.type != 0) {
            PVector pt = new PVector(intersectY1.x, intersectY1.y);
            return pt;
          }
          intersectY1.y += 1;
          intersectY1.x += deltaY;
        }
        while (intersectX1.x >= intersectY1.x || intersectX1.y <= intersectY1.y ) {
          Square square1 = map.squares[int(intersectX1.x - 0.1)][int(intersectX1.y)];
          if (square1.type != 0) {
            PVector pt = new PVector(intersectX1.x, intersectX1.y);
            return pt;
          }
          intersectX1.x -= 1;
          intersectX1.y += deltaX;
        }
      }
    } else if (angle >= 270 && angle < 360) {
      float angle1 = abs(360 - angle);
      float dy = 1 - tpos.y;
      float tanDy = dy / tan(radians(angle1));
      PVector intersectY1 = new PVector(ppos.x + tanDy, ppos.y + dy);
      float deltaY = 1/tan(radians(angle1));

      float dx = 1 - tpos.x;
      float tanDx = dx * tan(radians(angle1));
      PVector intersectX1 = new PVector(ppos.x + dx, ppos.y + tanDx);
      float deltaX = tan(radians(angle1));

      for (;; ) {
        while (intersectY1.x <= intersectX1.x || intersectY1.y <= intersectX1.y) {           
          Square square1 = map.squares[int(intersectY1.x)][int(intersectY1.y + 0.1)];
          if (square1.type != 0) {
            PVector pt = new PVector(intersectY1.x, intersectY1.y);
            return pt;
          }
          intersectY1.y += 1;
          intersectY1.x += deltaY;
        }
        while (intersectX1.x <= intersectY1.x || intersectX1.y <= intersectY1.y ) {
          Square square1 = map.squares[int(intersectX1.x + 0.1)][int(intersectX1.y)];
          if (square1.type != 0) {
            PVector pt = new PVector(intersectX1.x, intersectX1.y);
            return pt;
          }
          intersectX1.x += 1;
          intersectX1.y += deltaX;
        }
      }
    }

    PVector pt = null;
    return pt;
  }

  void show(int scl) {
    stroke(255);
    line(pos.x * scl, pos.y * scl, pos.x * scl + this.dir.x * 800, pos.y * scl + this.dir.y * 800);
  }
}
