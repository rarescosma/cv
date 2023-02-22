default:
	xelatex rares-cv-2023.tex

clean:
	rm -f *.aux *.log *.out *.pdf

upload: default
	scp rares-cv-2023.pdf vps:~/static/
