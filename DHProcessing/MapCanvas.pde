class MapCanvas {
  PGraphics canvas;
  PVector csize = new PVector(sideBar.x-pad*2, height-pad*5);
  PVector cpos = new PVector(pad, pad*4);  

  PVector ctrans = new PVector(csize.x/2, csize.y/2);
  PVector cmouse;
  

  PVector d = new PVector();
  Objeto tempObj;

  public MapCanvas() {
    csize = new PVector(sideBar.x-pad*2, height-pad*5);
    cpos = new PVector(pad, pad*4);    
    canvas = createGraphics((int)csize.x, (int)csize.y);
  }

  void display() {
    canvas.beginDraw();
    Pan();
    canvas.rectMode(CENTER);
    this.draw();
    canvas.endDraw();
    imageMode(CORNER);
    image(canvas, cpos.x, cpos.y);
  }

  void draw() {
    cmouse = new PVector(mouseX-cpos.x-ctrans.x, mouseY-cpos.y-ctrans.y);
    canvas.background(0);
    canvas.noStroke();
    canvas.fill(150);
    canvas.rect(0, 0, 30*mult, 30*mult);
    DrawGrid();
    for (Objeto m : data.objeto) {
      m.draw();
    }
    if(selectedObj != null) DrawGizmo();
    if (mouseOverCanvas()) DrawTool();
    else cursor(ARROW);
  }

  void DrawGizmo(){
    canvas.imageMode(CENTER);
    switch(state){
      case MOVING: canvas.image(movGizmo, selectedObj.posX*mult+30, selectedObj.posY*mult-30);
    }
  }

  void DrawGrid() {
    canvas.strokeWeight(2);
    canvas.stroke(255, 50);
    canvas.line(15*mult, 0, -15*mult, 0);
    canvas.line(0, -15*mult, 0, 15*mult);
    canvas.strokeWeight(1);
    canvas.stroke(255, 25);
    for (int x=-15*mult;x < 15*mult;x+=5*mult){
      canvas.line(x,-15*mult,x,15*mult);
      canvas.line(-15*mult,x,15*mult,x);
    }
  }

  void DrawTool() {
    switch (state) {
    case DRAWING:
      if (tempObj!=null) {
        tempObj.posX = cmouse.x/mult;
        tempObj.posY = cmouse.y/mult;
        tempObj.draw();
      }
      break;
    case MOVING:
      cursor(movCursor);
      break;
    case ROTATE:
      cursor(rotCursor);
      break;
    }
  }

  void Pan() {
    d.sub(new PVector(mouseX, mouseY));
    if (mousePressed && mouseButton==CENTER) {
      ctrans.sub(d);
      constrainTranslate();
    }

    canvas.translate(ctrans.x, ctrans.y);
    d=new PVector(mouseX, mouseY);
  }

  void constrainTranslate(){
    PVector constr = new PVector(
        constrain((30*mult+10-csize.x)/2, 0, 1000), 
        constrain((30*mult+10-csize.y)/2, 0, 1000));
      ctrans = new PVector(
        constrain(ctrans.x, csize.x/2-constr.x, csize.x/2+constr.x), 
        constrain(ctrans.y, csize.y/2-constr.y, csize.y/2+constr.y));
  }

  boolean mouseOverCanvas() {
    return mouseX >= cpos.x && mouseX <= cpos.x+csize.x &&
      mouseY >= cpos.y && mouseY <= cpos.y+csize.y;
  }
}
