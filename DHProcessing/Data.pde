class Data{
  // data
  ArrayList<Objeto> objeto = new ArrayList<Objeto>();
  
  String superString;
  String[] openString;
  
  // archivo
  PrintWriter file = null;
  String filePath = "";
  
  void selectSave(){
    {
      if (filePath != "")
      {
       saveData();
      }
      else
      {
        selectOutput("Select save location", "onOutputSelected");
      }
    }
  }
  
  void saveData()
  {      
    file = createWriter(filePath);
    file.print(superString); 
    file.flush();
    file.close();
  }
  
  void selectFile(){
    selectInput("Seleccione un archivo", "onInputSelected");
  }

  //INTERACTIONS

  Objeto CheckSelection(){
    for(int i = 0;i<objeto.size();i++){
      if(objeto.get(i).MouseOver()){
        return objeto.get(i);}
    }
    return null;
  }
}

void onOutputSelected(File path){
  if(path != null){
    data.filePath = path.getAbsolutePath(); 
    data.saveData();
  }
}

void onInputSelected(File path){
  if(path != null){
    data.filePath = path.getAbsolutePath();    
    data.openString = split(loadStrings(path)[0], "/");
    levelName = data.openString[0];
    
    String[] pos = split(data.openString[1], "|");
    playerPos = new PVector(
      Float.valueOf(pos[0]),
      Float.valueOf(pos[1]),
      Float.valueOf(pos[2]));
    
    createSideBar();

    for(int i = 2; i < data.openString.length; i++){
      String[] objs = split(data.openString[i], "|");    
      switch(objs[0]){
        case "Mesa": data.objeto.add(new objMesa(objs[1], Float.valueOf(objs[2]), Float.valueOf(objs[3]), Float.valueOf(objs[4]))); break;
        case "Lampara": data.objeto.add(new objLampara(objs[1], Float.valueOf(objs[2]), Float.valueOf(objs[3]), Float.valueOf(objs[4]), Float.valueOf(objs[5]), Float.valueOf(objs[6]), Boolean.valueOf(objs[7]), objs[8])) ; break;
        case "Pared": data.objeto.add(new objPared(objs[1], Float.valueOf(objs[2]), Float.valueOf(objs[3]), Float.valueOf(objs[4]))); break;
        case "Fosforos": data.objeto.add(new objFosforos(objs[1], Float.valueOf(objs[2]), Float.valueOf(objs[3]), Float.valueOf(objs[4]), int(Float.valueOf(objs[5])))); break;
        case "Cajafuerte": data.objeto.add(new objCajafuerte(objs[1], Float.valueOf(objs[2]), Float.valueOf(objs[3]), Float.valueOf(objs[4]), objs[5], objs[6], Boolean.valueOf(objs[7]))); break;
        case "Nota": data.objeto.add(new objNota(objs[1], Float.valueOf(objs[2]), Float.valueOf(objs[3]), Float.valueOf(objs[4]), objs[5])); break;
        case "Enchufe": data.objeto.add(new objEnchufe(objs[1], Float.valueOf(objs[2]), Float.valueOf(objs[3]), Float.valueOf(objs[4]))); break;
      }
    }   
  }
}
