class objFosforos extends Objeto{  
   
  float size = 0.2;
  float cantidadFos = 0;
    
  public objFosforos(String name, float posX, float posY, float angle, float cantidadFos){
    super(name, posX, posY, angle);  
    this.cantidadFos = cantidadFos;
  } 
  
  void draw(){
    map.canvas.pushMatrix();
    map.canvas.translate(posX*mult-(size*mult/2), posY*mult-(size*mult/2));
    map.canvas.rotate(radians(angle));
    map.canvas.noStroke();
    map.canvas.fill(230,130,0);
    map.canvas.rect(0,0, size*mult,size*mult);
    map.canvas.popMatrix();
  }

  public String imprimir(){
    return "Fosforos"+ "|" + name + "|" + posX + "|" + posY + "|" + angle + "|" + cantidadFos +"/";      
  }         
}
