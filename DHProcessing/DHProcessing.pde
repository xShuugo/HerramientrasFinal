import controlP5.*;
ControlP5 ui;
Data data = new Data();
int TableCount;

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
}

void draw(){
  background(50);
  map.display();
  sel.display();
  pro.display();
  tool.display();
}

/*void generateTable(){
  int randomX = int((random(pad, width*2/3-pad*1.5 - 30)));
  int randomY = int((random(pad*4, height-pad-80)));
  int Mesa = 0;
  data.updateData("Mesa" + Mesa,Integer.toString(randomX), Integer.toString(randomY)); <---- Falta agregar valores
  Mesa++;
}
*/
