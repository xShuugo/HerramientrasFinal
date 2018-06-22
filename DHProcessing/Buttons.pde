void createButtons(){
  sideBar = new PVector(width-pad-260,pad*6);
  ui = new ControlP5(this);
  ui.setFont(createFont("Calibri", 12));

  //TOOLBAR  

  ui.addButton("newMap").
    setPosition(pad, pad).
    setSize(50,pad*2).
    setLabel("Nuevo");

  ui.addButton("openFile").
    setPosition(pad+ui.get("newMap").getWidth()+5, pad).
    setSize(50, pad*2).
    setLabel("Abrir");

  ui.addButton("exportFile").
    setPosition(pad+ui.get("newMap").getWidth()+ui.get("openFile").getWidth()+5*2, pad).
    setSize(65, pad*2).
    setLabel("Guardar");


  ui.addButton("generateObject").
    setPosition(width-pad-50, pad).
    setSize(50,pad*2).
    setLabel("Generar");
  
  //SIDEBAR

  ui.addTextlabel("lblLevelName").
    setText("NOMBRE DEL NIVEL :"). 
    setPosition(sideBar.x,sideBar.y+7).
    setColorValue(color(255,255,255));

  ui.addTextfield("txtLevelName").
    setLabel("").
    setPosition(sideBar.x+130, sideBar.y).
    setSize(130, pad*2).
    setAutoClear(false);  

  sideBar = new PVector(sideBar.x,sideBar.y+pad*2.5);

  ui.addTextlabel("lblPlayerPos").
    setText("POSICIÓN DEL PLAYER :"). 
    setPosition(sideBar.x,sideBar.y+7).
    setColorValue(color(255,255,255));

  ui.addTextfield("txtPlayerX").
    setLabel("").
    setPosition(sideBar.x+130, sideBar.y).
    setSize(36, pad*2).
    setAutoClear(false);  
  ui.addTextfield("txtPlayerY").
    setLabel("").
    setPosition(sideBar.x+130+47, sideBar.y).
    setSize(36, pad*2).
    setAutoClear(false);  
  ui.addTextfield("txtPlayerZ").
    setLabel("").
    setPosition(sideBar.x+130+47*2, sideBar.y).
    setSize(36, pad*2).
    setAutoClear(false);  

    sideBar = new PVector(sideBar.x,sideBar.y+pad*2.5);

  ui.addTextlabel("TitleProp").
    setText("PROPIEDADES"). 
    setPosition((sideBar.x+width)/2-50,sideBar.y+7).
    setColorValue(color(255,255,255)).
    setFont(createFont("Calibri", 16));;

    sideBar = new PVector(sideBar.x,sideBar.y+pad*2.5);

    createProperties();

    objectList = ui.addDropdownList("objectList").
    setPosition(width-pad-130, pad*4).
    setLabel("Select an object").
    setSize(130, 150).
    setBarHeight(20).    
    setItemHeight(20).
    addItem("Mesa",1).
    addItem("Lampara",2).
    addItem("Pared",3).
    addItem("Fosforos",4).
    addItem("Enchufe",5).
    addItem("Cajafuerte",6).
    addItem("Nota",7).
    setOpen(false); 
}

void createProperties(){
  ControlP5 prop = new ControlP5(this);
  prop.setFont(createFont("Calibri", 12));

  prop.addTextlabel("temp").
    setText("Seleccione un Objeto en el mapa"). 
    setPosition(sideBar.x,sideBar.y+7).
    setColorValue(color(255,255,255));

}