# if condition
x<-4
y<-0
if(x>3){
  y<-10
} else{
  y<-0
}
#or 
y<-if(x>3){
  10
}else{
  0
}

#Loop
for(i in 1:10){
  print(i)
}

x<-c("a","b","c","d")
for(i in 1:4){
  print(x[i])
}
for(i in 1:4) print(x[i])

# dont no the no of element in variable, convert into series
for(i in seq_along(x)){
  print(x[i])
}
for(element in x){
  print(element)
}

#nested for loop
x<-matrix(1:6,2,3)
for(i in seq_len(nrow(x))){
  for(j in seq_len(ncol(x))){
      cat(x[i,j]," ")
  }
cat("\n")
}

#while Loop
count<-0
while(count<10){
  print(count)
  count<-count+1
}

z<-5
while(z>=3 && z<=10){
  print(z)
  coin<-rbinom(1,1,0.5)
  cat(coin,"is the value of coin\n")
  if(coin==1){
    z<-z+1
  }else{
    z<-z-1
  }
}

