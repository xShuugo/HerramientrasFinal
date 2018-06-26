class objPared extends Objeto {  

  float paredWidth = 4;
  float paredDepth = 0.5;

  public objPared(String name, float posX, float posY, float angle) {
    super(name, posX, posY, angle);
  } 

  void draw() {
    map.canvas.rect(posX*mult,posY*mult, paredWidth*mult, paredDepth*mult);
    map.canvas.line(posX*mult,posY*mult,map.cmouse.x,map.cmouse.y);
    super.draw();

    println(map.cmouse.x + " | sc: "+ map.canvas.screenX(mouseX/mult,mouseY/mult));

    map.canvas.pushMatrix();
    map.canvas.translate(posX*mult, posY*mult);
    map.canvas.rotate(radians(angle));
    
    map.canvas.fill(200);
    map.canvas.rect(0, 0, paredWidth*mult, paredDepth*mult);
    map.canvas.popMatrix();
  }

  boolean MouseOver() {
    if (map.cmouse.x/mult > posX-paredWidth/2 &&
        map.cmouse.x/mult < posX+paredWidth/2 &&
        map.cmouse.y/mult > posY-paredDepth/2 &&
        map.cmouse.y/mult < posY+paredDepth/2){
      super.checkOver = true;
      return true;
    }
    super.checkOver = false;
    return false;
  }

  public String imprimir() {
    return "Pared" + "|" + name + "|" + posX + "|" + posY + "|" + angle + "/";
  }
}
