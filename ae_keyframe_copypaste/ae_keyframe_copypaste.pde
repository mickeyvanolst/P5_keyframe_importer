// Mick van Olst, POPSURE, 2014

PrintWriter output;
float fRate = 29.7;
ArrayList<Value> values;

/*
  Simple way of recording Processing objects to animation keyframes for After Effects.
  Just make your motion, save it, and place the contents of the keyframes.txt file into
  your clipboard. Then go to AE, select your layer, and paste the keyframes.
*/

void setup() {
  size(500, 500);
  frameRate(fRate);
  output = createWriter("keyframes.txt");

  output.println("Adobe After Effects 6.0 Keyframe Data\n");
  output.println("\tUnits Per Second\t" + fRate);
  output.println("\tSource Width\t" + width);
  output.println("\tSource Height\t" + height);
  output.println("\tSource Pixel Aspect Ratio\t1");
  output.println("\tComp Pixel Aspect Ratio\t1\n");

  //--------------
  values = new ArrayList<Value>();
  Value v1 = new Value("Anchor Point", "\tFrame\tX pixels\tY pixels\tZ pixels");
  values.add(v1);

  Value v2 = new Value("Position", "\tFrame\tX pixels\tY pixels\tZ pixels");
  values.add(v2);

  Value v3 = new Value("Scale", "\tFrame\tX percent\tY percent\tZ percent");
  values.add(v3);

  Value v4 = new Value("Rotation", "\tFrame\tDegrees");
  values.add(v4);
}

void draw() {
  background(0);
  fill(0, 0, 250);

  if (keyPressed && key == 'r') {
    fill(250, 0, 0);

    for (int i=0; i<values.size (); i++) {
      Value v = values.get(i);
      if (v.name == "Anchor Point") {
        v.addEntry("\t" + v.entries.size() + "\t" + 0 + "\t" + 0 + "\t0");
      } else if (v.name == "Position") {
        v.addEntry("\t" + v.entries.size() + "\t" + mouseX + "\t" + mouseY + "\t0");
      } else if (v.name == "Scale") {
        v.addEntry("\t" + v.entries.size() + "\t" + map(mouseX, 0,width,10,100) + "\t" + map(mouseY, 0,height,10,100) + "\t100");
      } else if (v.name == "Rotation") {
        v.addEntry("\t" + v.entries.size() + "\t" + 0);
      }
    }
  }

  ellipseMode(CENTER);
  ellipse(mouseX, mouseY, map(mouseX,0,width,10,100), map(mouseY,0,height,10,100));
  
  fill(255);
  text("Hold R to record, press S to save and close", 10,20);
}

void mouseReleased() {
}

void keyPressed() {
  if (key == 's') {
    for (int i=0; i<values.size (); i++) {
      Value v = values.get(i);
      if (v.name == "Anchor Point") {
        output.println(v.name);
        output.println(v.pars);
        for (int e = 0; e < v.entries.size (); e++) {
          output.println(v.entries.get(e));
        }
      }
    }
    output.print("\n");

    for (int i=0; i<values.size (); i++) {
      Value v = values.get(i);
      if (v.name == "Position") {
        output.println(v.name);
        output.println(v.pars);
        for (int e = 0; e < v.entries.size (); e++) {
          output.println(v.entries.get(e));
        }
      }
    } 
    output.print("\n");

    for (int i=0; i<values.size (); i++) {
      Value v = values.get(i);
      if (v.name == "Scale") {
        output.println(v.name);
        output.println(v.pars);
        for (int e = 0; e < v.entries.size (); e++) {
          output.println(v.entries.get(e));
        }
      }
    }
    output.print("\n");

    for (int i=0; i<values.size (); i++) {
      Value v = values.get(i);
      if (v.name == "Rotation") {
        output.println(v.name);
        output.println(v.pars);
        for (int e = 0; e < v.entries.size (); e++) {
          output.println(v.entries.get(e));
        }
      }
    }
    output.print("\nEnd of Keyframe Data\n");
    output.flush();
    output.close();
    exit();
  }
}

class Value {
  String name = "";
  String pars = "";
  StringList entries;

  Value(String _name, String _parameters) {
    name = _name;
    pars = _parameters;
    entries = new StringList();
  }

  void addEntry(String _s) {
    entries.append(_s);
  }
}

