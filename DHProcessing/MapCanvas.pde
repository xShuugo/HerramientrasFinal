class MapCanvas{
  PGraphics canvas;
  PVector csize;
  PVector cpos;
  
  public MapCanvas(){
    
  }
  
  void display(){
    csize = new PVector(width*2/3-pad*1.5,height-pad*5);
    cpos = new PVector(pad,pad*4);    
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
    
    for(Mesa m : data.mesa){
      m.draw();
    }
    
    canvas.stroke(0,0,255);
    canvas.ellipse(cmouseX,cmouseY,40,40);
    
  } 
}
