import com.onformative.leap.LeapMotionP5;
import com.leapmotion.leap.Finger;
LeapMotionP5 leap;

//all position is added to "sum"
float sum_x=0,sum_y=0,sum_z=0;
//average of the position of all fingers
float ave_x=250,ave_y=250,ave_z=-200;
/*Variable to pass the value 
that was able to be obtained the last time when there was no value*/
float ave_x_before=250,ave_y_before=250,ave_z_before=-200;
//"num" means how many fingers leapmotion could detect
int num_fin=0;
//variables for nomalization
float X_min=0;
float X_max=500;
float Y_min=-100;
float Y_max=500;
float Z_min=-800;
float Z_max=500;
//nomalized variables
float x_nomalized;
float y_nomalized;
float z_nomalized;

  
public void setup() {
  colorMode(HSB,100);
  size(500, 500);
  background(0);
  leap = new LeapMotionP5(this);

}

public void draw() {
  background(61,8,100);
  fill(255);
  
  for (Finger finger : leap.getFingerList()) {
    PVector fingerPos = leap.getTip(finger);
    fill(29,169,224,100);
    ellipse(fingerPos.x, fingerPos.y, 10, 10);
    sum_x=sum_x+fingerPos.x;
    sum_y=sum_y+fingerPos.y;
    sum_z=sum_z+fingerPos.z;
    num_fin=num_fin+1;
  }
  //calclate average of detected finger's average position
  ave_x=sum_x/num_fin;
  ave_y=sum_y/num_fin;
  ave_z=sum_z/num_fin;
  //check there is ave_hoge. If not, return previous value.
  if(num_fin==0){
    ave_x=ave_x_before;
    ave_y=ave_y_before;
    ave_z=ave_z_before;
  }
  ave_x_before=ave_x;
  ave_y_before=ave_y;
  ave_z_before=ave_z;
  println("num:"+str(num_fin)+" x:"+str(ave_x)+" y:"+str(ave_y)+" z:"+str(ave_z));
  fill(100,100,100);
  ellipse(ave_x,ave_y,15,15);
  //nomalization
  x_nomalized=ave_x/(X_max-X_min);
  if(x_nomalized>1)x_nomalized=1;
  if(x_nomalized<0)x_nomalized=0;
  y_nomalized=(ave_y+100)/(Y_max-Y_min);
  if(y_nomalized>1)y_nomalized=1;
  if(y_nomalized<0)y_nomalized=0;
  z_nomalized=(ave_z+800)/(Z_max-Z_min);
  if(z_nomalized>1)y_nomalized=1;
  if(z_nomalized<0)z_nomalized=0;
  println("nomalization x_nomali:"+str(x_nomalized)+"y_nomali:"+str(y_nomalized)+"z_nomali:"+str(z_nomalized));
  
  
  //please write your code here!!
  
    //hoge
  
  //end
  
  //initialize variable of sum_hoge and ave_hoge
  sum_x=0;
  sum_y=0;
  sum_z=0;
  ave_x=0;
  ave_y=0;
  ave_z=0;
  num_fin=0;
}

//this function is runned when this program stop.
public void stop() {
  println("program stoped");
  leap.stop();
}
