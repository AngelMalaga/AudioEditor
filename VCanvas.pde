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
 // buffer.ellipse(50,50,30,30);
  buffer.ellipse(mouseX-12,mouseY-50,50,50);
  buffer.endDraw();
  DrawVisual();
  
  image(buffer,12,50);
  
   }
   
   
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
  
}
