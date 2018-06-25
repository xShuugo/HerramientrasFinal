class objFosforos extends Objeto{  
   
  float size = 0.2;
  float cantidadFos = 0;
    
  public objFosforos(String name, float posX, float posY, float angle, float cantidadFos){
    super(name, posX, posY, angle);  
    this.cantidadFos = cantidadFos;
  } 
  
  void draw(){
    map.canvas.pushMatrix();
    map.canvas.translate(posX*mult, posY*mult);
    map.canvas.rotate(radians(angle));
    map.canvas.noStroke();
    map.canvas.fill(230,130,0);
    map.canvas.rect(0,0, size*mult,size*mult);
    super.check = size*mult*1.5;
    map.canvas.popMatrix();
  }

  public String imprimir(){
    return "Fosforos"+ "|" + name + "|" + posX + "|" + posY + "|" + angle + "|" + cantidadFos +"/";      
  }         
  
  void createProperties(){
    super.createProperties(); 
    
    propBar = new PVector(propBar.x,propBar.y+pad*3);
    
    prop.addTextlabel("lblCantidad").
      setText("Cantidad de Fosforos:"). 
      setPosition(propBar.x,propBar.y+7).
      setColorValue(color(255,255,255)); 
    
    prop.addTextfield("txtCantidad").
      setLabel("").
      setPosition(propBar.x+130, propBar.y).
      setSize(60, pad*2).
      setText(str(cantidadFos)).
      setAutoClear(false);     
  }
}
