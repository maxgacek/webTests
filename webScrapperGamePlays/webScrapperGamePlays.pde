String plays;
String plays2;

String[] ln;
String[] ln2;

int val = 87;
int val2 = 1580;

void updateStats(boolean load){
  
  if(load)
    ln = loadStrings("https://www.scirra.com/arcade/sports-games/volleyball-5369");
    
    //ln2 = loadStrings("https://www.newgrounds.com");
    
  plays = ln[val];
  //plays2 = ln2[val2];
  
  generateRaport("Volleyball", plays);
  //generateRaport("Fallen Kingdom Classic", plays2);
  
  delay(60000*20);
  updateStats(true);
}

void updateStats(int value){ 
  plays = ln[value];
  
  println("Refreshed...");
}

void setup(){
// size(800,600); 
  
  updateStats(true);

String page = "";

//for (int i=0;i<ln.length;i++) {
//  println(i+"] "+ln[i]);
//  page+=ln[i];
//  }

}


void draw(){
background(0);
  textSize(32);
  text(plays, -500, height/2);
  textSize(15);
  text(val, 25, 25);
  
  //delay(5000);
  
  //updateStats(true);
}

void keyPressed(){
 
  
 if (key == '1'){
  updateStats(val); 
 }
 
 if (key == '5'){
  updateStats(true); 
 }
 
 if (key == 'a')
   val--;
   
 if (key == 'd')
   val++;
}


void generateRaport(String gameName, String plays){
  println(gameName);
  println("Updated...");
  println(day() + "/" + month() + "/" + year() + 
  "   " +hour() + ":" + minute() + ":" + second());
  
  //println(plays);
  
  println(split(plays, "<span>/</span>"));
  println(" ");
  
}