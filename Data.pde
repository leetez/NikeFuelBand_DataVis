class Data {
  int calories;
  int fuel;
  float distance;
  int steps;

  Data(int _calories, int _fuel, float _distance, int _steps) {
    calories = _calories;
    fuel = _fuel;
    distance = _distance;
    steps = _steps;
  }

  //array of colors
  color[] yellow = {#FFEB03, #EDDC1F, #D3C62D, #B4AA33, #89823A};
  color[] blue = {#00CEFF, #1AADD8, #0B8CB2, #1A7089, #326776};
  color[] purple = {#BD62FF, #B263EA, #9657C4, #7A45A0, #592381};
  color[] red = {#FF080C, #ED1F23, #DB3336, #C64042, #A24648};

  
  //randomize the colors in the array
  int colorY = (yellow [int (random(1, 5))]);
  int colorB = (blue [int (random(1, 5))]);
  int colorP = (purple [int (random(1,5))]);
  int colorR = (red [int (random(1,5))]);

  float calMap = map(calories, 0, 2000, 0, width);
  float fuelMap = map(fuel, 0, 6500, height, 0);


void draw() {

  stroke(colorR, 75);
  line(width/4*3, steps/48, width/4*4, steps/48);

  fill(colorY, 25);
  stroke(255, 50);
  rectMode(CENTER);
  rect(width/7, height/2, calories/13, calories/13);

  fill(colorB, 25);
  stroke(255, 50);
  ellipse(width/2, height/2, fuel/18, fuel/18);

  fill(255, 25);
  textAlign(CENTER, CENTER);
  textFont(displayFont);
  text("Fuel Points", width/2, height/2);

  fill(255, 25);
  textAlign(CENTER, CENTER);
  textFont(displayFont);
  text("Calories", width/7, height/2);

  fill(#DB3336, 10);
  textAlign(CENTER, CENTER);
  textFont(displayFont);
  text("Steps", width/4*3.5, height/4.65);

  

  // fill(colorP, 25);
  // stroke(255, 50);
  // rectMode(CENTER);
  // ellipse(width/4*3, height/2, calories/8, calories/8);

  
  
  }
  

}

