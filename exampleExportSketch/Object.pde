class Object{

  PVector pos;
  color cl;
  int sW;
  int sH;
  
Object(color _cl){

pos = new PVector(0,0);
cl= _cl;


}

void update(int _x, int _y, int _sW, int _sH){
pos.x=_x;
pos.y=_y;
sW=_sW;
sH=_sH;

}

void display(){
  
  noStroke();
  fill(cl);
  ellipse(pos.x,pos.y,sW,sH);

}


}
