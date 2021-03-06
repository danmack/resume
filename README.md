# My Resume as Code

The following is a "port" of my Resume to AsciiDoctor.  It converts
asciidoc documents into html, pdf, and Microsoft Word (docx) files.

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

AsciiDoctor as well as most WYSIWYG type document generators require a
lot of boiler plate and dependencies.  For that reason, it is best to
use a container to compartmentalize this attack surface and dependency
cesspool away from your normal desktop, laptop, or server.

Included in this repo are the source files for my resume and the
Open Container Initiative (OCI) environment which contains the asciidoctor
runtime.

  1. have OCI tools installed (e.g. podman)
  1. build the container using the included [Makefile](./Makefile)
  2. type make

## Workflow Examples

CentOS/RedHat/Fedora:

    % make image
    % make
    % xdg-open resume.html

macOS:

    % make dockerimg
    % make
    podman run -it -v /home/mack/src/resume:/docs/:z alpdoc     asciidoctor resume.adoc
    podman run -it -v /home/mack/src/resume:/docs/:z alpdoc asciidoctor-pdf resume.adoc
    podman run -it -v /home/mack/src/resume:/docs/:z alpdoc asciidoctor --backend docbook resume.adoc
    podman run -it -v /home/mack/src/resume:/docs/:z alpdoc pandoc --from docbook --to docx resume.xml --output resume.docx

    % open resume.html

You can find a rendered version of the output on my home page below:

  https://macktronics.com/resume.html

If you just want to borrow my recipe for using asciidoctor with a
Makefile and a container image, I have just those bits in a separate
repository here:

  https://github.com/danmack/ascii-easydocker

Hope you find this useful.

