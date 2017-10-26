import controlP5.*;


ControlP5 cp5;
PImage bkgr, map;
Table table;
ArrayList<Meteorite> meteorites;
ArrayList<Crater> craters;
float time;
float start_time;
int msize;
int year1;
int year2;
int mass1;
int mass2;
Boolean classH;
Boolean classL;
Boolean classLL;
Boolean classO;
Range yrange;
Range mrange;
Toggle tH;
Toggle tL;
Toggle tLL;
Toggle tO;

void setup()
{
  size(1000,700);
  bkgr = loadImage("background.png");
  noStroke();
  map = loadImage("map.png");
  time = 0;
  start_time = 0;
  year1 = 1990;
  year2 = 2000;
  mass1 = 0;
  mass2 = 8;
  classH = true;
  classL = true;
  classLL = true;
  classO = true;
  
  
  
  table = loadTable("meteorite_landings.csv", "header");
  table.sort("year");
  
  
  
  loadMeteorites();
  loadUI();
  
  
  
}

void draw()
{
  background(bkgr);
  image(map,0,298);
  
  stroke(255);
  line(20,150,980,150); //timeline
  noStroke();
  fill(255, 255, 255);
  textSize(15);
  text(year1, 20, 130);
  text(year2, 960, 130);
  
  
    for (int c = craters.size()-1; c >= 0; c--){
      
      noStroke();
      float m = 0;
      String t = craters.get(c).type;
      if(t.substring(0,1).equals("H")) fill(192,0,0,80);
      else if (t.substring(0,1).equals("L")){
        if (t.length() > 1) if (t.substring(1,2).equals("L")) fill(0,0,192,80);
        else fill(0,192,0,80);
      }
      else fill(192,0,192,80);
      if (log10(craters.get(c).mass)> 5) m= 20;
      else m = map(log10(craters.get(c).mass),0,5,1,10);
      
       
      ellipse(craters.get(c).pos.x,craters.get(c).pos.y,m,m);
    }
      
   for (int i = 0; i <= meteorites.size()-1;i++){
     Meteorite m = meteorites.get(i);
          
     
     time = map(i, 0,msize,3000,50000);
     if (millis() > start_time+time) {
       m.move();
       if (m.year != year1 && m.year != year2 && m.y - m.beginY <= 1) text(m.year, m.beginX,130);

       
     }
     m.display();
     if (m.landed()){
       meteorites.remove(i);
       craters.add(new Crater(new PVector(m.endX,m.endY),m.mass,m.mclass));
       
     
     }
     
     
     
     
     
  }
  
  

 
}


float log10 (int x) {
  return (log(x) / log(10));
}







  
  
  