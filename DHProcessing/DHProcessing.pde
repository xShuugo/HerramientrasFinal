import controlP5.*;

public enum ToolState{
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
float mult = 20;
PVector sideBar;
PVector propBar;
PImage rotCursor;

//INTERACTIONS
Objeto selectedObj = null;


//DATA
ToolState state = ToolState.MOVING;
Data data = new Data();
int qObj = 0;
String levelName = "Sin Titulo";
PVector playerPos = new PVector(0,0,0);

void setup(){  
  size(1000,600);
  createButtons();
  map = new MapCanvas();
  rotCursor = loadImage("RotateCursor.png");
}
  
void draw(){
  surface.setTitle("Room Maker - "+(int)frameRate+" fps");
  background(50);
  map.display(); 
  //println(state);
}

void mousePressed(){
  if(mouseButton == LEFT){
    if(mouseX < sideBar.x-pad && mouseX > pad && mouseY < height-pad && mouseY > pad*4){
      switch(state){
        case DRAWING : newObject(); break;
        case MOVING :  selectedObj = data.CheckSelection();
                       createProperties();
                       println(selectedObj + " selected"); break; 
      }
    }
  }
  if(mouseButton == RIGHT){
    map.tempObj = null;
  }
}

void mouseDragged(){
  if(mouseButton == LEFT && selectedObj != null){
    switch(state){
      case MOVING:
        selectedObj.posX = map.cmouse.x/mult;
        selectedObj.posY = map.cmouse.y/mult;
        break;
      case ROTATE:
        break;
    }
    createProperties();
  }
}

void newObject(){
  String currentObject = map.tempObj.name;
  
  switch(currentObject){
    case "tempMesa":        data.objeto.add(new objMesa       ("Mesa"+qObj,map.tempObj.posX,map.tempObj.posY,0));break;
    case "tempLampara" :    data.objeto.add(new objLampara    ("Lampara"+qObj,map.tempObj.posX,map.tempObj.posY,0,0,0,true,"null"));break;
    case "tempPared" :      data.objeto.add(new objPared      ("Pared"+qObj,map.tempObj.posX,map.tempObj.posY,0));break;
    case "tempFosforos" :   data.objeto.add(new objFosforos   ("Fosforos"+qObj,map.tempObj.posX,map.tempObj.posY,0,0)); break;
    case "tempEnchufe" :    data.objeto.add(new objEnchufe    ("Enchufe"+qObj,map.tempObj.posX,map.tempObj.posY,0));  break;
    case "tempCajafuerte" : data.objeto.add(new objCajafuerte ("Cajafuerte"+qObj,map.tempObj.posX,map.tempObj.posY,0,"null","null",true)); break;
    case "tempNota" :       data.objeto.add(new objNota       ("Nota"+qObj,map.tempObj.posX,map.tempObj.posY,0,"null"));  break;       
  }  
}

void keyPressed(){
  if(state == ToolState.MOVING && selectedObj != null){
    if(keyCode == LEFT){
        selectedObj.posX = selectedObj.posX - 0.1;
    } else if (keyCode == UP){      
        selectedObj.posY = selectedObj.posY - 0.1;
    } else if (keyCode == DOWN){      
        selectedObj.posY = selectedObj.posY + 0.1;
    } else if (keyCode == RIGHT){
        selectedObj.posX = selectedObj.posX + 0.1;
    }
  }
}
