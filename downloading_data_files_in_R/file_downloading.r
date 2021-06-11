if (!file.exists("Data")){
  dir.create("Data")
}

setwd('/home/attaullah/Documents/R_repo/downloading_data_files_in_R/Data')
getwd()
#setwd('../') move one step back
getwd()

fileurl<-"https://opendata.arcgis.com/api/v3/datasets/7055dbb02f0c4f14ab7ea3eb5ebfda42_0/downloads/data?format=csv&spatialRefId=3857"
download.file(fileurl,destfile = "gufhtugu.csv",method = "curl")
list.files("./Data ")
dateDownloaded<-date()
dateDownloaded
guftugudata<-read.csv("gufhtugu.csv")
str(guftugudata)
rtable=read.table("gufhtugu.csv",sep = ',', header = TRUE)
head(rtable)
View(rtable)
rcsv=read.csv("gufhtugu.csv",nrows = 10,skip = 1)

