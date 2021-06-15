df1<-data.frame(LETTERS , dfindex=1:26)
df2<-data.frame(letters , dfindex=c(1:10,15,20,22:35))

merge(df1,df2)
merge(df1,df2,all = TRUE)
names(df1)=c("alpha","lotsanumber")
merge(df1,df2,by.x="lotsanumber",by.y = "dfindex")
 