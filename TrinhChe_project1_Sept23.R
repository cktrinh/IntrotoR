A<-1:10
B<-11:20
C<-c(21,22,23,24,25,26,27,28,29,30)
print(A+B)
print(A-B)
print(A*B)
print(A/B)
print(A+C)
print(A-C)
print(A*C)
print(A/C)
results<-vector("double",4)
results<-double(4)
results[1]<-sum(A+B)
results[2]<-sum(A-B)
results[3]<-prod(A)
results[4]<-sum(A*B)
print(results)


df<-read.csv("test1.csv")
print(names(df))
print(df$A)
print(df['A'])
print(df[['A']])

print(df$B)
print(df[[3,2]])
print(df$B[3])

print(df[1,])
print(df[2,])
print(as.numeric(df[1,]))
print(as.numeric(df[2,]))

print(sum(df$A))
print(sum(df$B))  #do I need to use as.numeric function for this?
print(sum(df$C))

print(mean(df$A))
print(mean(df$B))  
print(mean(df$C))

df2<-read.csv("Apples & Oranges.csv")
print(mean(df2$Apple))
print(mean(df2$Orange))