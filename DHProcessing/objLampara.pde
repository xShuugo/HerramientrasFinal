class objLampara extends Objeto{  
   
  float sizeLampara = .1;
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
    map.canvas.stroke(0,0,0);
    map.canvas.fill(255);

    if(isOnTable) map.canvas.rect(posX*mult-(mult/2), posY*mult-(mult/2), mult, mult);
    
    map.canvas.ellipse(posX*mult, posY*mult, sizeLampara*mult, sizeLampara*mult);
  }

  public String imprimir(){
    return "Lampara" + "|" + name + "|" + posX + "|" + posY + "|" + angle + "|" + cableLongitud + "|" + rangoLuz + "|" + isOnTable + "|" + enchufeInicial + "/";      
  }         
}
