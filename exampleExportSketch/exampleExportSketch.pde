AEkeyFrameExporter AEexporter;

int fRate=30;

color cl1=color(231, 81, 118);
color cl2=color(108, 224, 202);

Object obj1;
Object obj2;



void setup() {
  size(800, 600);
  smooth();
  frameRate(fRate);

  //CREATE THE OBJECTS TO EXPORT
  obj1 = new Object(cl1);
  obj2 = new Object(cl2);

  //INITIALIZE THE AEkeyFrameExporter class - framerate, canvasWidth, canvasHeight
  AEexporter = new AEkeyFrameExporter(fRate, width, height);

  //ID, COLOR, SIZE_WIDTH, SIZE_HEIGHT
  AEexporter.addObject(0, obj1.cl, 20, 20);
  AEexporter.addObject(1, obj2.cl, 20, 20);
}

void draw() {
  background(244, 247, 217);

  if (mousePressed) {

    obj1.update(mouseX, mouseY, mouseX/5, mouseX/5);
    obj1.display();  

    obj2.update(width-mouseX, height-mouseY, mouseX/5, mouseY/2);
    obj2.display();
    
    
    //
    AEexporter.writeObjectData(0, obj1.pos, obj1.sW, obj1.sH);
    AEexporter.writeObjectData(1, obj2.pos, obj2.sW, obj2.sH);


    fill(0);
    text("Release mouse button to Exit and export keyframes file", 5, 15);
    text("saving...", 5, 35);
    
  } else {
    fill(0);
    text("Press mouse button to save keyframes", 5, 15);
  }
}

void mouseReleased() {

  AEexporter.saveOutput();
  exit();
}  

