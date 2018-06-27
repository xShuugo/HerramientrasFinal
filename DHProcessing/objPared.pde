class objPared extends Objeto {  

  float paredWidth = 4;
  float paredDepth = 0.5;

  public objPared(String name, float posX, float posY, float angle) {
    super(name, posX, posY, angle);
  } 

  void draw() {
    super.draw();

    map.canvas.pushMatrix();
    map.canvas.translate(posX*mult, posY*mult);
    map.canvas.rotate(radians(angle));
    map.canvas.fill(200);
    map.canvas.rect(0, 0, paredWidth*mult, paredDepth*mult);
    map.canvas.popMatrix();
  }

  boolean MouseOver() {
    if (offset().x/mult > posX-paredWidth/2 &&
        offset().x/mult < posX+paredWidth/2 &&
        offset().y/mult > posY-paredDepth/2 &&
        offset().y/mult < posY+paredDepth/2){
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
