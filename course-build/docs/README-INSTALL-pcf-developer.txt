System Requirements
-------------------

* 2GHz CPU or better
* At least 2 GB of memory, 4G preferred
* At least 1.5 GB of free disk space
* Internet access is only required for the initial setup, and not during the training.
  But a recent web-browser must be available and able to view local HTML files
  and provide access to Tomcat running on localhost port 8080 and 9000, including
  the ability to select, cut and paste regions of text.
* A PDF reader such as Acrobat
* Internet access for the trainer is required.


Courseware Installation Instructions
------------------------------------
1) A recent version of a modern Web Browser is required, such as Firefox, Chrome or
Safari. Microsoft Internet Explorer is not recommended - it doesn't work well with the
PCF Apps MAnager.  If you wish to use IE, please ensure it is the most resent version
(Microsoft Edge or Internet Explorer 11).

You can download the latest version of Chrome or Firefox here:
* http://www.mozilla.org/en-US/firefox/new/
* https://www.google.com.au/intl/en/chrome/


2) Install the JDK

JDK 8 must be installed. Note that a full JDK is required; a JRE is not sufficient.

Please note also that Java 8 is REQUIRED for this course. Although Spring 4 supports
older versions of Java, this course uses Java 8 features like lambda expressions.

On MS Windows: the 32 bit JDK and 32-bit course installer can be installed and run
on 64-bit Windows.  What matters is that the two match.

If needed, a Jave SE JDK for your platform can be downloaded from here:

* http://www.oracle.com/technetwork/java/javase/downloads/index.html

Make sure JAVA_HOME is set in your environment.


3) Installation Instructions

You should hav been given:

pcf-developer-XXX.RELEASE-student-handout.pdf  - Copies of the presentation slides
pcf-developer-XXX.RELEASE-lab-docs.pdf         - Lab instructions in PDF
pcf-developer-XXX.RELEASE-lab-docs.zip         - Lab instructions in PDF
pcf-developer-XXX.RELEASE-labs.zip             - Lab applications

where XXX is the version of the course you have been given.

Create the directory pivotal-cloud-foundry-developer-workshop in your home directory.

Extract the contents of pcf-developer-XXX.RELEASE-labs into this directory.

If you wish to use the HTML documentation, unpack pcf-developer-XXX.RELEASE-lab-docs.zip
somewhere convenient - such as on your Desktop and open index.html.  It provides links
to all the labs.  The HTML documentation supports copy and paste, the PDF does not.
Otherwise they are identical.


See also the setup instructions in the lab-instructions PDF.
