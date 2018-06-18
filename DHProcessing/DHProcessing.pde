import controlP5.*;
ControlP5 ui;
Data data = new Data();
int qMesa = 0;

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
  ui.addButton("generateTable").setPosition(pad, pad).setSize(50,pad*2).setLabel("Generar");
  ui.addButton("exportFile").setPosition(pad+50, pad).setSize(50, pad*2).setLabel("Exportar");
}

void draw(){
  background(50);
  map.display();
  sel.display();
  pro.display();
  tool.display();
}

void generateTable(){
  //int X = int((random(pad, width*2/3-pad*1.5 - 30)));
  //int Y = int((random(pad*4, height-pad-80))); 
  int X = int(random(-map.canvas.width/2,map.canvas.width/2));
  int Y = int(random(-map.canvas.height/2,map.canvas.height/2));
  float angle = 0; 
  data.mesa.add(new Mesa("Mesa"+qMesa,X,Y, angle));  
  qMesa++;
}

void exportFile(){
  String dataString;
  String aux = "";      
  
  for(Mesa m:data.mesa){    
    aux += m.mesaString();    
  }  
  dataString = "TestLevel1/"+"0.1|10|0.5/" + aux; 
  data.superString = dataString;
  data.selectSave();
}

void onOutputSelected(File path){
  data.filePath = path.getAbsolutePath(); 
  data.saveData();
  }
