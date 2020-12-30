# get summary statistics needed for the report
# saves file output/summ_stats.RData

# source in a rounding function
source(here::here("R", "good_round.R"))

data_merge <- read.table(
  here::here("output", "clean_data.txt"), 
  header = TRUE
)

n <- nrow(data_merge)
n_female <- sum(data_merge$sexf)
mean_age <- good_round(mean(data_merge$age))

summ_stats <- list(
  n = n, 
  n_female = n_female,
  mean_age = mean_age
)

save(
  summ_stats, file = here::here("output", "summ_stats.RData"))
)