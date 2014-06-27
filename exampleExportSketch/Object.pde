class Object {

  PVector pos;
  color cl;
  int sW;
  int sH;
  float angle;

  Object(color _cl) {

    pos = new PVector(0, 0);
    cl= _cl;
    angle = 0;
  }

  void update(int _x, int _y, int _sW, int _sH, float _theta) {
    pos.x=_x;
    pos.y=_y;
    sW=_sW;
    sH=_sH;
    angle = _theta;
  }

  void display() {

    noStroke();
    fill(cl);
    pushMatrix();
    translate(pos.x,pos.y);
    rotate(angle);
    ellipse(0, 0, sW, sH);
    popMatrix();
  }
}

