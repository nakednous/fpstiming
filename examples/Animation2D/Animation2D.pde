import remixlab.fpstiming.*;

ParticleSystem system;
TimingHandler handler;

public void setup() {
  size(640, 360, P2D);
  system = new ParticleSystem();
  handler = new TimingHandler(system);
  system.startAnimation();
  smooth();
}

public void draw() {
  background(0);
  pushStyle();
  pushMatrix();
  translate(width/2, height/2);
  strokeWeight(3); // Default
  beginShape(POINTS);
  for (int i = 0; i < system.particle.length; i++) {
    system.particle[i].draw();
  }
  endShape();
  popMatrix();
  popStyle();
  handler.handle();
}

public void keyPressed() {
  if (key == '+')
    system.setAnimationPeriod(system.animationPeriod()-2);
  if (key == '-')
    system.setAnimationPeriod(system.animationPeriod()+2);
  if (key == ' ')
    system.toggleAnimation();
}
