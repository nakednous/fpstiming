/**
 * Non-seq timer based on java.util.Timer and java.util.TimerTask.
 */
class NonSeqTimer implements Timer {
  java.util.Timer timer;
  java.util.TimerTask timerTask;
  Taskable tmnTask;
  boolean runOnlyOnce;
  boolean active;
  long prd;

  public NonSeqTimer(Taskable o) {
    this(o, false);
  }

  public NonSeqTimer(Taskable o, boolean singleShot) {
    runOnlyOnce = singleShot;
    tmnTask = o;
  }

  @Override
  public Taskable timingTask() {
    return tmnTask;
  }

  @Override
  public void create() {
    stop();
    timer = new java.util.Timer();
    timerTask = new java.util.TimerTask() {
      public void run() {
        tmnTask.execute();
      }
    };
  }

  @Override
  public void run(long period) {
    setPeriod(period);
    run();
  }

  @Override
  public void run() {
    create();
    if (isSingleShot())
      timer.schedule(timerTask, prd);
    else
      timer.scheduleAtFixedRate(timerTask, 0, prd);
    active = true;
  }

  @Override
  public void cancel() {
    stop();
  }

  @Override
  public void stop() {
    if (timer != null) {
      timer.cancel();
      timer.purge();
    }
    active = false;
  }

  @Override
  public boolean isActive() {
    return timer != null && active;
  }

  @Override
  public long period() {
    return prd;
  }

  @Override
  public void setPeriod(long period) {
    prd = period;
  }

  @Override
  public boolean isSingleShot() {
    return runOnlyOnce;
  }

  @Override
  public void setSingleShot(boolean singleShot) {
    runOnlyOnce = singleShot;
  }
}
