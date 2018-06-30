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
PImage[] movGizmo;


//INTERACTIONS
Objeto selectedObj = null;
float iniAng, objAng;
PVector iniPos, objPos;
int axis;


//DATA
ToolState state = ToolState.MOVING;
Data data = new Data();
int qObj = 0;
String levelName = "Sin Titulo";
PVector playerPos = new PVector(0, 0, 0);

void setup() {  
  size(1000, 600);
  createButtons();
  map = new MapCanvas();
  rotCursor = loadImage("RotateCursor.png");
  movCursor = loadImage("MoveCursor.png");
  movGizmo = new PImage[4];
  movGizmo[0] = loadImage("MoveGizmo.png");
  movGizmo[1] = loadImage("MoveGizmoX.png");
  movGizmo[2] = loadImage("MoveGizmoY.png");
  movGizmo[3] = loadImage("MoveGizmoXY.png");
}

void draw() {
  surface.setTitle("Room Maker - "+(int)frameRate+" fps");
  background(50);
  map.display(); 
}

void mousePressed() {
  Objeto sel = data.CheckSelection();
  axis = map.movAxis();
  if (mouseButton == LEFT) {
    if (map.mouseOverCanvas()) {
      switch(state) {
      case DRAWING : 
        newObject();
        break;
      case MOVING :
        if(axis == 0)
          selectedObj = sel;
        if (selectedObj!=null) {
          iniPos = new PVector(map.cmouse.x,map.cmouse.y);
          objPos = new PVector(selectedObj.posX*mult,selectedObj.posY*mult);
        }
        createProperties();
        println(selectedObj + " SELECTED");
        break; 
      case ROTATE :
        selectedObj = data.CheckSelection();
        if (selectedObj!=null) {
          objAng = selectedObj.angle;
          iniAng = -degrees(atan2(
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
      moveSelected();
      break;
    case ROTATE:
      rotateSelected();
      break;
    }
    createProperties();
  }
}

void mouseReleased(){
  axis=0;
}

void moveSelected(){
  switch(axis){
    case 1:
      selectedObj.posX = (objPos.x + map.cmouse.x-iniPos.x)/mult;
      snapPos();
      break;
    case 2:
      selectedObj.posY = (objPos.y + map.cmouse.y-iniPos.y)/mult;
      snapPos();
      break;
    case 3:
      selectedObj.posX = (objPos.x + map.cmouse.x-iniPos.x)/mult;
      selectedObj.posY = (objPos.y + map.cmouse.y-iniPos.y)/mult;
      snapPos();
      break;
  }
}

void snapPos(){
  selectedObj.posX = float(int(selectedObj.posX*100))/100;
  selectedObj.posY = float(int(selectedObj.posY*100))/100;
}



void rotateSelected(){
  float currAng = -degrees(atan2(
  selectedObj.posX-map.cmouse.x/mult, 
  selectedObj.posY-map.cmouse.y/mult));

  selectedObj.angle = objAng+currAng-iniAng;
  selectedObj.angle = selectedObj.angle%360;
  if(keyPressed == true && keyCode == SHIFT)
   selectedObj.angle = selectedObj.angle - selectedObj.angle%45;
  selectedObj.angle = float(int(selectedObj.angle*10))/10;
}

void newObject() {
  String currentObject = map.tempObj.name;
  map.tempObj.posX = float(int(map.tempObj.posX*100))/100;
  map.tempObj.posY = float(int(map.tempObj.posY*100))/100;
  switch(currentObject) {
  case "tempMesa":        
    data.objeto.add(new objMesa ("Mesa"+qObj, map.tempObj.posX, map.tempObj.posY, map.tempObj.angle));
    break;
  case "tempLampara" :    
    data.objeto.add(new objLampara ("Lampara"+qObj, map.tempObj.posX, map.tempObj.posY, map.tempObj.angle, 0, 0, true, "null"));
    break;
  case "tempPared" :      
    data.objeto.add(new objPared ("Pared"+qObj, map.tempObj.posX, map.tempObj.posY, map.tempObj.angle));
    break;
  case "tempFosforos" :   
    data.objeto.add(new objFosforos ("Fosforos"+qObj, map.tempObj.posX, map.tempObj.posY, map.tempObj.angle, 0)); 
    break;
  case "tempEnchufe" :    
    data.objeto.add(new objEnchufe ("Enchufe"+qObj, map.tempObj.posX, map.tempObj.posY, map.tempObj.angle));  
    break;
  case "tempCajafuerte" : 
    data.objeto.add(new objCajafuerte ("Cajafuerte"+qObj, map.tempObj.posX, map.tempObj.posY, map.tempObj.angle, "null", "null", true)); 
    break;
  case "tempNota" :       
    data.objeto.add(new objNota ("Nota"+qObj, map.tempObj.posX, map.tempObj.posY, 0, "null"));  
    break;
  }
}

void keyPressed() {
  if (state == ToolState.MOVING && selectedObj != null) {
    switch(keyCode) {
    case LEFT:  
      selectedObj.posX = selectedObj.posX - 0.1;
      createProperties(); 
      break;
    case UP:    
      selectedObj.posY = selectedObj.posY - 0.1; 
      createProperties();
      break;  
    case DOWN:  
      selectedObj.posY = selectedObj.posY + 0.1; 
      createProperties();
      break;
    case RIGHT: 
      selectedObj.posX = selectedObj.posX + 0.1; 
      createProperties();
      break;     
    }    
  }
  /*if (selectedObj != null){
    if(keyCode == BACKSPACE || keyCode == DELETE)
      for(Objeto o : data.objeto)
        if(o == selectedObj)
          data.objeto.remove(indexOf(o));      
  }*/
}

void mouseWheel(MouseEvent e) {
  if(state == ToolState.DRAWING && map.tempObj != null)
    map.tempObj.angle += e.getCount()*45;
  else  if (map.mouseOverCanvas()) {
    if(e.getCount()==-1) mult += 8;
    else mult -= 8;
    mult = constrain(mult, 16, 80);
    map.constrainTranslate();
    
  }
} 
