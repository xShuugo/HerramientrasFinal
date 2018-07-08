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
int mult = 16;
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
  loadPics();
}

void draw() {
  surface.setTitle("Room Maker - "+(int)frameRate+" fps");
  background(50);
  if(data.listReady) map.display(); 
  ui.draw();
  if(data.doNew) data.newList();
  if(data.doOpen) data.openList();
}

void loadPics(){
  rotCursor = loadImage("RotateCursor.png");
  movCursor = loadImage("MoveCursor.png");
  movGizmo = new PImage[4];
  movGizmo[0] = loadImage("MoveGizmo.png");
  movGizmo[1] = loadImage("MoveGizmoX.png");
  movGizmo[2] = loadImage("MoveGizmoY.png");
  movGizmo[3] = loadImage("MoveGizmoXY.png");
}