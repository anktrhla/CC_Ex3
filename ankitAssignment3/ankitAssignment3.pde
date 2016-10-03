float x;
float y;
float z;
float r;
int g;
float b;
float t;
float x1 = -50;
float y1;
float x2;
float y2;
float l;
float dropSpeed;


rainDrop[] drop = new rainDrop[500];

void setup () {

  //background (0);
  size (1080, 720);
  for (int i=0; i<drop.length; i++) {

    drop[i] = new rainDrop();
  }
  
}

void draw () {

  //rays
  //stroke(#323FFF);
  //strokeWeight(5);
  //line(x1, y1, x2, y2);
  //if (y2>0){
  //y1++;
  //y2++;
  //}

  //sky

  fill(#A7D2FF); //blue

  //line ();
  rect(0, 0, 1080, 270);

  //sun
  noStroke();
  fill(#eabf41); //yellow color
  ellipse(540, 270, 200, 200); //create outer ellipse
  fill(#F4983B); //lighter orange color
  ellipse(540, 270, 175, 175); //create cascade of ellipses 1, ...2,3
  fill(#EA5138); // medium orange color
  ellipse(540, 270, 150, 150); //2
  fill(#9E3726); //dark orange color
  ellipse(540, 270, 120, 120);//3

  //mountains
  noStroke();
  fill(#402409); //dark brown color
  triangle(0, 270, 540, 270, 270, 0);//1st mountain
  triangle(1080, 270, 810, 0, 540, 270);//2nd mountain
  if (keyPressed){ // create the effect of lightning, everytime a key is pressed, there is lightning
                   //making the color is the mountains a bit lighter.
  fill (#895321); // light brown color
  triangle(0, 270, 540, 270, 270, 0);//1st mountain
  triangle(1080, 270, 810, 0, 540, 270);//2nd mountain
  
  }

  //grass
  noStroke();
  fill(#5EFF7E);
  rect(0, 270, 1080, 720); //create a basic green grassy expanse

  ////river
  //noStroke();
  ////fill(#6698DD);
  //stroke(#6698DD);
  //curve(0, 0, 540, 270, 600, 360, 330, 550);
  //curve(700, 700, 440, 500, 600, 360, 700, 700); 
  //curve(200, 700, 438, 500, 900, 700, 200, 700);

  //bezier(523, 262, 623, 362, 600, 370, 700,420); //curves is not my thing currently; 
  //switching to different pattern.

  //breezy grass
  //if(mousePressed) { //use mouse press to move the grass; commenting it out, grass should be breezy automatically.
  
  fill(#048912); //dark green                                   
  rect(r, 270, 50, 450);
  r += 5; //breezy grass movement

  if (r>width) {
    r = 1;
  }

  //}

  fill(#13BF25);//lighter green
  rect(x1, 270, 50, 450); //breezy trailing grass movement

  x1 += 5;

  if (x1>width) {

    x1 = 1;
    }
    
    //lightning
    //for (y2=0; y2>10; y2++) {
    
      //y2 = random(lightning);
      lightning(); //calling the function void lightning () {...}
    
    
    //}
    
    
    //rain
    for (int i=0; i<drop.length; i++){
      drop[i].rain();
      drop[i].show();
  }
}
//create a function for lightning

void lightning() {

if (keyPressed) {
  //delay(500); tried to create a delay in the flash of light; couldn't!
  background(255);
}

}

//create rain with varied and random amount of drops on the canvas

class rainDrop { // creating a class of drops which directs the property of each drop
  float x;
  float y;
  float l;
  float dropSpeed;
  
  rainDrop() {
  
    x=random (width);
    y=random(-500, -50);
    z=random(0, 20); //create depth of field effect
    l=map(z, 0, 20, 10, 20); //mapping depth of field factor to the size of drops
    dropSpeed=map(z, 0, 20, 1, 20); //mapping dof to drops' speed to create the bigger sized
                                    //drops to move faster and smaller sized drops to move slower.
  }
    void rain(){
     
      y+=dropSpeed; // incrementing the rain of speed according to the depth of field
      
      if (y>height){ // loop back the drops of rain
       
        y=random(-200, -100); //create offset for the rain to loop back from the top
                              //when it reaches the bottom of the canvas.
      }
    }
      void show () {
      
        float thick=map(z, 0, 20, 1, 3); //map thickness of drops to depth of field
        strokeWeight(thick);
        stroke(#0F6CCE); //blue color for the rain
        line(x, y, x, y+l); //using line as a drop; defining variable length of drops.
        
      }
    
    }