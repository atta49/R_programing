#data merging/joining/binding
activity<-data.frame(opid=c("opo1","opo2","opo3","opo4","opo5","opo6","opo7"),units=c(23,34,29,56,27,48,49))
names<-data.frame(operator=c("henny","jally","jhon","khanoo","imran",'asif','atika'))
cblended<-cbind(activity,names)
cblended
#in dplyr use bind_cols()

rblended<-rbind(cblended,cblended)
rblended
#in dplyr use bind_rows()