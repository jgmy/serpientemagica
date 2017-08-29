// MAGIC SERPENT - THAT TOY CONSISTENT ON SMALL PRISMS JOINED BY THEIR SQUARE FACES-
// A very simple GUI to emulate kay events if
// keys are not available e.g. android.

class Circle {
  public float rad;
  public color col;
  public float x,y;
  public int code;
  public Circle(float xc, float yc, float r, color c, int cod){
    this.rad=r;
    this.x=xc;
    this.y=yc;
    this.col=c;
    this.code=cod;
  }
  public Circle(float xc, float yc, color c, int cod){
    this.rad=width/10;
    this.x=xc;
    this.y=yc;
    this.col=c;
    this.code=cod;
  }
  public Circle(float xc, float yc, float r, int cod){
    this.rad=r;
    this.x=xc;
    this.y=yc;
    this.col=color(96,96,96);
    this.code=cod;
  }
  public Circle(float xc, float yc, int cod){
    this.rad=width/10;
    this.x=xc;
    this.y=yc;
    this.col=color(96,96,96);
    this.code=cod;
  }

  public boolean insideCircle(float xx,float yy){
    return (dist(xx,yy,this.x,this.y)<this.rad);
  }
  public void draw(){
    float a,b,c;
    fill(this.col);
    noStroke();
    ellipse (this.x, this.y, this.rad, this.rad);
    fill(255,255,255);
    stroke(255,255,255);
    switch (this.code){
      case UP:
        a=-1.5;
        break;
      case DOWN:
        a=1.5;
        break;
      case LEFT:
        a=1;
        break;
      case RIGHT:
        a=2;
        break;
      default:
        a=99;
    }
    if (a!=99){
       b=a+2;
       c=a+4;
       triangle(
          this.x+this.rad*cos(a*PI/3)/2,this.y+this.rad*sin(a*PI/3)/2,
          this.x+this.rad*cos(b*PI/3)/2,this.y+this.rad*sin(b*PI/3)/2,
          this.x+this.rad*cos(c*PI/3)/2,this.y+this.rad*sin(c*PI/3)/2
       );
    }
 
    }
}


Circle [] circles={};

void guiSetup(){
  float cr;
  cr=min(width,height)/10;
  
  circles= (Circle[]) append(circles, new Circle(width/2-(cr*1.5),height-cr*2,cr,LEFT));
  circles= (Circle[]) append(circles, new Circle(width/2+(cr*1.5),height-cr*2,cr,RIGHT));
  circles= (Circle[]) append(circles,new Circle(width/2, height-cr*2,cr,UP));
  
}



void guiDraw(){
  int i;
 for ( i=0; i<circles.length; i++){
     circles[i].draw();
 }
}

void mouseClicked(){
  int code=-1;
  for (int i=0; i<circles.length; i++){
     if (circles[i].insideCircle(mouseX,mouseY)){
       code=circles[i].code; 
     }
 }
 if (demo && (code!=-1)){
     demo=false;
 }
 switch(code){
    case LEFT:
      iprisma--; 
      if (iprisma<0) iprisma=anguloprisma.length-1;
     
      break;
    case RIGHT:
      iprisma++; 
      if (iprisma>=anguloprisma.length) iprisma=anguloprisma.length-1;
      break;
    case UP:
      anguloprisma[iprisma]++; 
      if (anguloprisma[iprisma]>=4){ anguloprisma[iprisma]=0; }
      break;
   }
     
  
 }