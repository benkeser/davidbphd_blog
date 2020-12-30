# make a scatter plot of biomarker 1 vs. biomarker 2

data_merge <- read.table(
  here::here("output", "clean_data.txt"), header = TRUE
)

png(here::here("figs", "fig2.png"))
plot(y = data_merge$biom1, x = data_merge$biom2,
     xlab = "Biomarker2", ylab = "Biomarker 1")
dev.off()