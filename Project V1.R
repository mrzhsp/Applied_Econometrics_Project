# Hello

# Inserting Libraries -----------------------------------------------------
library(tidyverse)
library(tidyr)
library(tidyselect)
library(euR)
library(dplyr)
library(ggplot2)
library(GGally)
library(proto)
library(gsubfn)
library(forcats)
library(microbenchmark)
library(rmarkdown)
library(colorspace)
library(readr)
library(knitr)
library(lubridate)
library(stringr)
library(colorspace)
library(styler)
library(readxl)

# Reading File ------------------------------------------------------------
my_data <- read_excel("raw_data_v0.xlsx")
View(my_data)
