class MapCanvas{
  PGraphics canvas;
  PVector csize = new PVector(sideBar.x-pad*2,height-pad*5);
  PVector cpos = new PVector(pad,pad*4);  
  
  PVector ctrans = new PVector(csize.x/2,csize.y/2);
  PVector cmouse;
  PVector d = new PVector();
  Objeto tempObj;
  
  public MapCanvas(){
    
  }
  
  void display(){
    csize = new PVector(sideBar.x-pad*2,height-pad*5);
    cpos = new PVector(pad,pad*4);    
    canvas = createGraphics((int)csize.x,(int)csize.y);
    canvas.beginDraw();
    Pan();
    canvas.rectMode(CENTER);
    this.draw();
    canvas.endDraw();
    image(canvas,cpos.x,cpos.y);
  }
  
  void draw(){
    cmouse = new PVector(mouseX-cpos.x-ctrans.x,mouseY-cpos.y-ctrans.y);
    canvas.background(0);
    canvas.fill(150);
    canvas.rect(0,0,30*mult,30*mult);
    for(Objeto m : data.objeto){
      m.draw();
    }
    DrawGrid();
    if(mouseOverCanvas())DrawTool();
      else cursor(ARROW);
  }

  void DrawGrid(){
    canvas.stroke(255,50);
    canvas.line(15*mult,0,-15*mult,0);
    canvas.line(0,-15*mult,0,15*mult);
  }

  void DrawTool(){
    switch (state){
      case DRAWING:
        if(tempObj!=null){
          tempObj.posX = cmouse.x/mult;
          tempObj.posY = cmouse.y/mult;
          tempObj.draw();
        }
        break;
      case MOVING:
        cursor(movCursor);
        break;
      case ROTATE:
        cursor(rotCursor);
        break;
    }
  }

  void Pan(){
    d.sub(new PVector(mouseX,mouseY));
    if (mousePressed && mouseButton==CENTER) ctrans.sub(d);
    canvas.translate(ctrans.x,ctrans.y);
    d=new PVector(mouseX,mouseY);
  }

  boolean mouseOverCanvas(){
    return mouseX >= cpos.x && mouseX <= cpos.x+csize.x &&
        mouseY >= cpos.y && mouseY <= cpos.y+csize.y;
  }
}
