//make a quadratic formula
float[] quadraticForm(float numberA, float numberB, float numberC) {
  float answers[]= new float[2];
  answers[0] = ((-numberB) + (sqrt((numberB*numberB) - (4* numberA* numberC))))/(2*numberA);
  answers[1] = ((-numberB) - (sqrt((numberB*numberB) - (4* numberA* numberC))))/(2*numberA);
  return answers;
}
//find the initial velocity
float initialVelocity(float vF, float a, float x) {
  float answer;
  answer = sqrt(sq(vF) + (2*a*x));
  return answer;
}
//spam the picture Kappa on the screen
void spamKappaInTheChat() {
  PImage KAPPA;
  PImage KAPPAKID;
  KAPPA = loadImage("KAPPA.png");
  KAPPAKID = loadImage("KAPPAKID2.jpg");
  if (mousePressed) {
    fill(255);
    textSize(40);
    String Kappa = "EVERYBODY SPAM KAPPA IN THE CHAT";
    text(Kappa, 25, 50);
    image(KAPPA, random(800), random(600));
    image(KAPPAKID, 0,100);
  }
}

//size
void setup() {
  size(800, 600);
}
//print the answers for the 2 equations and the command.
void draw() {
  background(0);
  println(quadraticForm(1,2,1));
  println(initialVelocity(1, 0, 0));
  spamKappaInTheChat();
}