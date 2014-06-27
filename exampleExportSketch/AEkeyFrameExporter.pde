
class AEkeyFrameExporter {

  XML xml;
  XML objs;
  XML scn;
  XML kf;
  long initialFrame;
  int originalWidth;
  int originalHeight;

  //INITIALIZE CLASS, SET YHE SCENE SETTINGS - FRAMERATE, CANVAS_WIDTH, CANVAS_HEIGHT
  AEkeyFrameExporter(int _fRate, int _sceneWidth, int _sceneHeight) {

    initialFrame=frameCount;

    xml = new XML("xml");

    XML gnrl = xml.addChild("general");
    scn = gnrl.addChild("scene");
    scn.setInt("width", _sceneWidth);
    scn.setInt("height", _sceneHeight);
    scn.setFloat("framerate", _fRate);

    objs = xml.addChild("objects");
  }

  //ADD AN OBJECT AND SET IT'S INITIAL INFORMATION - LIKE COLOR AND INITIAL SIZE
  void addObject(int _id, color _color, int _sW, int _sH) {

    XML obj = objs.addChild("object");
    obj.setInt("id", _id);

    //GET COLORS IN  RGB
    int red   = (_color >> 16) & 0xFF;
    int green = (_color >> 8)  & 0xFF;
    int blue  =  _color        & 0xFF;

    //SAVE OBJECT COLOR
    obj.setInt("color_R", red);
    obj.setInt("color_G", green);
    obj.setInt("color_B", blue);

    //SAVE OBJECT INITIAL WIDTH AND HEIGHT  
    obj.setInt("width", _sW);
    obj.setInt("height", _sH);

    kf = obj.addChild("keyframes");

    originalWidth = _sW;
    originalHeight = _sH;
  }

  //UPDATE KEYFRAMES
  void writeObjectFrames(int _id, PVector _pos, int _sW, int _sH, float _angle) {

    XML[] children = objs.getChildren("object");

    //LOOP FOR ALL THE OBJECTS AND CHECK FOR THE RIGHT ID TO STORE THE UPDATED SETTINGS
    for (int i = 0; i < children.length; i++) {
      String id = children[i].getString("id");

      if (int(id)==int(_id)) {

        //WRITE FRAME NUMBER
        XML frame = children[i].getChildren("keyframes")[0].addChild("frame");
        frame.setInt("number", frameCount);
        XML anchorP = frame.addChild("anchor_point");
        anchorP.setInt("x", 0);
        anchorP.setInt("y", 0);

        //WRITE UPDATED POSITION
        XML position = frame.addChild("position");
        position.setInt("x", int(_pos.x));
        position.setInt("y", int(_pos.y));

        //WRITE UPDATED SIZE
        //THE SCALE OF THE OBJECT SHOULD BE STORED AS PERCENTAGE OF THE ORIGINAL SIZE
        XML scale = frame.addChild("scale");
        scale.setInt("x_perc", (_sW*100)/originalWidth);
        scale.setInt("y_perc", (_sH*100)/originalHeight);
        
        //WRITE UPDATED ROTATION ANGLE
        XML rot = frame.addChild("rotation");
        rot.setFloat("theta", degrees(_angle));
      }
    }
  }


  //EXPORT XML FILE
  void saveOutput() {

    //TOTAL NUMBER OF FRAMES
    scn.setInt("frame_duration", int(frameCount-initialFrame));
    //SAVE FILE
    saveXML(xml, "data/AEkeyFrameExporter.xml");

    println("successfully exported "+int(frameCount-initialFrame)+" frames");
  }
}

