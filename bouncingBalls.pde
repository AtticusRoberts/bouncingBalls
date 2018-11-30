Bounce[] ballArr;
int ballcount = 50;
int distance = 1000;
void setup() {
  //background(255);
  size(1000,1000,P3D);
  ballArr=new Bounce[ballcount];
  for (int i=0;i<ballcount;i++) {
    ballArr[i]=new Bounce();
  }
  noStroke();
}
void draw() {
  background(255);
  camera(((distance*cos(frameCount/80.0)+width/2)),height/2,((distance*sin(frameCount/80.0))+200)
        ,width/2,height/2,200
        ,0,-1,0);
  for (Bounce ball : ballArr) {
    ball.bounce();
    }
}
class Bounce {
  float xMove;
  float yMove;
  float zMove;
  float x;
  float y;
  float z;
  int r;
  int g;
  int b;
  Bounce () {
    yMove=random(1,5);
    xMove=random(1,5);
    zMove=random(1,5);
    x=random(1,800);
    y=random(1,800);
    z=random(1,250);
    r= 255;//int(random(0,255));
    g = 0;//int(random(0,192));
    b = 0;//int(random(190,255));
  }
  void bounce() {          
    if (x>=800 || x<=0) {
      xMove=-xMove;
      b++;
    }
    if (y>=800 || y<=0) {
      yMove=-yMove;
      r++;
    }
    if (z>250 || z<0) {
      zMove=-zMove;
      g++;
    }
    fill(r,g,b);
    lights();
    pushMatrix();
    translate(x,y,z);
    sphere(33);
    popMatrix();
    x=x+xMove;
    y=y+yMove;
    z=z+zMove;
  } 
}
