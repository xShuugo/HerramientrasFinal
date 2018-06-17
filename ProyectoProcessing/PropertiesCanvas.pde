class PropertiesCanvas{
  PGraphics canvas;
  PVector csize;
  PVector cpos;
  
  public PropertiesCanvas(){
    
  }
  
  void display(){
    csize = new PVector(width*1/3-pad*1.5,height*2/3-pad*1.5);
    cpos = new PVector(width-csize.x-pad,height-csize.y-pad);
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
    canvas.stroke(0,255,0);
    canvas.ellipse(cmouseX,cmouseY,40,40);
  }
  
  
}
