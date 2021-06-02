a=5
class(a)
x<- 1:20
x

b=5L
class(b)

c=1/0
class(c)
print(c)


d=1/Inf
print(d)


e=0/0
print(e)


f=0/Inf
print(f)


g<-10
print(g)


7->h
print(h)

i<- 1:100
i


j<-c(TRUE,FALSE)
j


k<-c(2+3i,4-1i)
k
class(k)


l<-c(TRUE,"a")
l
class(l)


m<-c(1.7,"a")
class(m)


n<-c(TRUE,3)
class(n)


o<-c(TRUE,3L)
class(o)


##explicit coerion
## object can be explicitly coerced from one class to another using as.* fuction if available
p<-0:6
class(p) ##integer

as.numeric(p)
# [1] 0 1 2 3 4 5 6

as.logical(p)
# 1] FALSE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE

as.complex(p)
# [1] 0+0i 1+0i 2+0i 3+0i 4+0i 5+0i 6+0i

as.character(p)
#[1] "0" "1" "2" "3" "4" "5" "6"

q<-c("a","b","c")
as.numeric(q)
#[1] NA NA NA
#Warning message:
#NAs introduced by coercion

as.logical(q)
#[1] NA NA NA

# martices
r<-matrix(1:6,nrow = 2,ncol = 3)
r
dim(r)
attributes(r)
 m<-1:10
 m
 dim(m)<-c(5,2)
 m
 
x<-1:3
y<-10:12
cbind(x,y)

rbind(x,y)

s<-list(1,"a",TRUE,"b",1+3i)
s
 