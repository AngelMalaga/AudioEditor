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
   // print("Rango" + Time+", "+rango);
    }

}
