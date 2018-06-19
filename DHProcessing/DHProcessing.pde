import controlP5.*;
ControlP5 ui;
Data data = new Data();
int qMesa = 0;
boolean isOnBool = false;
String levelName;

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
}
  

void draw(){
  background(50);
  map.display();
  sel.display();
  pro.display();
  tool.display();  
}

void generateObject(){
  //int X = int((random(pad, width*2/3-pad*1.5 - 30)));
  //int Y = int((random(pad*4, height-pad-80))); 
  int X = int(random(-map.canvas.width/2,map.canvas.width/2));
  int Y = int(random(-map.canvas.height/2,map.canvas.height/2));
  float angle = 0;
  int randomObject = round(random(0, 6));
  int isOn = round(random(0,1));
  if(isOn == 1) isOnBool = true;
  else isOnBool = false;
  switch(randomObject){
    case 0:  data.objeto.add(new Mesa("Mesa"+qMesa,X,Y, angle));  break;
    case 1:  data.objeto.add(new Lampara("Lampara"+qMesa, X,Y, angle, 3, 10, isOnBool, "prueba"));  break;
    case 2:  data.objeto.add(new Pared("Pared"+qMesa, X, Y, angle));  break;
    case 3:  data.objeto.add(new Fosforos("Fosforos"+qMesa, X, Y, angle, 3));  break;
    case 4:  data.objeto.add(new Enchufe("Pared"+qMesa, X, Y, angle));  break;
    case 5:  data.objeto.add(new Cajafuerte("Cajafuerte"+qMesa, X, Y, angle, "", "", isOnBool));  break;
    case 6:  data.objeto.add(new Nota("Nota"+qMesa, X, Y, angle, "")); break;
  }
  qMesa++;
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
}
