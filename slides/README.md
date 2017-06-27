# Slides Directory

The presentation slides go in here.

## Formats

Open Office Impress of Microsoft Office Powerpoint are both supported.

**Notes**

1. Even if you use MS Office, Open Office needs to be installed (the
   build uses it to convert these slides into PDFs)
1. All PowerPoint slides must be in PPT format, not PPTX (Open Office
   does not currently supprot PPTX very well)

The completed slideset is provided as the basis for the final slideset in your course.
Customise it to:

1. Detail Certification (if available)
1. List relevant related courses
1. Show support and consulting offerings
1. Mostg important - the link to the feedback form for each Region.

## Numbering

To make managing many presentations easier, we recommend numbering them, but skip
odd numbers, so you can insert a new presentation without renumbering.  If there
are natural groupings of slides, number them 10,12,14,20,22,24, ... and so on.

**Note:** The actual order and number of the presentations in the built course is
determined by the `modules.xml`. The slides will be renumbered according to the
`<section>` definitions in this file.

It is also recommended to use a course speific prefix. For example files in the
Core Spring course use the `cs` prefix - for example `02-cs-spring-intro.odp`,
`04-cs-javaconfig-di.odp` and so forth.

This makes it easier if you need to create a custom course pulling in slides from other
courses and ensures no two presentations has the same name. By default, if it finds
duplicates, the build will use the first presentation it finds and ignore the other.

