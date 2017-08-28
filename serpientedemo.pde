// MAGIC SERPENT - THAT TOY CONSISTENT ON SMALL PRISMS JOINED BY THEIR SQUARE FACES-
//This file intends to make an interactive demo of how to make
//patterns with the magic serpent.
// Este archivo es una especie de tutorial para enseñar a hacer 
// figuras con la serpiente mágica.
//


int modeloactual=0;

String definiciones[]={
"Cobra,2,3,0,2,2,0,2,2,0,3,0,0,0,2,3,0,0,0,2,0,0,0,1,0",
"Perro,2,0,2,2,0,2,0,0,0,2,2,0,2,0,0,2,0,2,2,0,0,0,2,0",
"Cruz latina,2,2,0,0,0,2,0,2,2,0,2,0,2,2,0,2,0,2,2,0,2,0,0,0",
"Bola,1,1,1,1,3,3,3,3,1,1,1,1,3,3,3,3,1,1,1,1,3,3,3,3",
"Hueso,1,1,1,1,3,0,0,0,0,0,0,3,1,1,1,1,3,0,0,0,0,0,0,3",
"Cruz rara,1,1,1,1,3,2,0,2,2,0,2,3,1,1,1,1,3,2,0,2,2,0,2,3",
"Roseta,1,1,1,1,3,1,1,3,1,1,1,1,3,1,1,3,1,1,1,1,3,1,1,3"
};



class Modelo {
  public String name;
  public int[] giros;
  Modelo(String definicion){
    String[] datos=split(definicion,",");
    this.giros=int(subset(datos,1));
    this.name=(datos[0]);
    println("New Modelo with name :"+this.name);
    
  }
};
Modelo[] modelos={ };//new Modelo("recto,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0")};

void demoSetup(){
  println("entering demoSetup()");
  
  println("modelos[] initialized");
  for (int f=0;f<definiciones.length;f++){
    /* Esto no parece muy eficiente, pero la referencia dice que
       hay que hacerlo así
    */
    modelos=(Modelo[]) append(modelos,new Modelo(definiciones[f]));
    modelos=(Modelo[]) append(modelos,new  Modelo("recto,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0"));
    println("appending "+definiciones[f]+ " to Modelo ");
  }
  //modelos=subset(modelos,1);
  println("exiting demoSetup()");
}


void demoDraw(){
 println("Entering demoDraw()");
 textSize (2*min (height/25, width/30));
  println("Name is: "+modelos[modeloactual].name);
  centerText(modelos[modeloactual].name,2*min (height/25, width/30));
  textSize (min (height/25, width/30));
  centerText("Press key or button to exit demo",3*min (height/25, width/30));
 
  //Cada 25 frames, damos un paso hacia completar la figura actual.
  if ((frameCount % 25)==0) nextStep();
  
}

void nextStep(){
   println("frame " + str(frameCount) + " entering nextStep");
   if (anguloprisma[iprisma]!=modelos[modeloactual].giros[iprisma]){
     if (anguloprisma[iprisma]> modelos[modeloactual].giros[iprisma]) 
       { anguloprisma[iprisma]--; }  
     else
       { anguloprisma[iprisma]++; }
   } else {
     iprisma++;
     if (iprisma>=modelos[modeloactual].giros.length){
        iprisma=0;
        modeloactual++;
        if (modeloactual>modelos.length) {
          modeloactual=0;
        }
     }
   }
 
 }