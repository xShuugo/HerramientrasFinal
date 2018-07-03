void createButtons() {

  sb = new ControlP5(this);
  prop = new ControlP5(this);
  ui = new ControlP5(this);

  //TOOLBAR  

  ui.addButton("newMap").
    setPosition(pad, pad).
    setSize(60, pad*2).
    setLabel("Nuevo");

  ui.addButton("openFile").
    setPosition(pad+ui.get("newMap").getWidth()+5, pad).
    setSize(60, pad*2).
    setLabel("Abrir");

  ui.addButton("exportFile").
    setPosition(pad+ui.get("newMap").getWidth()+ui.get("openFile").getWidth()+5*2, pad).
    setSize(75, pad*2).
    setLabel("Guardar");
    
  ui.addButton("exportComo").
    setPosition(pad+ui.get("newMap").getWidth()+ui.get("exportFile").getWidth()+5*15, pad).
    setSize(75, pad*2).
    setLabel("Guardar Como");

  ui.addButton("lightPreview").
    setPosition(width-pad*2-160, pad).
    setSize(80, pad*2).
    setLabel("Visualizar");

  ui.addButton("generateObject").
    setPosition(width-pad-80, pad).
    setSize(80, pad*2).
    setLabel("Generar");

  ui.addButton("moveObject").
    setPosition(width-pad-260, pad*4).
    setSize(45, pad*2).
    setLabel("Mover");  

  ui.addButton("rotateObject").
    setPosition(width-pad-205, pad*4).
    setSize(45, pad*2).
    setLabel("Rotar");

  objectList = ui.addDropdownList("objectList").
    setPosition(width-pad-150, pad*4).
    setLabel("Agregar Objeto").
    setSize(150, 150).
    setBarHeight(pad*2).    
    setItemHeight(20).
    addItem("Mesa", 1).
    addItem("Lampara", 2).
    addItem("Pared", 3).
    addItem("Fosforos", 4).
    addItem("Enchufe", 5).
    addItem("Cajafuerte", 6).
    addItem("Nota", 7).
    addItem("PuertaF", 8).
    setOpen(false); 

  createSideBar();
}

void createSideBar() {
  //SIDEBAR
  sideBar = new PVector(width-pad-260, pad*7);
  
  for (ControllerInterface c : sb.getAll())
    sb.remove(c.getName());

  sb.addTextlabel("lblLevelName").
    setText("Nombre del Nivel:"). 
    setPosition(sideBar.x, sideBar.y+lblPad).
    setColorValue(color(255, 255, 255));

  sb.addTextfield("txtLevelName").
    setLabel("").
    setPosition(sideBar.x+130, sideBar.y).
    setSize(130, pad*2).
    setAutoClear(false).
    setText(levelName);  

  sideBar = new PVector(sideBar.x, sideBar.y+pad*3);

  sb.addTextlabel("lblPlayerPos").
    setText("Pos. del Jugador:"). 
    setPosition(sideBar.x, sideBar.y+lblPad).
    setColorValue(color(255, 255, 255));

  sb.addTextfield("txtPlayerX").
    setLabel("").
    setPosition(sideBar.x+130, sideBar.y).
    setSize(36, pad*2).
    setText(str(playerPos.x)).
    setAutoClear(false);  
  sb.addTextfield("txtPlayerY").
    setLabel("").
    setPosition(sideBar.x+130+47, sideBar.y).
    setSize(36, pad*2).
    setText(str(playerPos.y)).
    setAutoClear(false);  
  sb.addTextfield("txtPlayerZ").
    setLabel("").
    setPosition(sideBar.x+130+47*2, sideBar.y).
    setSize(36, pad*2).
    setText(str(playerPos.z)).
    setAutoClear(false);  

  sideBar = new PVector(sideBar.x, sideBar.y+pad*3);

  sb.addTextlabel("TitleProp").
    setText("PROPIEDADES"). 
    setPosition((int)((sideBar.x+width)/2-30), sideBar.y).
    setColorValue(color(255, 255, 255));

  createProperties();
}

void createProperties() {
  //print("recreated");
  propBar = new PVector(sideBar.x, sideBar.y+pad*(int)2.5);  
  
  for (ControllerInterface c : prop.getAll())
    prop.remove(c.getName());

  if (selectedObj == null) {
    prop.addTextlabel("temp").
      setText("Seleccione un Objeto en el mapa"). 
      setPosition(propBar.x, propBar.y+lblPad).
      setColorValue(color(255, 255, 255));
  } else {
    selectedObj.createProperties();
  }
}
