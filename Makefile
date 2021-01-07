# GNU Make Makefile

# the name of your source ascii doctor files
SRC=resume.adoc

# the output files
DOCS=resume.html resume.pdf resume.docx

# name of your docker image with ascii doctor installed
DCON=alpdoc

# the shared directory path between the host and the docker image
# this should match WORKDIR and VOLUME in Dockerfile
DOCDIR=/docs

DIR := ${CURDIR}

all: $(DOCS)

resume.html: $(SRC) *.adoc
	podman run -it -v $(DIR):$(DOCDIR)/:z $(DCON)     asciidoctor $(SRC)

resume.pdf: $(SRC) *.adoc
	podman run -it -v $(DIR):$(DOCDIR)/:z $(DCON) asciidoctor-pdf $(SRC)

resume.xml:
	podman run -it -v $(DIR):$(DOCDIR)/:z $(DCON) asciidoctor --backend docbook $(SRC)

resume.docx: resume.xml
	podman run -it -v $(DIR):$(DOCDIR)/:z $(DCON) pandoc --from docbook --to docx resume.xml --output resume.docx

image:
	podman build -t alpdoc .

.PHONY: clean

clean:
	rm -f *.pdf *.html *.xml *.docx

dockerclean:
	-podman rm $(shell podman ps -aq)
	-podman rmi $(shell podman images -q)
