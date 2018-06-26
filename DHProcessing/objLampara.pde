class objLampara extends Objeto {  

  float diameter = .2;
  float cableLongitud;
  float rangoLuz;
  boolean isOnTable;
  String enchufeInicial;

  public objLampara(String name, float posX, float posY, float angle, float cableLongitud, float rangoLuz, boolean isOnTable, String enchufeInicial) {
    super(name, posX, posY, angle);    
    this.cableLongitud = cableLongitud;
    this.rangoLuz = rangoLuz;
    this.isOnTable = isOnTable;  
    this.enchufeInicial = enchufeInicial;
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
  }

  boolean MouseOver() {
    if(isOnTable)
      if (PVector.dist(
          new PVector(posX, posY),
          new PVector(map.cmouse.x/mult, map.cmouse.y/mult))
          < diameter/2){
        super.checkOver = true;
        return true;
      }
    else 
      if (map.cmouse.x/mult > posX-1/2 &&
          map.cmouse.x/mult < posX+1/2 &&
          map.cmouse.y/mult > posY-1/2 &&
          map.cmouse.y/mult < posY+1/2){
        super.checkOver = true;
        return true;
      }
    super.checkOver = false;
    return false;
  }

  public String imprimir() {
    return "Lampara" + "|" + name + "|" + posX + "|" + posY + "|" + angle + "|" + cableLongitud + "|" + rangoLuz + "|" + isOnTable + "|" + enchufeInicial + "/";
  }        
  void createProperties() {
    super.createProperties();

    propBar = new PVector(propBar.x, propBar.y+pad*3);

    prop.addTextlabel("lblCableLongitud").
      setText("Longitud de Cable:"). 
      setPosition(propBar.x, propBar.y+7).
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
      setPosition(propBar.x, propBar.y+7).
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
      setPosition(propBar.x, propBar.y+7).
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
      setPosition(propBar.x, propBar.y+7).
      setColorValue(color(255, 255, 255)); 

    prop.addTextfield("txtEnchufeInicial").
      setLabel("").
      setPosition(propBar.x+130, propBar.y).
      setSize(60, pad*2).
      setText(enchufeInicial).
      setAutoClear(false);
  }

  void checkTextFields() {
    if (prop.get(Textfield.class, "txtCableLongitud")!=null)
      cableLongitud = int(float(prop.get(Textfield.class, "txtCableLongitud").getText()));

    if (prop.get(Textfield.class, "txtRangoLuz")!=null)
      rangoLuz = int(float(prop.get(Textfield.class, "txtRangoLuz").getText()));

    if (prop.get(Textfield.class, "txtEnchufeInicial")!=null)
      enchufeInicial = prop.get(Textfield.class, "txtEnchufeInicial").getText();

    if (prop.get(CheckBox.class, "cbIsOnTable")!=null)
      isOnTable = prop.get(CheckBox.class, "cbIsOnTable").getState(0);    
    //isOnTable = !isOnTable;
    println("?");
    println(prop.get(CheckBox.class, "cbIsOnTable"));
  }
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
