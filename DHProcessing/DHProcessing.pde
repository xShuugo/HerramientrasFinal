import controlP5.*;

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
  
}

void controlEvent(ControlEvent e) 
{  
  if (e.getName().equals("objectList"))
  {
    String currentItem = objectList.getItem((int)e.value()).get("name").toString();
    switch(currentItem){
      case "Mesa":        map.tempObj = new objMesa       ("temp",0,0,0); break;
      case "Lampara" :    map.tempObj = new objLampara    ("temp",0,0,0,0,0,true,"null");break;
      case "Pared" :      map.tempObj = new objPared      ("temp",0,0,0);break;
      case "Fosforos" :   map.tempObj = new objFosforos   ("temp",0,0,0,0); break;
      case "Enchufe" :    map.tempObj = new objEnchufe    ("temp",0,0,0);  break;
      case "Cajafuerte" : map.tempObj = new objCajafuerte ("temp",0,0,0,"null","null",true); break;
      case "Nota" :       map.tempObj = new objNota       ("temp",0,0,0,"null");  break;
    }
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

void mousePressed(){
  if(mouseButton == LEFT)
    if(mouseX < sideBar.x-pad &&
       mouseX > pad &&
       mouseY < height-pad &&
       mouseY > pad*4){
        selectedObj = data.CheckSelection();
        createProperties();
        println(selectedObj + " selected");
        }
}