# Part 1
mixed <- read.csv('mixed.csv')
task1 <- function(filename) { 
  print(str(mixed))
  print(summary(mixed))
  
  for(i in 1:length(mixed)) {
  print(names(mixed)[[i]])
  print(class(mixed[[i]]))
  print(typeof(mixed[[i]]))
}
  
  mixed$Apple <- as.double(as.character(mixed$Apple))
  print(str(mixed))
  mixed <- read.csv('mixed.csv',na.strings=c("NA","."))
  print(str(mixed))
  mixed$Banana <- as.character(mixed$Banana)
  print(summary(mixed))
  
  df<-return(mixed)
}

task1()

# Part 2
task2 <- function(filename2) {
  which(df$Apple <5)
  print(indexes <- which(df$Pear < 50))
  print(indexes2 <- seq(1,10,3))
  print(seq(1,length(df$Apple),2))
  print(which(df$Apple > 4.5 & df$Apple < 5.5))
}
task2(df)

# Part 3
task3 <- function() {
  barplot(table(df$Size), main="Size of the fruits", xlab="Quantity for each Size type", space=0.5)
  arrows(3,4.8,3.7,4.6)
  text(3,4.8,labels="There are lots of small fruits",pos=2,col="RED")
  lines(c(1.3,2.9),c(4.6,4.6), col="BLUE",lwd=2)
}
task3()

# Part 4
task4 <-  function(N=1000) {
  print(flat <- runif(N,0,100))
  print(bump <- rnorm(N, mean=50,sd=10))

  hist(flat,xaxt='n')
  axis(3,labels=TRUE)
  
  hist(bump,xaxt='n')
  axis(3,labels=TRUE,cex.axis=0.75)
  arrows(70,200,60,180,lwd=3,col="BLUE")
  text(70,200,"Big Bump!",col="darkred",pos=4)
  lines(c(70,85),c(185,185),lwd=4,col="GREEN")
}  
task4(100)
task4()
task4(10000)
