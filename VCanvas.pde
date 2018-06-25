class VCanvas
{ 
  PGraphics buffer;
  color c = color(255,255,255);
  
  public VCanvas()
  {
   buffer = createGraphics(1000,150);
  }
  
   void draw()
   {

  buffer.beginDraw();
  buffer.background(c);

  buffer.ellipse(mouseX-12,mouseY-50,50,50);
 
   lineOne = map(Time, 0, player.length(), 0, buffer.width);
   lineTwo = map(Time+Range, 0, player.length(), 0, buffer.width);
   
   
  // float coso = 0;
//   float map = map(mouseX, 0, rango, 0, 18);
  buffer.stroke(255,153,0);
  
   float t = 0;
  if(vrango != 0)
  {
     t = 1000 / 195.0;// preguntar al profe   :,v
    
    // print("t:, "+t);
  }
  
  for (int i = 0; i <= vrango; i++)
  {
    
    
 //  float t = map(1000, 0, player.length(), 0, buffer.width);
  //print("t:, "+t);
   buffer.line(t * i, 0, t * i, height); // columnas
    
  }
   for (int i = 0; i <= 7; i++)
  {
    
    buffer.line(0, 22 * i , width, 22 * i  );  // filas
  }
  



   
   buffer.stroke(0,200,0);
   buffer.line(lineOne, 0,lineOne, height);
   buffer.stroke(255,5,5);
   buffer.line(lineTwo, 0, lineTwo, height);
   buffer.endDraw();
   image(buffer,12,50);
   Time();
   
 
  
   
   
   }
   // Crear linia de tiempo 20/06/18
   /*
   void DrawVisual()
   {
     for(int i = 0; i < player.bufferSize() - 1; i++)
        {
       float x1 = map( i, 0, player.bufferSize(), 0, width );
       float x2 = map( i+1, 0, player.bufferSize(), 0, width );
       buffer.beginDraw();
       
       buffer. line( x1, 50 + player.left.get(i)*50, x2, 50 + player.left.get(i+1)*50 );    
       buffer.endDraw();
        }
        

   }
   */
    void Time()
    {
 
    rango = (Math.round(Range))/1000; 
    vrango = (Math.round(player.length()))/1000; 
   // print("vrango:, "+ vrango);

    }
    
    float lastPos = 0;
    
    /*
    void update()
    {
       if(buffers.ShapePoints.size()>0)
            {
             for(int i = 0; i < buffers.ShapePoints.size(); i++)
              {
               
                float[] data = new float[7];
                data = buffers.ShapePoints.get(i).getData();
                 lastPos = data[7];
                 if(lastPos>Time && lastPos <Range)
                 {
                  new ShapeCreator(lx,ly,Shape,Size,dcolor,x1);
                 }
              }
             
            }
    }
   */
}
