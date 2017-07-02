# Building the Course

## Understanding the Common Build

The build files in this course are configured to use the `common-build` project.

> _Note:_ when you clone your _first_ course, you have to setup the `common-build`  manually.  This is
>  a _one-time_ step and will then work for _all_ courses using the `common-build`, not just this one.
> _It is no longer necessary to use git submodules at all_.

The crucial property is `course.build.dir`.  This must point to `common-build` (which it  __cannot__ do by
default since it will be different for every user).


## Setting up common-build

There are just a few steps:

  1. Clone `common-build` in the usual way `git clone https://github.com/S2EDU/common-build`
  2. If you don't have one already, create `build.properties` in your _home_ directory
  3. Edit the file and add a new property called `course.build.dir` and set it to the absolute path of the `common-build` directory created on your machine in step (1)

A suitable starting point for your own `build.properties` is [common-build/your-build.properties]
(https://github.com/S2EDU/common-build/blob/master/your-build.properties).

### Pre-requisites
There are a few dependencies that need to be satisfied before using this common build process.

* Ant - The core of the build process uses Ant. Either install by downloading from the [Apache Ant](http://ant.apache.org/) site or if using a Mac with brew, simply issue the command ```brew install ant```
* Maven - Some projects will use Maven to build the lab files. You can get this either from the [Apache Maven ](http://maven.apache.org/) site or using brew on the Mac ```brew install maven```
* Open Office - Open Office is used to run in the background for converting slides to PDF and converting docbook format to PDF. This has recently become an Apache Open Source project as well and can be found at the [Open Office](https://www.openoffice.org/) site.

## Using the Build

Full details on how to build the course: [common-build/USING-BUILD.md]
(https://github.com/S2EDU/common-build/blob/master/USING-BUILD.md).

Understanding `modules.xml`: [common-build/MODULES-README.md]
(https://github.com/S2EDU/common-build/blob/master/MODULES-README.md).

Quick help on Docbook: [common-build/DOCBOOK-HELP.md]
(https://github.com/S2EDU/common-build/blob/master/DOCBOOK-HELP.md).




