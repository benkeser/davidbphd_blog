# merges clinical and biomarkers data set
# saves clean_data/clean_data.txt

data_clin <- read.table(
  here::here("raw_data", "clinical.txt"), header = TRUE
)
data_biom <- read.table(
  here::here("raw_data", "biomarkers.txt"), header = TRUE
)
data_merge <- merge(data_clin, data_biom)

write.table(
  data_merge, here::here("clean_data", "clean_data.txt")
)