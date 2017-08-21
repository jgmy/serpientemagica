// MAGIC SERPENT - THAT TOY CONSISTENT ON SMALL PRISMS JOINED BY THEIR SQUARE FACES-
//Probando a hacer triángulos para la serpiente mágica
//La serpiente tiene 24 triángulos (12 verdes y 12 blancos)
//cada triángulo: rotateX (HALF_PI), rotateY(PI), translate (200,0,0).
//(suponiendo el tamaño 100);

boolean debugging=false;
Prisma verde,verdeH;
Prisma blanco,blancoH;
int anguloprisma[]={
    1,-1,1,-1,
    -1,1,-1,1,
    1,-1,1,-1,
    -1,1,-1,1,
    1,-1,1,-1,
    -1,1,-1,1
} /*bola */;
/*int anguloprisma[]={
    0,0,0,0,0,0,
    0,0,0,0,0,0,
    0,0,0,0,0,0,
    0,0,0,0,0,0
} ; //recto 
*/
int iprisma=0;
class Prisma{
  public PShape shape;
  PShape prism;
  PShape quads;
  PShape triangles;
  public color Pcolor;
  public color Pstroke;
    Prisma(color fillColor, color strokeColor){
    Pcolor=fillColor;
    Pstroke=strokeColor;
    prism=createShape(GROUP);
    quads=createShape();
    quads.beginShape(QUADS);
    quads.fill(fillColor);
    quads.stroke(strokeColor);
    quads.vertex(-100,100,-100);
    quads.vertex(100,100,-100);
    quads.vertex(100,-100,-100);
    quads.vertex(-100,-100,-100);
    ////base2;
    quads.vertex(-100,-100,-100);
    quads.vertex(-100,-100,100);
    quads.vertex(-100,100,100);
    quads.vertex(-100,100,-100);
    //rectángulo hipotenusa
    quads.vertex(100,100,-100);
    quads.vertex(-100,100,100);
    quads.vertex(-100,-100,100);
    quads.vertex(100,-100,-100);
    quads.endShape(CLOSE);
    
    triangles=createShape();
    //t1
    triangles.beginShape(TRIANGLES);
    triangles.fill(fillColor);
    triangles.stroke(strokeColor);
    triangles.vertex(-100,100,-100);
    triangles.vertex(-100,100,100);
    triangles.vertex(100,100,-100);
    //t2
    triangles.vertex(-100,-100,-100);
    triangles.vertex(-100,-100,100);
    triangles.vertex(100,-100,-100);
    triangles.endShape(CLOSE);
    
    prism.addChild(quads);
    prism.addChild(triangles);    
  }
  void draw(){
    
    shape(prism);
  }
}


void setup(){
  size(1024,768,P3D);
  colorMode(RGB);
  verde=new Prisma(color(0,128,0), color(0,0,0));
  verdeH=new Prisma(color(0,255,0),color(255,255,255));
  
  blanco=new Prisma(color(128,128,128),color(0,0,0));
  blancoH=new Prisma(color(255,255,255),color(0,255,0));
}


float angX=0,angY=0;
float angZ=0;
float tX=0,tY=0,tZ=0;
void draw(){
  int f;
  
 background(80,80,150);
  text (str(angX),10,10);
  text (str(angY),10,30);
  text (str(angZ),10,50);
  text(str(tX),100,10);
  text(str(tY),100,30);
  text(str(tZ),100,50);
    text(str(iprisma),100,70);
  //beginCamera();

    translate(width/2,height/2,-500);
    rotate(TWO_PI*frameCount/360);
    rotateX(TWO_PI*frameCount/360);
    
  for (f=0;f<anguloprisma.length;f++){  
    if (f % 2==0) {
      if (f==iprisma){
        verdeH.draw();
        
      }else {
        verde.draw();
        
      }
    } else {
      if (f==iprisma){
        blancoH.draw();
      }else {
        blanco.draw();
        
      }
    }
    rotateX(-PI);
    rotate(HALF_PI*anguloprisma[f]);
    rotateY(-HALF_PI);
    translate(200.0,0.0,0.0);
    
    
    if (debugging) {
      rotateX (angX*HALF_PI);
      rotateY (angY*HALF_PI);
      rotate(angZ*HALF_PI);
      translate(tX,tY,tZ);
    }
  }
 
 //endCamera();
 }
 
 
 void keyPressed(){
   if (debugging) {
     switch(key){
       case 'X': angX++; break;
       case 'x': angX--; break;
       case 'Y': angY++; break;
       case 'y': angY--; break;
       case 'Z': angZ++; break;
       case 'z': angZ--; break;
       case '+':tZ+=100.0; break;
       case '-':tZ-=100.0;break;
     }
     switch(keyCode){
        case UP:tY+=100.0; break;
        case DOWN: tY-=100.0; break;
        case LEFT: tX-=100.0;break;
        case RIGHT: tX+=100.0;break;
        
     }
   } else {
      switch(keyCode){
        case LEFT: iprisma++; break;
        case RIGHT: iprisma--; break;
        case UP:
          anguloprisma[iprisma]++; 
          if (anguloprisma[iprisma]>4){ anguloprisma[iprisma]=0; }
          break;
        case DOWN:
          anguloprisma[iprisma]--; 
          if (anguloprisma[iprisma]<0){ anguloprisma[iprisma]=3;}
          break;
     }
     if (iprisma<0) iprisma=12;
     if (iprisma>=anguloprisma.length) iprisma=anguloprisma.length-1;
   }
 }