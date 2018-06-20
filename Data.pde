class Data
{
  
 ArrayList<ShapeCreator>ShapePoints = new ArrayList<ShapeCreator>();

JSONArray bcolor,lcolor,points ;
JSONObject gcolor,rcolor,shape ;
JSONObject json;


 Data()
  {
  
  points = new JSONArray();

  
  }

void savedata(String Nombre,int time)
{
    for(int i = 0; i < ShapePoints.size(); i++)
  {
     temp();
    float[] data = new float[7];
    data = ShapePoints.get(i).getData();
   print("data 4 :::::",data[4]);
   
   
    json.setString("SongName",Nombre);
    json.setInt("Lenght",time);
    
   
     gcolor.setFloat("R",255);
     gcolor.setFloat("G",255);
     gcolor.setFloat("B",255);
     
     
    bcolor.setJSONObject(0,gcolor);
    json.setJSONArray("Background",bcolor);
    
    
     shape.setFloat("Shape",data[2]);
     shape.setFloat("Time",data[0]);
     shape.setFloat("Position",data[1]);
     shape.setFloat("Size",data[3]);
   
     rcolor.setFloat("R",data[4]);
     rcolor.setFloat("G",data[5]);
     rcolor.setFloat("B",data[6]);
     
     lcolor.setJSONObject(0, rcolor);
     shape.setJSONArray("Color", lcolor);
  
     points.setJSONObject(i,shape);
     json.setJSONArray("Level",points);
    
 

     saveJSONObject(json, "data/export/Test.json");
   
    
    
    
     
  }
}
  
  void temp()
  {
      gcolor = new JSONObject();
      shape = new JSONObject();
      rcolor = new JSONObject();
      json = new JSONObject();
      bcolor = new JSONArray();
      lcolor = new JSONArray();
  }

}
