class ParticleSystem extends AnimatorObject {
  /** The object to handle the animation */
  protected Object animateHandlerObject;
  /** The method in animateHandlerObject to execute */
  protected Method animateHandlerMethod;
  /** the name of the method to handle the animation */
  protected String animateHandlerMethodName;

  int nbPart;
  Particle2D[] particle;

  public ParticleSystem() {
    nbPart = 2000;
    particle = new Particle2D[nbPart];
    for (int i = 0; i < particle.length; i++)
      particle[i] = new Particle2D();
  }

  // animate() is gone

  @Override
  public boolean invokeAnimationHandler() {
    if (animateHandlerObject != null) {
      try {
        animateHandlerMethod.invoke(animateHandlerObject, new Object[] {this});
        return true;
      } 
      catch (Exception e) {
        println("Something went wrong when invoking your " + animateHandlerMethodName + " method");
        e.printStackTrace();
        return false;
      }
    }
    return false;
  }

  public void addAnimationHandler(Object obj, String methodName) {
    try {
      animateHandlerMethod = obj.getClass().getMethod(methodName, new Class<?>[] {ParticleSystem.class});
      animateHandlerObject = obj;
      animateHandlerMethodName = methodName;
    } 
    catch (Exception e) {
      println("Something went wrong when registering your " + methodName + " method");
      e.printStackTrace();
    }
  }

  public void removeAnimationHandler() {
    animateHandlerMethod = null;
    animateHandlerObject = null;
    animateHandlerMethodName = null;
  }

  public boolean hasAnimationHandler() {
    if (animateHandlerMethodName == null)
      return false;
    return true;
  }
}