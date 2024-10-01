YEAR := $(shell date "+%Y")

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
