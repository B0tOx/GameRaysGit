class Player {
  PVector pos;
  float rayNumber;
  Ray[] rays;
  int scl;
  float rayAngle;

  Player(float x, float y, float rayNumber, int scl) {
    this.pos = new PVector(x, y);
    this.rayNumber = rayNumber;
    this.rays = new Ray[int(this.rayNumber)];
    this.scl = scl;
    this.rayAngle = 360/this.rayNumber;

    for (int i = 0; i < rayNumber; i++) {
      this.rays[i] = new Ray(this.pos, rayAngle * i, scl);
    }
  }

  void show(int scl) {
    //for (int i = 0; i < this.rays.length; i++) { 
    //  Ray ray1 = rays[i];
    //  ray1.show(scl);
    //}
    noStroke();
    fill(255, 0, 0);
    circle(this.pos.x * scl, this.pos.y * scl, 10);
  }

  void update(float x, float y) {
    this.pos.x = this.pos.x + x;
    this.pos.y = this.pos.y + y;
  }

  void lights(Player player, Map map) {
    fill(255, 100);
    beginShape();
    for (int i = 0; i < rays.length; i++) {
      Ray ray1 = rays[i];
      PVector pt = ray1.cast(player.tilePos(), player.pos, map); 
      vertex(pt.x * this.scl, pt.y * this.scl);
      //stroke(255, 100);
      //line(this.pos.x * scl, this.pos.y * scl, pt.x * scl, pt.y * scl);
    }
    endShape(CLOSE);
  }


  PVector tilePos() {
    PVector tilePos = new PVector((pos.x - int(pos.x)), (pos.y - int(pos.y)));
    return tilePos;
  }
}
