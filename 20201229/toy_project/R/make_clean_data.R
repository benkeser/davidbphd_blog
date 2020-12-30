# merges clinical and biomarkers data set
# saves output/clean_data.txt

data_clin <- read.table(
  here::here("data", "clinical.txt"), header = TRUE)
)
data_biom <- read.table(
  here::here("data", "biomarkers.txt"), header = TRUE
)
data_merge <- merge(data_clin, data_biom)

write.table(
  data_merge, here::here("output", "clean_data.txt")
)