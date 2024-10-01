YEAR := $(shell date "+%Y")
DOCKER_REPO := ghcr.io/rarescosma/cv
DOCKER_TAG := $(shell git ls-files -s Dockerfile | git hash-object --stdin | cut -c-20)
DOCKER_IMG := $(DOCKER_REPO):$(DOCKER_TAG)
SHELL := /bin/bash

default:
	xelatex rares-cv.tex

clean:
	rm -f *.aux *.log *.out *.pdf

upload: default
	scp rares-cv.pdf vps:~/static/rares-cv-$(YEAR).pdf

arch_deps:
	sudo pacman -Sy texlive-latexrecommended texlive-fontsrecommended texlive-langeuropean texlive-pictures

arch_clean:
	sudo pacman -R texlive-latexrecommended texlive-fontsrecommended texlive-langeuropean texlive-pictures

dockerize:
	docker pull -q $(DOCKER_IMG) || ( \
 	  docker build $(PWD) -f $(PWD)/Dockerfile -t $(DOCKER_IMG); \
	  docker push -q $(DOCKER_IMG); \
	);

with_docker:
	docker run --rm -v $(PWD):/data -u $(id -u):$(id -g) $(DOCKER_IMG) make
