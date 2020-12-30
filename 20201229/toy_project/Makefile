## report                : compiles the final report in output/report.html
report: R/report.Rmd \
  output/summ_stats.RData \
  figs/fig1.png figs/fig2.png
	cd R && Rscript make_report.R

## output/clean_data.txt : two raw data sets merged
output/clean_data.txt: R/make_clean_data.R \
  data/biomarkers.txt data/clinical.txt
	Rscript R/make_clean_data.R

## output/summ_stats.txt : summary statistics reported in text of report
output/summ_stats.RData: R/make_summary_stats.R \
  R/good_round.R \
  output/clean_data.txt
	Rscript R/make_summary_stats.R

## figs/fig1.png         : scatter plot of biomarker 1 vs. biomarker
figs/fig1.png: R/make_fig1.R output/clean_data.txt
	Rscript R/make_fig1.R

## figs/fig1.png         : paneled scatter plot of biomarkers by age, sex
figs/fig2.png: R/make_fig2.R output/clean_data.txt
	Rscript R/make_fig2.R

## figs                  : populates /figs with all figures
.PHONY: figs
figs: figs/fig1.png figs/fig2.png

## clean                 : removes all contents of output/ and figs/
clean:
	rm output/* figs/*

help: Makefile
	@sed -n 's/^##//p' $<

.PHONY: report clean help