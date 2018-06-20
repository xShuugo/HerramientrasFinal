class objLampara extends Objeto{  
   
  float diameter = .1;
  float cableLongitud;
  float rangoLuz;
  boolean isOnTable;
  String enchufeInicial;
    
  public objLampara(String name, float posX, float posY, float angle, float cableLongitud, float rangoLuz, boolean isOnTable, String enchufeInicial){
    super(name, posX, posY, angle);    
    this.cableLongitud = cableLongitud;
    this.rangoLuz = rangoLuz;
    this.isOnTable = isOnTable;  
    this.enchufeInicial = enchufeInicial;
  } 
  
  void draw(){    
    map.canvas.pushMatrix();
    map.canvas.translate(posX*mult, posY*mult);
    map.canvas.rotate(radians(angle));
    map.canvas.noStroke();

    if(isOnTable){ 
      map.canvas.fill(99,83,52);
      map.canvas.rect(-(mult/2), -(mult/2), mult, mult);
    }

    map.canvas.fill(230,230,0);
    map.canvas.ellipse(0,0, diameter*mult, diameter*mult);
    map.canvas.popMatrix();
  }

  public String imprimir(){
    return "Lampara" + "|" + name + "|" + posX + "|" + posY + "|" + angle + "|" + cableLongitud + "|" + rangoLuz + "|" + isOnTable + "|" + enchufeInicial + "/";      
  }         
}
