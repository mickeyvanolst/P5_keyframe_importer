int fRate=30;

//DECLARE AEkeyFrameExporter
AEkeyFrameExporter AEexporter;

Object obj1;
Object obj2;

void setup() {
  size(800, 600);
  frameRate(fRate);
  smooth();

  //CREATE THE OBJECTS THAT WE ARE GOING TO EXPORT 
  color cl1=color(231, 81, 118);
  color cl2=color(108, 224, 202);
  obj1 = new Object(cl1);
  obj2 = new Object(cl2);

  //INITIALIZE THE AEkeyFrameExporter CLASS - FRAMERATE, CANVAS_WIDTH, CANVAS_HEIGHT
  AEexporter = new AEkeyFrameExporter(fRate, width, height);

  //EXPORT OBJECT INITIAL SETIINGS - ID, COLOR, SIZE_WIDTH, SIZE_HEIGHT
  AEexporter.addObject(0, obj1.cl, 20, 20);
  AEexporter.addObject(1, obj2.cl, 20, 20);
}

void draw() {
  background(244, 247, 217);

  if (mousePressed) {


    //UPDATE AND DISPLAY THE OBJECTS THAT WE ARE EXPORTING
    obj1.update(mouseX, mouseY, mouseX/5, mouseX/5);
    obj1.display();  

    obj2.update(width-mouseX, height-mouseY, mouseX/5, mouseY/2);
    obj2.display();
    ////

    //WRITE OBJECT DATA TO TO XML FILE - ID, OBJECT POSITION, OBJECT_WIDTH, OBJECT_HEIGHT
    AEexporter.writeObjectFrames(0, obj1.pos, obj1.sW, obj1.sH);
    AEexporter.writeObjectFrames(1, obj2.pos, obj2.sW, obj2.sH);


    fill(0);
    text("Release mouse button to Exit and export keyframes file", 5, 15);
    text("saving...", 5, 35);
  } else {
    fill(0);
    text("Press mouse button to save keyframes", 5, 15);
  }
}

void mouseReleased() {

  //SAVE XML FILE
  AEexporter.saveOutput();

  //QUIT APPLICATION
  exit();
}  

