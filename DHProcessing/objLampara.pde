class objLampara extends Objeto {  

  float diameter = .2;
  float cableLongitud;
  float rangoLuz;
  boolean isOnTable;
  objEnchufe enchufeInicial;

  String phEnchName;

  public objLampara(String name, float posX, float posY, float angle, float cableLongitud, float rangoLuz, boolean isOnTable, String enchufeInicialName) {
    super(name, posX, posY, angle);    
    this.cableLongitud = cableLongitud;
    this.rangoLuz = rangoLuz;
    this.isOnTable = isOnTable;  
    this.phEnchName = enchufeInicialName;
    this.enchufeInicial = searchEnch(phEnchName);
  } 

  void draw() {
    super.draw();
    map.canvas.pushMatrix();
    map.canvas.translate(posX*mult, posY*mult);
    map.canvas.rotate(radians(angle));
    if (isOnTable) { 
      map.canvas.fill(99, 83, 52);
      map.canvas.rect(0, 0, mult, mult);
    }

    map.canvas.fill(230, 230, 0);
    map.canvas.ellipse(0, 0, diameter*mult, diameter*mult);

    map.canvas.popMatrix();

    if(enchufeInicial != null){
      float dis = dist(posX,posY,enchufeInicial.posX,enchufeInicial.posY);
      if(dis > cableLongitud) map.canvas.stroke(255,0,0);
      else map.canvas.stroke(66, 192, 255);
      map.canvas.line(posX*mult,posY*mult,enchufeInicial.posX*mult,enchufeInicial.posY*mult);
    }
  }

  objEnchufe searchEnch(String enchName){
    for(Objeto o:data.objeto){
      if(o instanceof objEnchufe){
        objEnchufe e = (objEnchufe) o;
        if(e.name.equals(enchName)) return e;
      }
    }
    return null;
  }

  boolean MouseOver() {
    if(!isOnTable){
      if (PVector.dist(
          new PVector(posX, posY),
          new PVector(
            map.cmouse.x/mult, map.cmouse.y/mult)) < diameter/2){
        super.checkOver = true;
        return true;
        }
    } else {
      if (offset().x/mult > posX-.5 &&
          offset().x/mult < posX+.5 &&
          offset().y/mult > posY-.5 &&
          offset().y/mult < posY+.5){
        super.checkOver = true;
        return true;
        }
    }
    super.checkOver = false;
    return false;
  }

  public String imprimir() {
    String showEnch;
    if(enchufeInicial != null) showEnch = enchufeInicial.name;
    else showEnch = "null";

    return "Lampara" + "|" + name + "|" + posX + "|" + posY + "|" + angle + "|" + cableLongitud + "|" + rangoLuz + "|" + isOnTable + "|" + showEnch + "/";
  }        
  void createProperties() {
    super.createProperties();

    String showEnch;
    if(enchufeInicial != null) showEnch = enchufeInicial.name;
    else showEnch = "Nada escogido";

    propBar = new PVector(propBar.x, propBar.y+pad*3);

    prop.addTextlabel("lblCableLongitud").
      setText("Longitud de Cable:"). 
      setPosition(propBar.x, propBar.y+lblPad).
      setColorValue(color(255, 255, 255)); 

    prop.addTextfield("txtCableLongitud").
      setLabel("").
      setPosition(propBar.x+130, propBar.y).
      setSize(60, pad*2).
      setText(str(cableLongitud)).
      setAutoClear(false); 

    propBar = new PVector(propBar.x, propBar.y+pad*3);

    prop.addTextlabel("lblRangoLuz").
      setText("Rango de Luz:"). 
      setPosition(propBar.x, propBar.y+lblPad).
      setColorValue(color(255, 255, 255)); 

    prop.addTextfield("txtRangoLuz").
      setLabel("").
      setPosition(propBar.x+130, propBar.y).
      setSize(60, pad*2).
      setText(str(rangoLuz)).
      setAutoClear(false); 

    propBar = new PVector(propBar.x, propBar.y+pad*3);

    prop.addTextlabel("lblIsOnTable").
      setText("Esta sobre una mesa ?:"). 
      setPosition(propBar.x, propBar.y+lblPad).
      setColorValue(color(255, 255, 255)); 

    prop.addCheckBox("cbIsOnTable").
      setLabel("").
      setPosition(propBar.x+130, propBar.y+(pad/3)).
      setSize(pad, pad).
      setColorForeground(color(120)).
      setColorActive(color(0, 255, 0)).
      setColorLabel(color(255)).
      addItem("", 0);

    if (isOnTable) prop.get(CheckBox.class, "cbIsOnTable").activate(0);
    else prop.get(CheckBox.class, "cbIsOnTable").deactivate(0);

    propBar = new PVector(propBar.x, propBar.y+pad*3);

    prop.addTextlabel("lblEnchufeInicial").
      setText("Enchufe Inicial:"). 
      setPosition(propBar.x, propBar.y+lblPad).
      setColorValue(color(255, 255, 255)); 

    prop.addTextlabel("lblEnchufeInicialName").
      setPosition(propBar.x+130, propBar.y+lblPad).
      setText(showEnch).
      setColorValue(color(66, 192, 255)); 

    prop.addButton("btnChooseEnch").
      setLabel("Choose").
      setPosition(propBar.x+130+10+60, propBar.y).
      setSize(60, pad*2);
  }

  void checkTextFields() {
    if (prop.get(Textfield.class, "txtCableLongitud")!=null)
      cableLongitud = int(float(prop.get(Textfield.class, "txtCableLongitud").getText()));

    if (prop.get(Textfield.class, "txtRangoLuz")!=null)
      rangoLuz = int(float(prop.get(Textfield.class, "txtRangoLuz").getText()));

    if (prop.get(Textfield.class, "txtEnchufeInicial")!=null)
      enchufeInicial = searchEnch(prop.get(Textfield.class, "txtEnchufeInicial").getText());

    if (prop.get(CheckBox.class, "cbIsOnTable")!=null)
      isOnTable = prop.get(CheckBox.class, "cbIsOnTable").getState(0);    
    //isOnTable = !isOnTable;
    println("?");
    println(prop.get(CheckBox.class, "cbIsOnTable"));
  }
}

void btnChooseEnch(){
  state = ToolState.eCHOOSE;
}

void txtCableLongitud(String value) {
  selectedObj.checkTextFields();
}

void txtRangoLuz(String value) {
  selectedObj.checkTextFields();
}

void txtEnchufeInicial(String value) {
  selectedObj.checkTextFields();
}

void cbIsOnTable(float[] a) {
  selectedObj.checkTextFields();
}
