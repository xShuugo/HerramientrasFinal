import controlP5.*;

public enum ToolState {
  DRAWING, 
    MOVING, 
    ROTATE;
}

//UI
ControlP5 ui;
ControlP5 prop;
ControlP5 sb;
DropdownList objectList;
MapCanvas map;
int pad=15;
int mult = 20;
PVector sideBar;
PVector propBar;
PImage rotCursor, movCursor;

//INTERACTIONS
Objeto selectedObj = null;
float prevAng, objAng;


//DATA
ToolState state = ToolState.MOVING;
Data data = new Data();
int qObj = 0;
String levelName = "Sin Titulo";
PVector playerPos = new PVector(0, 0, 0);

void setup() {  
  size(1000, 600, P2D);
  createButtons();
  map = new MapCanvas();
  rotCursor = loadImage("RotateCursor.png");
  movCursor = loadImage("MoveCursor.png");
}

void draw() {
  surface.setTitle("Room Maker - "+(int)frameRate+" fps");
  background(50);
  map.display(); 
  //println(state);
}

void mousePressed() {
  if (mouseButton == LEFT) {
    if (map.mouseOverCanvas()) {
      switch(state) {
      case DRAWING : 
        newObject();
        break;
      case MOVING :
        selectedObj = data.CheckSelection();
        createProperties();
        println(selectedObj + " SELECTED");
        break; 
      case ROTATE :
        selectedObj = data.CheckSelection();
        if (selectedObj!=null) {
          prevAng = -degrees(atan2(
            selectedObj.posX-map.cmouse.x/mult, 
            selectedObj.posY-map.cmouse.y/mult));
        }
        createProperties();
        println(selectedObj + " SELECTED");
        break;
      }
    }
  }
  if (mouseButton == RIGHT) {
    state = ToolState.MOVING;
    map.tempObj = null;
  }
}

void mouseDragged() {
  if (mouseButton == LEFT && selectedObj != null && map.mouseOverCanvas()) {
    switch(state) {
    case MOVING:
      selectedObj.posX = map.cmouse.x/mult;
      selectedObj.posY = map.cmouse.y/mult;
      selectedObj.posX = float(int(selectedObj.posX*10))/10;
      selectedObj.posY = float(int(selectedObj.posY*10))/10;

      println(selectedObj.posX);
      break;
    case ROTATE:
      float currAng = -degrees(atan2(
        selectedObj.posX-map.cmouse.x/mult, 
        selectedObj.posY-map.cmouse.y/mult));

      selectedObj.angle += currAng-prevAng;
      selectedObj.angle = selectedObj.angle%360;
      selectedObj.angle = float(int(selectedObj.angle*10))/10;
      prevAng=currAng;
      break;
    }
    createProperties();
  }
}

void newObject() {
  String currentObject = map.tempObj.name;
  map.tempObj.posX = float(int(map.tempObj.posX*10))/10;
  map.tempObj.posY = float(int(map.tempObj.posY*10))/10;
  switch(currentObject) {
  case "tempMesa":        
    data.objeto.add(new objMesa       ("Mesa"+qObj, map.tempObj.posX, map.tempObj.posY, 0));
    break;
  case "tempLampara" :    
    data.objeto.add(new objLampara    ("Lampara"+qObj, map.tempObj.posX, map.tempObj.posY, 0, 0, 0, true, "null"));
    break;
  case "tempPared" :      
    data.objeto.add(new objPared      ("Pared"+qObj, map.tempObj.posX, map.tempObj.posY, 0));
    break;
  case "tempFosforos" :   
    data.objeto.add(new objFosforos   ("Fosforos"+qObj, map.tempObj.posX, map.tempObj.posY, 0, 0)); 
    break;
  case "tempEnchufe" :    
    data.objeto.add(new objEnchufe    ("Enchufe"+qObj, map.tempObj.posX, map.tempObj.posY, 0));  
    break;
  case "tempCajafuerte" : 
    data.objeto.add(new objCajafuerte ("Cajafuerte"+qObj, map.tempObj.posX, map.tempObj.posY, 0, "null", "null", true)); 
    break;
  case "tempNota" :       
    data.objeto.add(new objNota       ("Nota"+qObj, map.tempObj.posX, map.tempObj.posY, 0, "null"));  
    break;
  }
}

void keyPressed() {
  if (state == ToolState.MOVING && selectedObj != null) {
    switch(keyCode) {
    case LEFT:  
      selectedObj.posX = selectedObj.posX - 0.1; 
      break;
    case UP:    
      selectedObj.posY = selectedObj.posY - 0.1; 
      break;  
    case DOWN:  
      selectedObj.posY = selectedObj.posY + 0.1; 
      break;
    case RIGHT: 
      selectedObj.posX = selectedObj.posX + 0.1; 
      break;
    }
    createProperties();
  }
}

void mouseWheel(MouseEvent e) {

  if (map.mouseOverCanvas())
    if ( selectedObj == null) {
      mult -= e.getCount();
      mult = constrain(mult, 16, 80);
    }

  if (state == ToolState.ROTATE && selectedObj != null) {
    selectedObj.angle = selectedObj.angle + (e.getCount()*45);
    createProperties();
  }
} 
