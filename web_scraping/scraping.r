theurl="https://en.wikipedia.org/wiki/Brazil_national_football_team"
files<-read_html(theurl)
tables<-html_nodes(files,"table")#what we want to read fro file table,paragraph,list,image,text
table1<-html_table(tables[1],fill = TRUE)
