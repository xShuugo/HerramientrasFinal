class MapCanvas {
  PGraphics canvas;
  PVector csize = new PVector(sideBar.x-pad*2, height-pad*5);
  PVector cpos = new PVector(pad, pad*4);  
  PVector ctrans = new PVector(csize.x/2, csize.y/2);
  PVector cmouse;
  PVector d = new PVector();

  Objeto tempObj;
  Objeto overObj;
  int rotRad = 30;
  boolean preview = false;

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

    overObj = null;
    for (Objeto m : data.objeto) {
      m.draw();
      if(m.checkOver) overObj = m;
    }

    if (preview) DrawPreview();
    if(selectedObj != null) DrawGizmo();
    if (mouseOverCanvas()) DrawTool();
    else cursor(ARROW);
  }

  void DrawGizmo(){
    canvas.imageMode(CENTER);
    switch(state){
      case MOVING:
        if(axis == 0) canvas.image(movGizmo[movAxis()], selectedObj.posX*mult+30, selectedObj.posY*mult-30);
        else canvas.image(movGizmo[axis], selectedObj.posX*mult+30, selectedObj.posY*mult-30);
        if(mousePressed){
          canvas.fill(0);
          canvas.text("x: "+selectedObj.posX +"\n"+"y: "+ selectedObj.posY,
            selectedObj.posX*mult,selectedObj.posY*mult+15);
        }
        break;
      case ROTATE:
        if(axis == 0){
          if(rotAxis() == 0) canvas.stroke(25,25,229);
          else canvas.stroke(228,228,25);
        } else canvas.stroke(228,228,25);
        canvas.noFill();
        
        canvas.ellipse(selectedObj.posX*mult,selectedObj.posY*mult,rotRad*2,rotRad*2);
        if(mousePressed){
          canvas.fill(0);
          canvas.text("z: "+selectedObj.angle,
            selectedObj.posX*mult,selectedObj.posY*mult+rotRad+15);
        }
        break;
      case eCHOOSE:
        if(overObj == null) canvas.stroke(66, 192, 255);
        else {
          if(overObj instanceof objEnchufe) canvas.stroke(0, 255, 0);
          else canvas.stroke(255, 0, 0);
        }
        canvas.line(selectedObj.posX*mult,selectedObj.posY*mult,cmouse.x,cmouse.y);
        break;
    }
  }

  int movAxis(){
    if(selectedObj == null) return 0;
    if(cmouse.x > selectedObj.posX*mult &&
       cmouse.x < selectedObj.posX*mult + 22 &&
       cmouse.y > selectedObj.posY*mult - 22 &&
       cmouse.y < selectedObj.posY*mult) return 3;
    else{
      float ang =  -degrees(atan2(
        selectedObj.posX-cmouse.x/mult, 
        selectedObj.posY-cmouse.y/mult));
      if(ang > 80 && ang < 100 &&
        cmouse.x > selectedObj.posX*mult + 22 &&
        cmouse.x < selectedObj.posX*mult + 64) return 1;
      if(ang > -10 && ang < 10 &&
        cmouse.y < selectedObj.posY*mult - 22 &&
        cmouse.y > selectedObj.posY*mult - 64) return 2;
    }
    return 0;
  }

  int rotAxis(){
    if(selectedObj == null) return 0;
    float dis = PVector.dist(cmouse,new PVector(selectedObj.posX*mult,selectedObj.posY*mult));
    if(dis > rotRad-10 && dis < rotRad+10) return 1;
    return 0;
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
        snapPos(tempObj);
        tempObj.draw();
      }
      break;
    case MOVING:
      cursor(movCursor);
      break;
    case ROTATE:
      cursor(rotCursor);
      break;
    case eCHOOSE:
      cursor(CROSS);
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

  void DrawPreview(){
    colorMode(HSB);
    for (int x = 0; x < canvas.width; x++) {
      for (int y = 0; y < canvas.height; y++) {
        int index = x + y * canvas.width;
        
        float sum = 0;
        for (Objeto o:data.objeto) {
          if(o instanceof objLampara){
            objLampara l = (objLampara) o;
            float d = dist(x, y, l.posX*mult+ctrans.x, l.posY*mult+ctrans.y);
            sum += (l.rangoLuz*mult)/(d*10);
          }
        }

        color col = color(
          hue(canvas.get(x,y)),
          saturation(canvas.get(x,y)),
          brightness(canvas.get(x,y))*sum);

        canvas.set(x,y,col);
      }
    }
    colorMode(RGB);
  }

}
