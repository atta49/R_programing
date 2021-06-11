library(RSQLite)
data("mtcars")
View(mtcars)
mtcars$car_names <- rownames(mtcars) #create new coulmn car_names and assign the value of column rowname
rownames(mtcars)<-c() #empty string remove the rowname column to index
mtcars$car_names
getwd()
setwd('./RSQLite_and_RSQL_in_R')
#create connection to the database
conn<-dbConnect(RSQLite::SQLite(),'CarDB.db')
#write the mtcars data set into table car_data
dbWriteTable(conn, 'cars_data',mtcars)
#list all the table available into a database
dbListTables(conn)
#Quick access function
dbListFields(conn,'cars_data')
rdd<-dbReadTable(conn,'cars_data')
rdd
datasets::AirPassengers
datasets::Loblolly


#SQL Query Execution

dbGetQuery(conn,"select * from cars_data Limit 5")
dbGetQuery(conn,"select cyl,hp,car_names from cars_data WHERE car_names LIKE 'M%' AND cyl IN (6,8)")
dbGetQuery(conn,"select cyl,avg(hp) as 'average_hp',avg(mpg) as 'average_mpg' from cars_data Group By cyl Order By average_hp")
avghp<-dbGetQuery(conn,"select cyl,avg(hp) as 'average_hp' from cars_data Group By cyl Order By average_hp")
avghp
class(avghp)

#parameterize Query
mpg<-18
cyl<-6
result<-dbGetQuery(conn,"select cyl,mpg,car_names from cars_data WHERE mpg>=? and cyl >=?",params=c(mpg,cyl))
result


#statment that dont not return the tabular result
#21.0   6  160 110 3.90 2.620 16.46  0  1    4    4         Mazda RX4
dbGetQuery(conn,"select * from cars_data Limit 5")

dbExecute(conn,"Delete from cars_data where car_names='Mazda RX4'")

dbExecute(conn,"insert into cars_data VALUES (21.0,6,160,110,3.90,2.620,16.46,0,1,4,4,'Mazda RX4')")
dbGetQuery(conn,"select * from cars_data")

#you can fetch all results
res<-dbSendQuery(conn,"select * from cars_data WHERE cyl=6")
dbFetch(res)
dbClearResult(res)#clear res
res

#read data in chunks
res<-dbSendQuery(conn,"select * from cars_data WHERE cyl=8")
while(!dbHasCompleted(res)){
  chunks<-dbFetch(res ,n=5)
  print(nrow(chunks))
  print(chunks)
}

dbClearResult(res)

dbDisconnect(conn)

#install.packages('RMySQL)
library(RMySQL)
ucscdb<-dbConnect(MySQL(),user="genome",host="genome-mysql.cse.ucsc.edu")
result<-dbGetQuery(ucscdb,"show databases;"); dbDisconnect(ucscdb)
result

hg19<-dbConnect(MySQL(),user="genome",db="hg19",host="genome-mysql.cse.ucsc.edu")
alltables<-dbListTables(hg19)
length(alltables)
alltables[1:5]
dbListFields(hg19,"HInvGeneMrna")
dbGetQuery(hg19,"select count(*) from HInvGeneMrna")
#dbGetQuery(hg19,"select * from HInvGeneMrna")
res<-dbSendQuery(hg19,"select * from HInvGeneMrna")
while(!dbHasCompleted(res)){
  chunks<-dbFetch(res ,n=5)
  print(nrow(chunks))
  print(chunks)
}  
