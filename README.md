FPSTiming
=========

# Description

FPS-based timing.

Timing handler holding a pool of single-threaded timers and a pool of animator objects.

# Key features

* *Tested* under Linux, Mac OSX and Windows, and properly works with the JAVA2D, P2D and P3D **Processing** renderers. No special dependencies or requirements needed (apart of course from [Processing-2.x](http://processing.org/ Processing-1.5.1)).
* It supports all major **Processing** flavours: [Desktop](https://github.com/remixlab/proscene), [Android](https://github.com/remixlab/proscene.droid) and (soon) JS.
* API design that provides seemless integration with **Processing**, and allows extensibility of its key features.
* Remarkably-simple, tiny memory footprint sequential timing.
* It provides _single-threaded timers_, offering a replacement of [java util timers](http://docs.oracle.com/javase/7/docs/api/java/util/Timer.html) which require multi-threading.
* Compatible with [gwt jre emulation](http://www.gwtproject.org/doc/latest/RefJreEmulation.html) which is required by our JS port. 
* It provides _timing-tasks_ which may be scheduled for one-time execution, or for repeated execution at regular intervals.
* Animation framework.
* Handy set of complete documented [examples](https://github.com/nakednous/fpstiming/wiki) that illustrates the use of the package.
* A complete [reference documentation](http://otrolado.info/fpstimingApi/).
* Active support and continuous discussions led by the [Processing community](http://forum.processing.org/two/).
* Last but not least, released as free software under the terms of the [GPL-v3](http://www.gnu.org/licenses/gpl.html).

# Usage

Usage is simple:

1. Instantiate a [TimingHandler](http://otrolado.info/fpstimingApi/remixlab/fpstiming/TimingHandler.html).
2. Declare/schedule some [timing tasks](http://otrolado.info/fpstimingApi/remixlab/fpstiming/TimingTask.html) and [register](http://otrolado.info/fpstimingApi/remixlab/fpstiming/TimingHandler.html#registerTask(remixlab.fpstiming.TimingTask)) them at the _TimingHandler_.
3. Implement your [animator objects](http://otrolado.info/fpstimingApi/remixlab/fpstiming/AnimatorObject.html) and [register](http://otrolado.info/fpstimingApi/remixlab/fpstiming/TimingHandler.html#registerAnimator(remixlab.fpstiming.Animator)) them at the _TimingHandler_.
4. Attach a call to [handle()](http://otrolado.info/fpstimingApi/remixlab/fpstiming/TimingHandler.html#handle()) at the end of your main event (drawing) loop.

# Installation

Download it [here](https://github.com/nakednous/fpstiming/releases/download/v-1.0.0/fpstiming-1.0.0.zip) and extract it to your sketchbook `libraries` folder.

For detailed Processing third party library installation instructions check [here](http://wiki.processing.org/w/How_to_Install_a_Contributed_Library#Manual_Install).

**Note** that **FPSTiming** provides timing handling to [Proscene-2](http://nakednous.github.io/projects/proscene/) and is packaged along side with it.
This *stand-alone* release is thus incompatible with [Proscene-2](http://nakednous.github.io/projects/proscene/). If you've already installed
[Proscene-2](http://nakednous.github.io/projects/proscene/) you don't need to install **FPSTiming**, but can just try the [examples](https://github.com/nakednous/fpstiming/tree/master/examples).
Otherwise, you may uninstall [Proscene-2](http://nakednous.github.io/projects/proscene/) first and then install ***FPSTiming**.

# Documentation

* [Wiki](https://github.com/nakednous/fpstiming/wiki) containing a tutorial.
* [API](http://otrolado.info/fpstimingApi) which is also available with the release zip file.

# Author, core developer and maintainer

[Jean Pierre Charalambos](http://disi.unal.edu.co/profesores/pierre/), [National University of Colombia](http://www.unal.edu.co)