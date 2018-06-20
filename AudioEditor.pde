import controlP5.*;
import ddf.minim.*;
ControlP5 ui;
Minim minim;
AudioPlayer player;
DCanvas Dcanvas;
VCanvas Vcanvas;
LoadFile file;
Data  data;


String name  = "Viva la vida";
int x,y,Shape = 1;
color SColor; 
color c = color(255,255,255);
float r,R,G,B,lx,ly,Size;
PVector dcolor = new PVector(0,0,0);
PGraphics buffer;
enum Day {
  circle,
  square
}

void setup()
{
  size(1024,600);
  minim = new Minim(this);
  player = minim.loadFile("data/audio/Eury.mp3",512);
  
  data = new Data();
  
  
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
   
   ui.addSlider("Size", 1, 60, 1, 40, 250, 210, 25);
   
   ui.getController("R").setValue(R);
   ui.getController("G").setValue(G);
   ui.getController("B").setValue(B);
   
   ui.getController("Size").setValue(Size);
  
  Dcanvas = new DCanvas();
  Vcanvas = new VCanvas();
  
  
  
  //Implementar size
 // size = 50;
  //print("data:",size);
  //
}


void ChargeFile()
{
  

  

  file = new LoadFile();
  file.load();
 

}

void ExportFile()
{

  data.savedata(name,60);
  
}

void ChargeShapeCu()
{
 Shape = 1;
}

void ChargeShapeCi()
{
 Shape = 2;
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

void mouseClicked()
{
   Dcanvas.Press();
   dcolor.set(R,G,B);
   print("data:",Size);
}
