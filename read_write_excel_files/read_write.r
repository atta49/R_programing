
#read exce; files
if (require(xlsx)) {
  detach("package:xlsx", unload=TRUE)
}
if (require(xlsxjars)) {
  detach("package:xlsxjars", unload=TRUE)
}
rm(list = ls())

if (file.exists("data")) {
  unlink("./data", recursive = TRUE)
}
if (!require(xlsx)) {
  install.packages("xlsx")
}
if (!file.exists("data")) {
  dir.create("data")
}
if (!file.exists("data/cameras.csv")) {
  fileUrl <- "https://opendata.arcgis.com/api/v3/datasets/7055dbb02f0c4f14ab7ea3eb5ebfda42_0/downloads/data?format=csv&spatialRefId=3857&where=1%3D1"
  download.file(fileUrl, destfile = "./data/cameras.csv", method = "curl")
}
colindex<-2:3
rowindex1<-1:4
cameradatasubset<-read.xlsx('./data/Fixed_Speed_Cameras.xlsx',sheetIndex = 1,header = TRUE) #OR
cameradatasubset<-read.xlsx('./data/Fixed_Speed_Cameras.xlsx',sheetIndex = 1,colIndex = colindex,rowIndex = rowindex1)
head(cameradatasubset)

#install.packages("readxl")
library(readxl)
readxl_example()
xls_example<-readxl_example("datasets.xlsx")
xls_example
read_excel(xls_example)

cameradata<-read_excel('./data/Fixed_Speed_Cameras.xlsx')
head(cameradata)



#write_excel files
devtools::install_github("ropensci/writexl")
library(writexl)
getwd()
setwd("./Documents/R_repo/R_programing/read_excel_files")
cam_csv<-read.csv("./data/Cameras.csv")
write_xlsx(cam_csv,"./data/csv_to_xlsx_formate.xlsx")

#another package for writing data
#install.packages("openxlsx")
