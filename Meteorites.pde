
class Meteorite {
  float x = 0.0;
  float y = 0.0;
  float beginX;
  float beginY;
  float distX;
  float distY;
  float endX;
  float endY;
  float speed = 0;
  float pct = 0.0;
  float step = 0.01;
  float exponent = 2;
  int year;
  int mass;
  String mclass;
  
  
  Meteorite(float bx, float by, float ex, float ey, int y, int m, String mc) {
    beginX = bx;
    beginY = by;
    endX = ex;
    endY = ey;  
    distX = endX - beginX;
    distY = endY - beginY;
    year = y;
    mass = m;
    mclass = mc;
   }
   
   void move(){
     
     speed+= 0.05;
     pct += step;
      if (pct < 1.0) {
        x = beginX + (pct * distX);
        y = beginY + (pow(pct, exponent) * distY);
      }
       
   }
   
   boolean landed(){
     if (pct >= 1.0) return true;
     else return false;
   
   }
   
   void display(){
     fill(130);
     ellipse(x,y,2,2);
     
   }
}
   
class Crater{
  PVector pos;
  int mass;
  String type;
  
  Crater (PVector p, int m, String t){
    pos = p.copy();
    mass = m;
    type = t;
  }
}

void loadMeteorites(){
  meteorites = new ArrayList<Meteorite>();
  craters = new ArrayList<Crater>();
  for (TableRow row : table.rows()) {
    int y = row.getInt("year");
    int m = row.getInt("mass");
    String geo = row.getString("GeoLocation");
    String t = row.getString("recclass");
    if (y < year1 || y > year2 ||log10(m) < mass1  || log10(m) > mass2 || geo.indexOf(",") == -1) continue;
    switch (t.substring(0,1)){
      case "H" : if (classH == false) continue;
                 break;
      case "L" : if (t.length()>1) {
                        if (t.substring(1,2).equals("L") && classLL == false) continue;  
                        if (t.substring(1,2).equals("L") == false && classL == false) continue;
                        break;
                        }
                 else if (classL == false) continue;
                 else break;
      default : if (classO == false) continue;
  }
      
    float tpoint = map(y,year1,year2,20,980);
    
    
    float lat = row.getFloat("reclat");
    float lon = row.getFloat("reclong");
    if(lon >= 180 || lon <= -180 || lat <= -60 ||(lat == 0 && lon ==0)) continue; 
    
    float newlat = map(lat,-60,85,402,0);
    float newlon = map(lon,-180,180,0,1000);
    
    meteorites.add(new Meteorite(tpoint,150,newlon,newlat+298,y,m,t));
    msize = meteorites.size();

    }
}