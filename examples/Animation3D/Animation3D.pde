import remixlab.fpstiming.*;

ParticleSystem system;
public TimingHandler handler;

public void setup() {
  size(640, 360, P3D);
  handler = new TimingHandler();
  system = new ParticleSystem(handler);
  smooth();
}

public void draw() {
  background(0);
  pushStyle();
  strokeWeight(3); // Default
  beginShape(POINTS);
  for (int i = 0; i < system.particle.length; i++) {
    system.particle[i].draw();
  }
  endShape();
  popStyle();
  handler.handle();
}

public void keyPressed() {
  if ((key == 'x') || (key == 'X'))
    system.setAnimationPeriod(system.animationPeriod()-2);
  if ((key == 'y') || (key == 'Y'))
    system.setAnimationPeriod(system.animationPeriod()+2);
  if ((key == 'z') || (key == 'Z'))
    system.toggleAnimation();
  if (key == '+')
    system.setParticlesAnimationPeriod(system.particlesAnimationPeriod()-2);
  if (key == '-')
    system.setParticlesAnimationPeriod(system.particlesAnimationPeriod()+2);
  if (key == ' ')
    system.toggleParticlesAnimation();
}