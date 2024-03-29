default: fresh

# Sugeneruoti straipsnį.
konspektas.pdf:
	xelatex -shell-escape main.tex
	makeglossaries -L lithuanian main
	#bibtex main
	xelatex -shell-escape main.tex
	xelatex -shell-escape main.tex
	makeglossaries -L lithuanian main
	xelatex -shell-escape main.tex
	mv main.pdf dokumentas.pdf

fresh: clear konspektas.pdf

# Išvalyti šiukšles.
clean:
	rm -f *.aux *.log *.xdv *.out *.toc *.bbl *.blg *.acn *.acr *.glg \
		*.glo *.gls *.xdy *.ist main.py latex.py *.py.err *.tmp.py *.pyc

# Ištrinti visus sugeneruotus failus.
clear: clean
	rm -f *.pdf
