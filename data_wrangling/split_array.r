head(InsectSprays)
View(InsectSprays)
#result inform of vector
tapply(InsectSprays$count,InsectSprays$spray,sum)

spl=split(InsectSprays$count,InsectSprays$spray)
spl

sprcount<-lapply(spl,sum)
sprcount

unlist(sprcount)
#sapply return inform of vector
sapply(spl,sum)

?splits