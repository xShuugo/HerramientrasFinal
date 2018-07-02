import controlP5.*;

public enum ToolState {
  DRAWING, 
  MOVING, 
  ROTATE,
  eCHOOSE;
}

//UI
ControlP5 ui;
ControlP5 prop;
ControlP5 sb;
DropdownList objectList;
MapCanvas map;
int pad=15;
int lblPad=10;
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
boolean step = false;
String tempObjName = "Mesa";


//DATA
ToolState state = ToolState.MOVING;
Data data = new Data();
int qObj = 33;
String levelName = "Sin Titulo";
PVector playerPos = new PVector(0, 0, 0);

void setup() {  
  size(1000, 600);
  createButtons();
  createBorder();
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
  Objeto sel = map.overObj;
  if (mouseButton == LEFT) {
    if (map.mouseOverCanvas()) {
      switch(state) {
      case DRAWING : 
        newObject();
        break;
      case MOVING :
        axis = map.movAxis();
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
        axis = map.rotAxis();
        if(axis == 0)
          selectedObj = sel;
        if (selectedObj!=null) {
          objAng = selectedObj.angle;
          iniAng = -degrees(atan2(
            selectedObj.posX-map.cmouse.x/mult, 
            selectedObj.posY-map.cmouse.y/mult));
        }
        createProperties();
        println(selectedObj + " SELECTED");
        break;
      case eCHOOSE:
        if(sel instanceof objEnchufe){
          objLampara l = (objLampara) selectedObj;
          l.enchufeInicial = (objEnchufe) sel;
        }
        state = ToolState.MOVING;
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
  }
}

void mouseReleased(){
  axis=0;
  if(map.mouseOverCanvas())createProperties();
}

void moveSelected(){
  switch(axis){
    case 1:
      selectedObj.posX = (objPos.x + map.cmouse.x-iniPos.x)/mult;
      snapPos(selectedObj);
      break;
    case 2:
      selectedObj.posY = (objPos.y + map.cmouse.y-iniPos.y)/mult;
      snapPos(selectedObj);
      break;
    case 3:
      selectedObj.posX = (objPos.x + map.cmouse.x-iniPos.x)/mult;
      selectedObj.posY = (objPos.y + map.cmouse.y-iniPos.y)/mult;
      snapPos(selectedObj);
      break;
  }
}

void snapPos(Objeto obj){
  obj.posX = float(int(obj.posX*100))/100;
  obj.posY = float(int(obj.posY*100))/100;
}

void rotateSelected(){
  if(axis != 0){
    float currAng = -degrees(atan2(
    selectedObj.posX-map.cmouse.x/mult, 
    selectedObj.posY-map.cmouse.y/mult));

    selectedObj.angle = objAng+currAng-iniAng;
    selectedObj.angle = selectedObj.angle%360;
    if(keyPressed == true && keyCode == SHIFT)
    selectedObj.angle = selectedObj.angle - selectedObj.angle%45;
    selectedObj.angle = float(int(selectedObj.angle*10))/10;
  }
}

void newObject() {
  selectedObj = null;
  String currentObject = map.tempObj.name;
  map.tempObj.posX = float(int(map.tempObj.posX*100))/100;
  map.tempObj.posY = float(int(map.tempObj.posY*100))/100;
  switch(currentObject) {
  case "tempMesa":        
    data.objeto.add(new objMesa ("Mesa"+qObj, map.tempObj.posX, map.tempObj.posY, map.tempObj.angle));
    break;
  case "tempLampara" :    
    data.objeto.add(new objLampara ("Lampara"+qObj, map.tempObj.posX, map.tempObj.posY, map.tempObj.angle, 10, 3, true, "null"));
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
    float nudge;
    if(step) nudge = 0.1;
    else nudge = 0.01;
    switch(keyCode) {
      case LEFT:  
        selectedObj.posX = selectedObj.posX - nudge;
        createProperties(); 
        break;
      case UP:    
        selectedObj.posY = selectedObj.posY - nudge; 
        createProperties();
        break;  
      case DOWN:  
        selectedObj.posY = selectedObj.posY + nudge; 
        createProperties();
        break;
      case RIGHT: 
        selectedObj.posX = selectedObj.posX + nudge; 
        createProperties();
        break;     
    }    
  }
  if( map.mouseOverCanvas()){
    if (selectedObj != null){
      if(key == BACKSPACE || key == DELETE){
        removeDependence();
        data.objeto.remove(data.objeto.indexOf(selectedObj));
        selectedObj=null;
      }
    }
    
    switch(keyCode){
      case 'Q' : state = ToolState.DRAWING;
                currentTempObj(tempObjName);
                cursor(ARROW); break;
      case 'W' : state = ToolState.MOVING; break;
      case 'E' : state = ToolState.ROTATE; break;
    }
  }

  if(keyCode == SHIFT) step = true;
}

void keyReleased(){
  if(keyCode == SHIFT) step = false;
}

void removeDependence(){
  if(selectedObj instanceof objEnchufe){
    for(Objeto o:data.objeto){
      if(o instanceof objLampara){
        objLampara l = (objLampara) o;
        if(l.enchufeInicial == selectedObj) l.enchufeInicial = null;
      }
    }
  }
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
