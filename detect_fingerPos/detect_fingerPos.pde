import com.onformative.leap.LeapMotionP5;
import com.leapmotion.leap.Finger;
LeapMotionP5 leap;

//all position is added to "sum"
float sum_x=0,sum_y=0,sum_z=0;
//average of the position of all fingers
float ave_x=0,ave_y=0,ave_z=0;
//"num" means how many fingers leapmotion could detect
int num_fin=0;
  
public void setup() {
  size(700, 700);
  leap = new LeapMotionP5(this);

}

public void draw() {
  background(0);
  fill(255);
  
  for (Finger finger : leap.getFingerList()) {
    PVector fingerPos = leap.getTip(finger);
    ellipse(fingerPos.x, fingerPos.y, 5, 5);
    sum_x=sum_x+fingerPos.x;
    sum_y=sum_y+fingerPos.y;
    sum_z=sum_z+fingerPos.z;
    num_fin=num_fin+1;
  }
  //calclate average of detected finger's average position
  ave_x=sum_x/num_fin;
  ave_y=sum_y/num_fin;
  ave_z=sum_z/num_fin;
  println("num:"+str(num_fin)+" x:"+str(ave_x)+" y:"+str(ave_y)+" z:"+str(ave_z));
  //initialize variable of sum_hoge and ave_hoge
  sum_x=0;
  sum_y=0;
  sum_z=0;
  ave_x=0;
  ave_y=0;
  ave_z=0;
}

//this function is runned when this program stop.
public void stop() {
  leap.stop();
}
