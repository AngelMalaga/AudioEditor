class LoadFile
{
JSONObject json;
    LoadFile() 
    {
     json = loadJSONObject("data/export/Test.json");
   }
  
  void load()
  {
     String SongName = json.getString("SongName");
     int Lenght = json.getInt("Lenght");
     
     JSONArray Background = json.getJSONArray("Background");
     JSONArray Level = json.getJSONArray("Level");
   

     for(int i = 0;i < Background.size();i++)
     {
       JSONObject dato = Background.getJSONObject(i); 
        int R = dato.getInt("R");
         int G = dato.getInt("G");
          int B = dato.getInt("B");
         c = color(R,G,B);
        
     }
     
      for(int i = 0;i < Level.size();i++)
     {
       JSONObject dato = Level.getJSONObject(i); 
        int LShape = dato.getInt("Shape");
         int LPosition = dato.getInt("Position");
          int LSize = dato.getInt("Size");
           int LTime = dato.getInt("Time");
           
           Shape = LShape;
           lx = LTime;
           ly = LPosition;
           Size = LSize;
           
      JSONArray Color = dato.getJSONArray("Color"); 
     for(int e = 0;e < Color.size();e++)
     {
       JSONObject datoC = Color.getJSONObject(e); 
        int R = datoC.getInt("R");
         int G = datoC.getInt("G");
          int B = datoC.getInt("B");
          
          dcolor.set(R,G,B);
       
     }
        data.ShapePoints.add(new ShapeCreator(lx,ly,Shape,Size,dcolor));

     }
     
      
     
     

  }
 
}