# Part 2
task1 <- function(R,C) {
  data1 <- c(1,3,"Apple","Strawberry",TRUE,FALSE)
  print(m1 <- matrix(data1, ncol=3, nrow=2)) # type of data1 is string
  print(typeof(m1)) 
  print(class(m1)) 
  
  data2 <- c(2,5,TRUE,FALSE,FALSE,13)
  print(m2 <- matrix(data2, ncol=3, nrow=2))
  print(typeof(m2)) # typeof m2 is double
  print(class(m2))
  
  data3 <- 1:(R*C)
  print(m3 <- matrix(data3,ncol=C,nrow=R))
  
  print(m4 <- matrix(data3, ncol=C, nrow=R, byrow=TRUE)) # m4 numbers row first, while m3 numbers column first
}

task1(3,4)
task1(2,5)

# Part 3
task2 <- function(R,C)  {
  values <- 1:(R*C)
  print(mat <- matrix(values,ncol=C,nrow=R, byrow=TRUE))
  image(x=1:R,y=1:C,z=mat) # Note: the matrix values and resulting plot are reversed in order. 

  
  print(t(mat))
  image(x=1:C,y=1:R,z=t(mat)) # The plots are transposes of one another around the diagonal axis from the lower left of the plot to the upper right.
 
  image(x=1:C,y=1:R,z=t(mat),xaxt='n',yaxt='n')
  axis(side=1,at=1:C,labels=1:C)
  axis(side=2,at=1:R,labels=1:R)
  
}
task2(3,4)

# Part 4
f <- function(x,y) {
  valuesf <- x*y + 2*y
  return(valuesf)
}

task3 <- function(dx,dy,step) {
  xseq <- seq(0, dx, step)
  yseq <- seq(0, dy, step)
  NX <- length(xseq)
  NY <- length(yseq)
  mat <- matrix(ncol=NX, nrow=NY)
  

for (i in 1:NY) {
  for(j in 1:NX) {
    mat[i,j] <- f(xseq[j], yseq[i])
  }
}
  print(mat)
  
  image(x=yseq, y=xseq, z=mat)
  image(x=xseq, y=yseq, z=t(mat))
}
task3(5,10,0.5)

  

