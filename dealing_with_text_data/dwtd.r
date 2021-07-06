getwd()
setwd('../')
setwd("./R_repo/R_programing/dealing_with_text_data")
scameras=read.csv("./dealing_with_text_data/Speed_Cameras.csv")
scameras
names(scameras)
tolower(names(scameras))
View(scameras)
#colum nae updating
names(scameras$intersecti)='intersection.1'
#names(scameras)[names(scameras) == "intersecti"] <- "intersection.1"
splitname=strsplit(names(scameras),"\\.")
splitname[7]
splitname[8]
#from vector 8 sect 1st index location which is intersection
splitname[[8]][1]
splitname[7]
#top twoline and below two line work same
firstname=function(x){x[1]}
sapply(splitname, firstname)
scameras<-setNames(scmaeras, X=x, Y= y)

#text data cleaning 
#text mining
library(tm)
sentenc<-c("this is my 1st test example.","A person is a nice.","we can divide 10 with 2","Ahmen is a Gental man")
txt<-Corpus((VectorSource(sentenc)))
txt_data<-tm_map(txt,stripWhitespace)
txt_data
txt_data<-tm_map(txt_data,tolower)
txt_data
txt_data<-tm_map(txt_data,removeNumbers)
txt_data
txt_data<-tm_map(txt_data,removePunctuation)
txt_data
txt_data<-tm_map(txt_data,removeWords,stopwords("english"))
txt_data

#user define word to remove
txt_data<-tm_map(txt_data,removeWords,c("and","the","our","that",'for','their','are','also','more','have','must','has','should','this','with'))
df<-data.frame(cln_text=unlist(txt_data),stringsAsFactors = FALSE)
df$cln_text
a<-stopwords("english")

install.packages("wordcloud")
library(wordcloud)
wd<-scameras$street
wordcloud(wd,scale = c(5,0.5),random.order = FALSE,rot.per=0.35,use.r.layout = FALSE,
          colors=brewer.pal(8,"Dark2"))
 