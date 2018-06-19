class Data{
  // data
  //ArrayList<String> data = new ArrayList<String>();  
  ArrayList<Objeto> objeto = new ArrayList<Objeto>();
  
  String superString;
  String[] openString;
  
  // archivo
  PrintWriter file = null;
  String filePath = "";
  
  
  void callback(File file)
  {
    println(file);
  }  
  
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
    selectInput("Seleccione un archivo", "openFile");
  } 
}
