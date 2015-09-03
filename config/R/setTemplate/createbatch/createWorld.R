library(craftyr)
library(shbasic)
setwd("C:/Data/LURG/workspace/crafty_modelcompare-europe/config/R/create/C001/_C001-G9-C8-I5-P3")

simp <- craftyr::param_getDefaultSimp()
simp$dirs$inputdata 		<-  "C:/Data/LURG/workspace/crafty_modelcompare-europe/data/C001/_C001-G9-C8-I5-P3"
simp$dirs$inputdataagenttmpl<-  "C:/Data/LURG/workspace/crafty_modelcompare-europe/data/C001/_C001-G9-C8-I5-P3"

simp$paramcreation$startrun <- 0

## adapt templates
## adapt parameters in scripts


## create basic configuration:
#source("./createAftMultifunctionalProductivityManual.R")
source("./createAftParamCSV.R")
source("./create1by1RunCSV.R")

## generate basic social network configurations using python script

## RUN initial run to generate network 

# for evaluation purposes:
#source("./createAftParamVariationMatrixCSV.R")