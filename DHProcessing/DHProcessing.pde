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
}

void draw(){
  background(50);
  map.display();
  sel.display();
  pro.display();
  tool.display();
}

void generateTable(){
  int X = int((random(pad, width*2/3-pad*1.5 - 30)));
  int Y = int((random(pad*4, height-pad-80)));
  int qMesa = 0;
  data.mesa.add(new Mesa("Mesa"+qMesa,X,Y));
  qMesa++;
}
