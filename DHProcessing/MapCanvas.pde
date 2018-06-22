class MapCanvas{
  PGraphics canvas;
  PVector csize = new PVector(sideBar.x-pad*2,height-pad*5);
  PVector cpos = new PVector(pad,pad*4);  
  
  PVector ctrans = new PVector(csize.x/2,csize.y/2);
  PVector cmouse;
  Objeto tempObj;
  
  public MapCanvas(){
    
  }
  
  void display(){
    csize = new PVector(sideBar.x-pad*2,height-pad*5);
    cpos = new PVector(pad,pad*4);    
    canvas = createGraphics((int)csize.x,(int)csize.y);
    canvas.beginDraw();
    canvas.translate(ctrans.x,ctrans.y);
    canvas.rectMode(CENTER);
    this.draw();
    canvas.endDraw();
    image(canvas,cpos.x,cpos.y);
  }
  
  void draw(){
    cmouse = new PVector(mouseX-cpos.x-ctrans.x,mouseY-cpos.y-ctrans.y);
    canvas.background(150);
    
    for(Objeto m : data.objeto){
      m.draw();
      SelectedOverLay(m);
    }
    DrawGrid();
    DrawTool();
  }

  void DrawGrid(){
    canvas.stroke(255,50);
    canvas.line(1000,0,-1000,0);
    canvas.line(0,-1000,0,1000);
  }

  void DrawTool(){
    if(tempObj!=null){
       tempObj.posX = cmouse.x/mult;
       tempObj.posY = cmouse.y/mult;
       tempObj.draw();
       }
  }

  void SelectedOverLay(Objeto m){
    if(m.MouseOver()){
      map.canvas.noFill();
      map.canvas.stroke(255,255,255);
      map.canvas.ellipse(m.posX*mult,m.posY*mult,m.check,m.check);
      }
  }

}
