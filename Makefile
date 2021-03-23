LEC = data_cleaning

FIGS=

R_OPTS=--no-save --no-restore --no-init-file --no-site-file

all: docs/$(LEC).pdf docs/$(LEC)_notes.pdf

docs/%.pdf: %.pdf
	cp $^ $@

$(LEC).pdf: $(LEC).tex header.tex $(FIGS)
	xelatex $^

Figs/gh_results_good.pdf: R/plot_gh_results.R
	cd R;R CMD BATCH $(R_OPTS) $(<F)

Figs/marshfield_map.png: R/wisconsin_map.R
	cd R;R CMD BATCH $(R_OPTS) $(<F)

Figs/sibpairs.pdf: R/plot_sibships.R
	cd R;R CMD BATCH $(R_OPTS) $(<F)

$(LEC)_notes.pdf: $(LEC)_notes.tex header.tex $(FIGS)
	xelatex $<
	pdfnup $@ --nup 1x2 --paper letterpaper --frame true --scale 0.9
	mv $(LEC)_notes-1x2.pdf $@

$(LEC)_notes.tex: $(LEC).tex Ruby/createVersionWithNotes.rb
	Ruby/createVersionWithNotes.rb $< $@

clean:
	rm *.aux *.log *.nav *.out *.snm *.toc *.vrb
