import org.philhosoft.p8g.svg.P8gGraphicsSVG;

P8gGraphicsSVG svg;
PFont displayFont;

JSONObject nikeJSON;

Data[] myData;

void setup() {
  size(1200, 800);
  smooth();

  displayFont = createFont("Arial", 12, true);
  textFont(displayFont, 10);

  svg = (P8gGraphicsSVG) createGraphics(width, height, P8gGraphicsSVG.SVG, "Nike_Fuel_Band_Data.svg");
  beginRecord(svg);
  
  nikeJSON = loadJSONObject("Nike_Fuel_Band_Data.txt");
  JSONArray dataFromJSON = nikeJSON.getJSONArray("data");
  myData = new Data[dataFromJSON.size()];

  for (int i = 0; i < dataFromJSON.size(); i++) {
    //get the object from the array
    JSONObject thisJSONData = dataFromJSON.getJSONObject(i);
    JSONObject metricJSON = thisJSONData.getJSONObject("metricSummary");

    //grab values from the obj, to put in our own object
    int calories = metricJSON.getInt("calories");
    int fuel = metricJSON.getInt("fuel");
    float distance = metricJSON.getFloat("distance");
    int steps = metricJSON.getInt("steps");

    //make our own object, add to array
    Data newData = new Data(calories, fuel, distance, steps);
    myData[i] = newData;
  }
}

void draw() {
  // Call background() only for the visual part, not on the SVG renderer,
  // otherwise it will accumulate them
  // background(#10042C);
  g.background(255);

  svg.clear(); // Discard previous frame
  svg.beginDraw(); // And record this one

  for (int i = 0; i < myData.length; i++) {
    myData[i].draw();
  }


}

void keyPressed()
{
  if (key == 's') // Save the current image (and overwrite the previous one)
  {
    svg.endRecord();
    println("Saved.");
  }
  else if (key == 'r') // Record the current image to a new numbered file
  {
    svg.recordFrame("SineOnBezier-###.svg");
    println("Saved #" + svg.savedFrameCount);
  }
  else if (key == 'q')
  {
    // Don't overwrite the last saved frame!
    svg.clear();
    exit();
  }
}


