import controlP5.*;
ControlP5 ui;
Data data = new Data();
int qObj = 0;
float mult = 20;
boolean isOnBool = false;
String levelName;
float playerX;
float playerY;
float playerZ;
DropdownList objectList;
String currentItem = "";

int pad=15;
MapCanvas map;
SelectionCanvas sel;
PropertiesCanvas pro;
ToolsCanvas tool;

void setup(){  
  size(1000,600);
  surface.setResizable(true);
  map = new MapCanvas();
  sel = new SelectionCanvas();
  pro = new PropertiesCanvas();
  tool = new ToolsCanvas();
  
  ui = new ControlP5(this);
  ui.addButton("generateObject").setPosition(pad, pad).setSize(50,pad*2).setLabel("Generar");
  ui.addButton("exportFile").setPosition(pad+55, pad).setSize(50, pad*2).setLabel("Exportar");
  ui.addButton("openFileLocation").setPosition(width-pad-50, pad).setSize(50, pad*2).setLabel("Abrir");
  ui.addTextfield("levelName").setLabel("").setPosition(pad + 191, pad).setSize(130, pad*2).setAutoClear(false).setFont(createFont("Arial Black",12));
  ui.addTextlabel("label").setText("Level Name :").setPosition(pad+125,pad+7.5).setColorValue(0x00000000).setFont(createFont("Arial",10));
  objectList = ui.addDropdownList("objectList").setPosition(width-(width*1/3-pad*1.5)-pad+4, pad*4+5).setLabel("Select an object").setSize(130, 500).setBarHeight(20).setFont(createFont("Arial Black",10))
    .setItemHeight(20).addItem("Mesa",1).addItem("Lampara",2).addItem("Pared",3).addItem("Fosforos",4).addItem("Enchufe",5).addItem("Cajafuerte",6).addItem("Nota",7);    
}
  
void draw(){
  background(50);
  map.display();
  sel.display();
  pro.display();
  tool.display();  
}

void controlEvent(ControlEvent theControlEvent) 
{  
  if (theControlEvent.getName().equals("objectList"))
  {
    String selectedItem = objectList.getItem((int)theControlEvent.value()).get("name").toString();
    currentItem = selectedItem;
  } 
}

void generateObject(){
  float X = random(-map.canvas.width/(2*mult),map.canvas.width/(2*mult));
  float Y = random(-map.canvas.height/(2*mult),map.canvas.height/(2*mult));
  float angle = 0;
  int randomObject = round(random(0, 6));
  int isOn = round(random(0,1));
  if(isOn == 1) isOnBool = true;
  else isOnBool = false;
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

void onOutputSelected(File path){
  data.filePath = path.getAbsolutePath(); 
  data.saveData();
}

void openFile(File path){
  data.filePath = path.getAbsolutePath();    
  data.openString = split(loadStrings(path)[0], "/");
  levelName = data.openString[0];
  
  String[] pos = split(data.openString[1], "|");
  playerX = Float.valueOf(pos[0]);
  playerY = Float.valueOf(pos[1]);
  playerZ = Float.valueOf(pos[2]);
  
  for(int i = 2; i < data.openString.length; i++){
    String[] objs = split(data.openString[i], "|");    
    switch(objs[0]){
      case "Mesa": data.objeto.add(new objMesa(objs[1], Float.valueOf(objs[2]), Float.valueOf(objs[3]), Float.valueOf(objs[4]))); break;
      case "Lampara": data.objeto.add(new objLampara(objs[1], Float.valueOf(objs[2]), Float.valueOf(objs[3]), Float.valueOf(objs[4]), Float.valueOf(objs[5]), Float.valueOf(objs[6]), Boolean.valueOf(objs[7]), objs[8])) ; break;
      case "Pared": data.objeto.add(new objPared(objs[1], Float.valueOf(objs[2]), Float.valueOf(objs[3]), Float.valueOf(objs[4]))); break;
      case "Fosforos": data.objeto.add(new objFosforos(objs[1], Float.valueOf(objs[2]), Float.valueOf(objs[3]), Float.valueOf(objs[4]), Float.valueOf(objs[5]))); break;
      case "Cajafuerte": data.objeto.add(new objCajafuerte(objs[1], Float.valueOf(objs[2]), Float.valueOf(objs[3]), Float.valueOf(objs[4]), objs[5], objs[6], Boolean.valueOf(objs[7]))); break;
      case "Nota": data.objeto.add(new objNota(objs[1], Float.valueOf(objs[2]), Float.valueOf(objs[3]), Float.valueOf(objs[4]), objs[5])); break;
      case "Enchufe": data.objeto.add(new objEnchufe(objs[1], Float.valueOf(objs[2]), Float.valueOf(objs[3]), Float.valueOf(objs[4]))); break;
    }
  }   
}
