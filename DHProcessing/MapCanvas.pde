class MapCanvas{
  PGraphics canvas;
  PVector csize = new PVector(width*2/3-pad*1.5,height-pad*5);
  PVector cpos = new PVector(pad,pad*4);  
  
  PVector ctrans = new PVector(csize.x/2,csize.y/2);
  
  public MapCanvas(){
    
  }
  
  void display(){
    csize = new PVector(width*2/3-pad*1.5,height-pad*5);
    cpos = new PVector(pad,pad*4);    
    canvas = createGraphics((int)csize.x,(int)csize.y);
    canvas.beginDraw();
    canvas.translate(ctrans.x,ctrans.y);
    this.draw();
    canvas.endDraw();
    image(canvas,cpos.x,cpos.y);
  }
  
  void draw(){
    float cmouseX = mouseX-cpos.x-ctrans.x;
    float cmouseY = mouseY-cpos.y-ctrans.y;
    
    canvas.background(100);
    
    for(Objeto m : data.objeto){
      m.draw();
    }
    
    canvas.stroke(0,0,255);
    canvas.noFill();
    canvas.ellipse(cmouseX,cmouseY,40,40);
    
  } 
}
