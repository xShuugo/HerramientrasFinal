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
    
    canvas.background(150);
    
    for(Objeto m : data.objeto){
      m.draw();
    }
    
    switch(currentItem){
      case "Mesa": map.canvas.noStroke();
                   map.canvas.fill(99,83,52);
                   map.canvas.rect(cmouseX-(1*mult/2),cmouseY-(1*mult/2), 1*mult,1*mult); break;
      case "Lampara" : /*if(isOnTable){ 
                          map.canvas.fill(99,83,52);
                          map.canvas.rect(-(mult/2), -(mult/2), mult, mult);
                        }*/
                        map.canvas.fill(230,230,0);
                        map.canvas.ellipse(cmouseX-(0.1*mult/2),cmouseY-(0.1*mult/2), 0.1*mult, 0.1*mult);
                        break;
      case "Pared" : map.canvas.noStroke();
                     map.canvas.fill(255);
                     map.canvas.rect(cmouseX-(4*mult/2), cmouseY-(0.5*mult/2), 4*mult, 0.5*mult);      
                     break;
      case "Fosforos" : map.canvas.noStroke();
                        map.canvas.fill(230,130,0);
                        map.canvas.rect(cmouseX-(0.2*mult/2),cmouseY-(0.2*mult/2), 0.2*mult,0.2*mult);
                        break;
      case "Enchufe" : map.canvas.noStroke();
                       map.canvas.fill(66,192,255);
                       map.canvas.rect(cmouseX-(0.2*mult/2),cmouseY-(0.2*mult/4), 0.2*mult,0.2*mult/2);break;
      case "Cajafuerte" : /*if(isOnTable){
                            map.canvas.fill(99,83,52);
                            map.canvas.rect((size*mult/2)-(mult/2), (size*mult/2)-(mult/2), mult, mult); 
                           }*/
                          map.canvas.fill(255,0,0);
                          map.canvas.rect(cmouseX-(0.5*mult/2),cmouseY-(0.5*mult/2), 0.5*mult,0.5*mult);
                          break;
      case "Nota" : map.canvas.fill(255,225,91);
                    map.canvas.rect(cmouseX-(0.4*mult/2),cmouseY-(0.6*mult/2), 0.4*mult, 0.6*mult);
                    break;
                    
      default: canvas.stroke(0,0,255);
               canvas.noFill();
               canvas.ellipse(cmouseX,cmouseY,40,40);
    }
    /*canvas.stroke(0,0,255);
    canvas.noFill();
    canvas.ellipse(cmouseX,cmouseY,40,40); */   
  } 
}
