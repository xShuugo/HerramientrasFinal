class SelectionCanvas{
  PGraphics canvas;
  PVector csize;
  PVector cpos;
  
  public SelectionCanvas(){
    
  }
  
  void display(){
    csize = new PVector(width*1/3-pad*1.5,height*1/3-pad*2);
    cpos = new PVector(width-csize.x-pad,pad*4);
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
    canvas.stroke(255,0,0);
    canvas.ellipse(cmouseX,cmouseY,40,40);
  } 
}
