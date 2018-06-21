import controlP5.*;

//UI
ControlP5 ui;
DropdownList objectList;
MapCanvas map;
int pad=15;
float mult = 20;

//DATA
Data data = new Data();
int qObj = 0;
String levelName;
PVector playerPos;

void setup(){  
  size(1000,600);
  surface.setResizable(true);
  map = new MapCanvas();
  createButtons();
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
      case "Mesa":        map.tempObj = new objMesa("temp",0,0,0); break;
      case "Lampara" :    map.tempObj = new objLampara("temp",0,0,0,0,0,true,"null");break;
      case "Pared" :      map.tempObj = new objPared("temp",0,0,0);break;
      case "Fosforos" :   map.tempObj = new objFosforos("temp",0,0,0,0); break;
      case "Enchufe" :    map.tempObj = new objEnchufe("temp",0,0,0);  break;
      case "Cajafuerte" : map.tempObj = new objCajafuerte("temp",0,0,0,"null","null",true); break;
      case "Nota" :       map.tempObj = new objNota("temp",0,0,0,"null");  break;
    }
  } 
}

void createButtons(){
  ui = new ControlP5(this);
  ui.addButton("generateObject").setPosition(pad, pad).setSize(50,pad*2).setLabel("Generar");
  ui.addButton("exportFile").setPosition(pad+55, pad).setSize(50, pad*2).setLabel("Exportar");
  ui.addButton("openFileLocation").setPosition(width-pad-50, pad).setSize(50, pad*2).setLabel("Abrir");
  ui.addTextfield("levelName").setLabel("").setPosition(pad + 191, pad).setSize(130, pad*2).setAutoClear(false).setFont(createFont("Arial Black",12));
  ui.addTextlabel("label").setText("Level Name :").setPosition(pad+125,pad+7.5).setColorValue(0x00000000).setFont(createFont("Arial",10));
  objectList = ui.addDropdownList("objectList").setPosition(width-(width*1/3-pad*1.5)-pad+4, pad*4+5).setLabel("Select an object").setSize(130, 500).setBarHeight(20).setFont(createFont("Arial Black",10))
    .setItemHeight(20).addItem("Mesa",1).addItem("Lampara",2).addItem("Pared",3).addItem("Fosforos",4).addItem("Enchufe",5).addItem("Cajafuerte",6).addItem("Nota",7);    
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
  levelName = ui.get(Textfield.class, "levelName").getText();
  
  for(Objeto o:data.objeto){    
    aux += o.imprimir();    
  }  
  dataString = levelName + "/"+"0.1|10|0.5/" + aux; 
  data.superString = dataString;
  data.selectSave();
}

void openFileLocation(){
  data.objeto = new ArrayList<Objeto>();
  data.selectFile();
}

