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

class ParticleSystem extends AnimatorObject {
  int nbPart;
  Particle2D[] particle;

  public ParticleSystem() {
    nbPart = 2000;
    particle = new Particle2D[nbPart];
    for (int i = 0; i < particle.length; i++)
      particle[i] = new Particle2D();
  }

  // Define here your animation.
  @Override
  public void animate() {
    for (int i = 0; i < nbPart; i++)
      if (particle[i] != null)
        particle[i].animate();
  }
}
