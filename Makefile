YEAR := $(shell date "+%Y")

default:
	xelatex rares-cv.tex

clean:
	rm -f *.aux *.log *.out *.pdf

upload: default
	scp rares-cv.pdf vps:~/static/rares-cv-$(YEAR).pdf
