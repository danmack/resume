# My Resume as Code

The following is a "port" of my Resume to AsciiDoctor.

## Why?

This is an example of how to modularize your resume into separate
files and show how it can be kept under revision control.  As an added
benefit, multiple output formats can be generated from the same input
and my friends can send me pull requests :-)

This is not a new thing or my idea. Computer literate folks who used
UNIX-like systems way back in the 1980s, maybe earlier, kept versions
of their CV in TeX or ROFF format and I suspect many of them even used
RCS or SCCS to version them.

## How?

AsciiDoctor as well as most WSIWYG type document generators require a
lot of boiler plate and dependencies.  For that reason, it is best to
use a container to compartmentalize this attack surface and dependency
cesspool away from your normal desktop, laptop, or server.

Included in this repo are the source files for my resume and the
Docker environment which contains the asciidoctor runtime.

  1. have docker/docker engine installed
  1. build the docker container using my Makefile
  2. type make

For example, on macOS:

    % make dockerimg
    % make
    docker run -it -v /Users/mack/src/resume:/docs/ alpdoc     asciidoctor resume.adoc
    docker run -it -v /Users/mack/src/resume:/docs/ alpdoc asciidoctor-pdf resume.adoc
    % open resume.html

You can find a rendered version of the output on my home page below:

  https://macktronics.com/resume.html
