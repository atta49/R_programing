library(dplyr)
library(datasets)
head(mtcars)

sub_mc<-mtcars %>% select(mpg,cyl,disp,hp,gear,carb) %>% mutate(dispxhp=disp*hp)
sub_mc

