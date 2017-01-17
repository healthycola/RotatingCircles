void setup() {
 size(500, 500);
 smooth();
 
 background(0);
}

float realTime = 0;
float timeToCompletePeriod = 250;
int currentColorIndex = 1;
void draw() {
  background(0);
  translate(width/2, height/2);
  realTime++;
  float time = easeInOutExponent(realTime, 2 * PI, timeToCompletePeriod);
  drawLayer1(time, #FFFFFF, 200, 8, 7, 1.0/3.0);
  
  float time2 = easeInOutExponent(realTime, 4 * PI, timeToCompletePeriod);
  drawLayer1(time2, #07689F, 175, 6, 10, 1.0/3.0);
  
  float time3 = easeInOutExponent(realTime, 6 * PI, timeToCompletePeriod);
  drawLayer1(time3, #913175, 150, 4, 12, 1/4.0);
  
  float time4 = easeInOutExponent(realTime, 8 * PI, timeToCompletePeriod);
  drawLayer1(time4, #F2FFDF, 125, 3, 20, 1/10.0);
  //saveFrame("f####.gif");
  if (realTime >= timeToCompletePeriod) {
    realTime = 0;
    exit();
  }
}

void drawLayer1(float time, color col, float radius, float circleRadius, float numberOfCircles, float coefficientOfRadius) {
  float angleStepSize = 2 * PI / numberOfCircles;
  float maxRadius = circleRadius; //getMaxRadius(radius, angleStepSize) / 10;
  fill(col);
  for (float angle = 0; angle < 2 * PI; angle += angleStepSize) {
    float x2 = radius / 2 * cos(angle);
    float y2 = radius / 2 * sin(angle);
    
    float x = radius * coefficientOfRadius * cos(angle + time) + x2;
    float y = radius * coefficientOfRadius * sin(angle + time) + y2;
    drawEllipseWithRadius(x, y, maxRadius);
  }
}

//float getMaxRadius(float radius, float angleStepSize) {
//  return angleStepSize * radius / 2;
//}

void drawEllipseWithRadius(float x, float y, float radius) {
  ellipse(x, y, radius * 2, radius * 2);
}

// Taken from easing library in jquery.
float easeInOutExponent(float t, float period, float timeToCompletePeriod) {
  t /= timeToCompletePeriod/2;
  if (t < 1) {
    return period/2 * pow(2, 10 * (t - 1));
  }
  
  t--;
  return period/2 * (-pow(2, -10 * t) + 2);
}