class ToolsCanvas{
  PGraphics canvas;
  PVector csize;
  PVector cpos;
  
  public ToolsCanvas(){
    
  }
  
  void display(){
    csize = new PVector(width-pad*2,pad*2);
    cpos = new PVector(pad,pad);
    canvas = createGraphics((int)csize.x,(int)csize.y);
    canvas.beginDraw();
    this.draw();
    canvas.endDraw();
    image(canvas,cpos.x,cpos.y);
  }
  
  void draw(){
    float cmouseX = mouseX-cpos.x;
    float cmouseY = mouseY-cpos.y;
    
    canvas.background(255);
    canvas.stroke(255,255,0);
    canvas.ellipse(cmouseX,cmouseY,40,40);
  } 
}