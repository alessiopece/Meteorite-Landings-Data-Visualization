void loadUI() {
  
  cp5 = new ControlP5(this);
  yrange = cp5.addRange("Time Range (Years)")
    .setBroadcast(false)
    .setPosition(600,30)
    .setSize(200,15)
    .setHandleSize(20)
     .setRange(1700,2015)
     .setRangeValues(year1,year2)
     .setDecimalPrecision(0)
     // after the initialization we turn broadcast back on again
     .setBroadcast(true)
     .setColorForeground(color(255,60))
     .setColorBackground(color(255,60)) 
      ;
      
    mrange = cp5.addRange("Mass Range (Logarithmic)")
    .setBroadcast(false)
    .setPosition(600,50)
    .setSize(200,15)
    .setHandleSize(20)
     .setRange(0,8)
     .setRangeValues(0,8)
     .setDecimalPrecision(0)
     // after the initialization we turn broadcast back on again
     .setBroadcast(true)
     .setColorForeground(color(255,60))
     .setColorBackground(color(255,60)) 
      ;
      
      
    tH = cp5.addToggle("Class H")
     .setPosition(600,70)
     .setSize(30,10)
     .setValue(true)
     .setColorActive(color(192,0,0))
     .setColorBackground(color(100))
     ;
     
     tL = cp5.addToggle("Class L")
     .setPosition(655,70)
     .setSize(30,10)
     .setValue(true)
     .setColorActive(color(0,192,0))
     .setColorBackground(color(100))
     ;
     
     tLL = cp5.addToggle("Class LL")
     .setPosition(710,70)
     .setSize(30,10)
     .setValue(true)
     .setColorActive(color(0,0,192))
     .setColorBackground(color(100))
     ;
     
     tO = cp5.addToggle("Class Other")
     .setPosition(770,70)
     .setSize(30,10)
     .setValue(true)
     .setColorActive(color(192,0,192))
     .setColorBackground(color(100))
     ;
      
    cp5.addButton("play")
     .setValue(128)
     .setPosition(600,95)
     .setSize(200,20)
     ;





}

public void play(int theValue) {
  year1 =(int) yrange.getLowValue();
  year2 =(int) yrange.getHighValue();
  mass1 =(int) mrange.getLowValue();
  mass2 =(int) mrange.getHighValue();
  classH = tH.getBooleanValue();
  classL = tL.getBooleanValue();
  classLL = tLL.getBooleanValue();
  classO = tO.getBooleanValue();
  start_time = millis();
  loadMeteorites();
  
}