Table table;
float K = 4;
int allX;
void setup(){
  table = loadTable("kuznia.csv", "header");
  allX = table.getRowCount();
  size(1024,612);
  background(0);
  stroke(255);
  strokeWeight(2);
  
  //println(table.getRowCount() + " total rows in table");

  updateTable();
}


int textMargin = 5;
float scrollX = 0;

void updateTable(){
  clear();
  float lastX = 0;
  float lastY = height;

  for (int i = 0; i < allX; i++){ 
    
  float y = table.getInt(i,1);
  String text = table.getString(i,0);
  
  float x = K * i;
  y = K * y/2;
  
  textSize(12);
  
  //println(y);
  
  
  
  line(lastX + scrollX,lastY ,x + scrollX,height - y);
  
  if(y > 70)
  displayText(text, x, y);
   
  
  if(y > 50 && y < 70 && (floor(x)%2 == 0))
  displayText(text, x, y);
  
  lastX = x;
  lastY = height - y;
  
  //point (x,height - y);
  
  }   
}

void keyPressed(){

 
 updateTable();
}

void draw(){
 updateTable();
 
 if (keyPressed){
   
  if (key == 'd'){
   scrollX-= 5;
   updateTable();
  }
  
  if (key == 'a'){
   scrollX+= 5;
   updateTable();
  }
  
   if (key == 'w'){
   K+= 0.1;
   updateTable();
 }
 
 if (key == 's'){
   K-= 0.1;
   if(K < 0)
   K = 0.1;
   
   updateTable();
 }
 } 
}

void displayText(String Text, float x, float y){
  String text = Text;
   text(text, x - textMargin + scrollX , (height - y) - textMargin);
}