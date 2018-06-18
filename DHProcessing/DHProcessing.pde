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
}

void draw(){
  background(50);
  map.display();
  sel.display();
  pro.display();
  tool.display();
}
