class objNota extends Objeto{  
   
  String contenido = "[Sin Contenido]";
    
  public objNota(String name, float posX, float posY, float angle, String contenido){
    super(name, posX, posY, angle); 
    this.contenido = contenido;
  } 
  
  void draw(){
    map.canvas.pushMatrix();
    map.canvas.translate(posX*mult, posY*mult);
    map.canvas.rotate(radians(angle));
    map.canvas.noStroke();
    map.canvas.fill(255,225,91);
    map.canvas.rect(0,0, 0.4*mult, 0.6*mult);
    super.check = .4*mult*1.5;
    map.canvas.popMatrix();
  }

  public String imprimir(){
    return "Nota" + "|" + name + "|" + posX + "|" + posY + "|" + angle + "|" + contenido + "/";      
  }         

}
