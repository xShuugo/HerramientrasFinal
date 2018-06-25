import controlP5.*;

public enum ToolState{
  IDLE,
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


//INTERACTIONS
Objeto selectedObj = null;


//DATA
ToolState state = ToolState.IDLE;
Data data = new Data();
int qObj = 0;
String levelName = "Sin Titulo";
PVector playerPos = new PVector(0,0,0);

void setup(){  
  size(1000,600);
  createButtons();
  map = new MapCanvas();
}
  
void draw(){
  background(50);
  map.display(); 
  println(state);
}

void controlEvent(ControlEvent e) 
{  
  if (e.getName().equals("objectList"))
  {
    String currentItem = objectList.getItem((int)e.value()).get("name").toString();
    switch(currentItem){
      case "Mesa":        map.tempObj = new objMesa       ("tempMesa",0,0,0);break;
      case "Lampara" :    map.tempObj = new objLampara    ("tempLampara",0,0,0,0,0,true,"null");break;
      case "Pared" :      map.tempObj = new objPared      ("tempPared",0,0,0);break;
      case "Fosforos" :   map.tempObj = new objFosforos   ("tempFosforos",0,0,0,0); break;
      case "Enchufe" :    map.tempObj = new objEnchufe    ("tempEnchufe",0,0,0);  break;
      case "Cajafuerte" : map.tempObj = new objCajafuerte ("tempCajafuerte",0,0,0,"null","null",true); break;
      case "Nota" :       map.tempObj = new objNota       ("tempNota",0,0,0,"null");  break;      
    }
    state = ToolState.DRAWING;
  } 
}

void generateObject(){
  float X = random(-map.canvas.width/(2*mult),map.canvas.width/(2*mult));
  float Y = random(-map.canvas.height/(2*mult),map.canvas.height/(2*mult));
  float angle = 0;
  boolean isOnBool = random(1) > .5;
  int randomObject = round(random(0, 6));
  switch(randomObject){
    case 0:  data.objeto.add(new objMesa("Mesa"+qObj,X,Y, angle));  break;
    case 1:  data.objeto.add(new objLampara("Lampara"+qObj, X,Y, angle, 3, 10, isOnBool, "prueba"));  break;
    case 2:  data.objeto.add(new objPared("Pared"+qObj, X, Y, angle));  break;
    case 3:  data.objeto.add(new objFosforos("Fosforos"+qObj, X, Y, angle, 3));  break;
    case 4:  data.objeto.add(new objEnchufe("Enchufe"+qObj, X, Y, angle));  break;
    case 5:  data.objeto.add(new objCajafuerte("Cajafuerte"+qObj, X, Y, angle, "", "", isOnBool));  break;
    case 6:  data.objeto.add(new objNota("Nota"+qObj, X, Y, angle, "")); break;
  }
  qObj++;
}

void exportFile(){
  String dataString;
  String aux = "";
  levelName = ui.get(Textfield.class, "txtLevelName").getText();
  playerPos = new PVector(
    ui.get(Textfield.class, "txtPlayerX").getValue(),
    ui.get(Textfield.class, "txtPlayerY").getValue(),
    ui.get(Textfield.class, "txtPlayerZ").getValue());
  
  for(Objeto o:data.objeto){    
    aux += o.imprimir();    
  }  
  dataString = levelName + "/"+playerPos.x+ "/"+playerPos.y+ "/"+playerPos.z+ aux; 
  data.superString = dataString;
  data.selectSave();
}

void openFile(){
  data.objeto = new ArrayList<Objeto>();
  data.selectFile();
}

void moveObject(){
  state = ToolState.MOVING;
}

void rotateObject(){
  state = ToolState.ROTATE;
}

void mousePressed(){
  if(mouseButton == LEFT){
    if(mouseX < sideBar.x-pad && mouseX > pad && mouseY < height-pad && mouseY > pad*4){
      switch(state){
        case IDLE:     break;                      
        case DRAWING : newObject(); break;
        case MOVING :  selectedObj = data.CheckSelection();
                       createProperties();
                       println(selectedObj + " selected"); break; 
      }
    }
  }
  if(mouseButton == RIGHT){
    state = ToolState.IDLE;
    map.tempObj = null;
  }
}

void mouseDragged(){
  if(mouseButton == LEFT && state == ToolState.MOVING && selectedObj != null){
    selectedObj.posX = map.cmouse.x/mult;
    selectedObj.posY = map.cmouse.y/mult;
  }
}

void newObject(){
  String currentObject = map.tempObj.name.toString();
  
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
