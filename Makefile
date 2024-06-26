LEC = data_cleaning

FIGS= Figs/logo.pdf \
	  Figs/adipose_weight.pdf \
	  Figs/il3.pdf \
	  Figs/body_weight.pdf \
	  Figs/spreadsheet_colnames.pdf \
	  Figs/logo_withtext.pdf \
	  Figs/scatter_na.pdf \
	  Figs/hypo_arrays.pdf \
	  Figs/dup_ids.pdf \
	  Figs/mismatch.pdf \
	  Figs/check_calculations.pdf

R_OPTS=--no-save --no-restore --no-init-file --no-site-file

all: docs/$(LEC).pdf docs/$(LEC)_notes.pdf docs/data_cleaning_principles.pdf

docs/%.pdf: %.pdf
	cp $^ $@

docs/data_cleaning_principles.pdf: $(LEC).pdf
	pdftk $< cat 30 output $@

$(LEC).pdf: $(LEC).tex header.tex $(FIGS)
	xelatex $^

Figs/%.pdf: R/%.R
	cd R;R CMD BATCH $(R_OPTS) $(<F)

$(LEC)_notes.pdf: $(LEC)_notes.tex header.tex $(FIGS)
	xelatex $<
	pdfnup $@ --nup 1x2 --no-landscape --paper letterpaper --frame true --scale 0.9
	mv $(LEC)_notes-nup.pdf $@

$(LEC)_notes.tex: $(LEC).tex Ruby/createVersionWithNotes.rb
	Ruby/createVersionWithNotes.rb $< $@

clean:
	rm *.aux *.log *.nav *.out *.snm *.toc *.vrb
