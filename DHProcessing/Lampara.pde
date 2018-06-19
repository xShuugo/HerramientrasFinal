class Lampara extends Objeto{  
   
  float sizeLampara = .1;
  float cableLongitud;
  float rangoLuz;
  boolean isOnTable;
  String enchufeInicial;
    
  public Lampara(String name, float posX, float posY, float angle, float cableLongitud, float rangoLuz, boolean isOnTable, String enchufeInicial){
    super(name, posX, posY, angle);    
    this.cableLongitud = cableLongitud;
    this.rangoLuz = rangoLuz;
    this.isOnTable = isOnTable;  
    this.enchufeInicial = enchufeInicial;
  } 
  
  void draw(){    
    map.canvas.stroke(0,0,0);
    map.canvas.fill(255);
    if(isOnTable == false){      
      map.canvas.ellipse(posX, posY, sizeLampara*50, sizeLampara*50);
    } else if(isOnTable){      
      map.canvas.rect(posX-25, posY-25, 50, 50);
      map.canvas.ellipse(posX, posY, sizeLampara*50, sizeLampara*50);
    }
  }

  public String imprimir(){
    return "Lampara" + "|" + name + "|" + posX + "|" + posY + "|" + angle + "|" + cableLongitud + "|" + rangoLuz + "|" + isOnTable + "|" + enchufeInicial + "/";      
  }         
}
