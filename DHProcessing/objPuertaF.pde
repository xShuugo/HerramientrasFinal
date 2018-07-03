class objPuertaF extends Objeto {  

  float sizeY = .5;
  float sizeX = 1;

  public objPuertaF(String name, float posX, float posY, float angle) {
    super(name, posX, posY, angle);
  } 

  void draw() {
    super.draw();
    
    map.canvas.pushMatrix();
    map.canvas.translate(posX*mult, posY*mult);
    map.canvas.rotate(radians(angle));
    map.canvas.fill(180, 140, 85);
    map.canvas.rect(0, 0, sizeX*mult, sizeY*mult);
    map.canvas.popMatrix();
  }

  boolean MouseOver() {
    if (offset().x/mult > posX-sizeX/2 &&
        offset().x/mult < posX+sizeX/2 &&
        offset().y/mult > posY-sizeY/2 &&
        offset().y/mult < posY+sizeY/2){
      super.checkOver = true;
      return true;
    }
    super.checkOver = false;
    return false;
  }

  public String imprimir() {
    return "PuertaF" + "|" + name + "|" + posX + "|" + posY + "|" + angle + "/";
  }
}
