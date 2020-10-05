Map map;
Player player;
boolean[] keys;
int scl = 80;

void setup() {
  frameRate(60);
  size(800, 600);
  map = new Map(7, 10, scl);
  player = new Player(3.5, 3.5, 1000, scl);
  
  keys=new boolean[4];
  keys[0]=false;
  keys[1]=false;
  keys[2]=false;
  keys[3]=false;
}

void draw() {
  background(20); 
  if (keys[0] && !keys[1] && !keys[2] && !keys[3]) player.update(0, -0.05);
  if (keys[1] && !keys[0] && !keys[2] && !keys[3]) player.update(0, 0.05);
  if (keys[2] && !keys[1] && !keys[0] && !keys[3]) player.update(-0.05, 0);
  if (keys[3]  && !keys[1] && !keys[2] && !keys[0]) player.update(0.05, 0);  
  
  if (keys[0] && keys[3]) player.update(0.035, -0.035);
  if (keys[1] && keys[3]) player.update(0.035, 0.035);
  if (keys[1] && keys[2]) player.update(-0.035, 0.035);
  if (keys[2] && keys[0]) player.update(-0.035, -0.035);
  
  map.show();
  player.show(scl);
  player.lights(player, map);
}

void keyPressed() {
   if (key == CODED) {
    if (keyCode == UP)  keys[0] = true;
    if (keyCode == DOWN) keys[1] = true;
    if (keyCode == LEFT) keys[2] = true;
    if (keyCode == RIGHT) keys[3] = true;
  }
}

void keyReleased()
{
   if (key == CODED) {
    if (keyCode == UP)  keys[0] = false;
    if (keyCode == DOWN) keys[1] = false;
    if (keyCode == LEFT) keys[2] = false;
    if (keyCode == RIGHT) keys[3] = false;
  }
} 
