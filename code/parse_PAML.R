library(tidyverse)

# one ratio results after SWAMP
oneR <- read.delim('data/oneratio_SWAMP.txt', header = FALSE) %>%
  filter(V2 == '5..1') %>%
  dplyr::select(-V2)

head(oneR)

oneR$FBtr <- unlist(str_match_all(string = oneR$V1, pattern = 'FBtr.{7}'))

one_ratio <- data.frame(oneR$FBtr,
                        plyr::ldply(strsplit(oneR$V3, "\\s+")))

head(one_ratio)

colnames(one_ratio) <- c('FBtr', 't', 'N', 'S', 'dN.dS', 'dN', 'dS', 'N.dN', 'S.dS')

dim(one_ratio)

#write_csv(one_ratio, 'output/PAML/oneRatio_SWAMP_nofilter.csv')
