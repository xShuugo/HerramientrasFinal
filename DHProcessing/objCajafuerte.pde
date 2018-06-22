class objCajafuerte extends Objeto{  
   
  float size = 0.5;
  String password = "";
  boolean isOnTable;
  String contenido;
  
    
  public objCajafuerte(String name, float posX, float posY, float angle, String password, String contenido, boolean isOnTable){
    super(name, posX, posY, angle);    
    this.password = password;
    this.contenido = contenido;
    this.isOnTable = isOnTable;
  } 
  
  void draw(){
    map.canvas.pushMatrix();
    map.canvas.translate(posX*mult, posY*mult);
    map.canvas.rotate(radians(angle));
    map.canvas.noStroke();
    super.check = size*mult*1.5;
    if(isOnTable){
      map.canvas.fill(99,83,52);
      map.canvas.rect(0,0, mult, mult); 
      super.check = mult*1.5;
    }  

    map.canvas.fill(255,0,0);
    map.canvas.rect(0,0, size*mult,size*mult);    
    
    map.canvas.popMatrix();
  }

  public String imprimir(){
    return "Cajafuerte" + "|" + name + "|" + posX + "|" + posY + "|" + angle + "|" + password + "|" + contenido + "|" + isOnTable + "/";      
  }

}
