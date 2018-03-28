# GNU Make Makefile

# the name of your source ascii doctor files
SRC=resume.adoc

# the output files
DOCS=resume.html resume.pdf

# name of your docker image with ascii doctor installed
DCON=alpdoc

# the shared directory path between the host and the docker image
# this should match WORKDIR and VOLUME in Dockerfile
DOCDIR=/docs

DIR := ${CURDIR}

all: $(DOCS)

resume.html: $(SRC) *.adoc
	docker run -it -v $(DIR):$(DOCDIR)/ $(DCON)     asciidoctor $(SRC)

resume.pdf: $(SRC) *.adoc
	docker run -it -v $(DIR):$(DOCDIR)/ $(DCON) asciidoctor-pdf $(SRC)

dockerimg:
	docker build -t alpdoc .

.PHONY: clean

clean:
	rm -f *.pdf *.html

dockerclean:
	docker rm $(shell docker ps -aq)
	docker rmi $(shell docker images -q)

