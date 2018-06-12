import controlP5.*;
import ddf.minim.*;
ControlP5 ui;
Minim minim;
AudioPlayer player;
DCanvas Dcanvas;
VCanvas Vcanvas;

int x,y;

void setup()
{
  size(1024,600);
  minim = new Minim(this);
  player = minim.loadFile("Eury.mp3",512);
  
  ui = new ControlP5(this);
  ui.addButton("ChargeFile")
  .setPosition(40,5)
  .setSize(100,35)
  .setLabel("Cargar archivo");
  
  ui.addButton("ExportFile")
  .setPosition(150,5)
  .setSize(100,35)
  .setLabel("Exportar archivo");
  
  ui.addButton("ChargeShapeCu")
  .setPosition(40,290)
  .setSize(100,35)
  .setLabel("Cuadrado");
  
    ui.addButton("ChargeShapeCi")
  .setPosition(150,290)
  .setSize(100,35)
  .setLabel("Circulo");
  
    ui.addButton("DeleteShape")
  .setPosition(40,500)
  .setSize(100,35)
  .setLabel("Eliminar Figura");
  
   ui.addSlider("R", 0, 255, 0, 40, 336, 210, 25);
   ui.addSlider("G", 0, 255, 0, 40, 366, 210, 25);
   ui.addSlider("B", 0, 255, 0, 40, 396, 210, 25);
   
   ui.addSlider("Tiempo", 1, 60, 1, 40, 250, 210, 25);
  
  
  Dcanvas = new DCanvas();
  Vcanvas = new VCanvas();
}


void ChargeFile()
{
  
}

void ExportFile()
{
  
}

void ChargeShapeCu()
{
  
}

void ChargeShapeCi()
{
  
}

void DeleteShape()
{
  
}


void draw()
{
  background(#BF4545);
  Dcanvas.draw();
  Vcanvas.draw();
  visualDraw();
}

void visualDraw()
{
   for(int i = 0; i < player.bufferSize() - 1; i++)
        {
       float x1 = map( i, 0, player.bufferSize(), 0, width );
       float x2 = map( i+1, 0, player.bufferSize(), 0, width );
       line( x1, 50 + player.left.get(i)*50, x2, 50 + player.left.get(i+1)*50 );    
       
        }
}

void keyPressed()
{
 if(player.isPlaying())
 {
   player.pause();
 }else
 {
  player.play(); 
 }
 
 
}
