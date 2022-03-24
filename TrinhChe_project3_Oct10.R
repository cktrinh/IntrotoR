# Part 1
gss91 <- read.spss("GSS1991.sav",use.value.labels=FALSE,to.data.frame=TRUE,trim_values=TRUE)
print(names(gss91))

gss16 <- read.spss("GSS2016.sav",use.value.labels =FALSE,to.data.frame=TRUE,trim_values = TRUE)
print(names(gss16))

# Part 2
# 2.3
plot(gss91$AGE[gss91$SEX==2],gss91$WRKYEARS[gss91$SEX==2], main="Respondent's age vs. workyears for Women", ylab="Age", xlab="Workyears")
plot(gss91$AGE[gss91$SEX==1],gss91$WRKYEARS[gss91$SEX==1], main="Respondent's age vs. workyears for Men", ylab="Age", xlab="Workyears")
# 2.4
plot(gss91$RINCOME[gss91$SEX==2], gss91$AGE[gss91$SEX==2], main="Respondent's age vs. income for Women 1991", ylab="Age", xlab="Income")
plot(gss91$RINCOME[gss91$SEX==1], gss91$AGE[gss91$SEX==1], main="Respondent's age vs. income for Men 1991", ylab="Age", xlab="Income")

# Part 3
# 3.7
function_quadpoly <- function(x) {
  value <- x^2+x*2+1
  return(value)
}

for (x in 1:5) {
  print(function_quadpoly(x))
}

makeBarPlot <- function (dataCol, dataTitle="",indexes=NULL, ylim=NULL, xlab=NULL) {
  if(is.null(indexes)) {
    tmptab <- table(dataCol) }
  else {
    tmptab <- table(dataCol[indexes])
    tmptab <- 100*tmptab/sum(tmptab)
    tlabels<-names(attr(dataCol, "value.labels"))
    tlabels<-tlabels[length(tlabels):1]
    
    plot0bj<-barplot(tmptab,names.arg=tlabels,main=dataTitle,ylim=ylim,xlab=xlab)
    return(plot0bj)}
}
makeBarPlot(gss91$CHINA, "1991 China Perception (AGE < 40)", gss91$AGE < 40,  ylim=c(0,25) )
makeBarPlot( gss91$CHINA, "1991 China Perception (AGE >= 40)", gss91$AGE >= 40, ylim=c(0,25) )

# 3.8
makeBarPlot(gss91$RINCOME, "1991 AGE VS. RESPONDENT'S INCOME (AGE < 40)", gss91$AGE <40,  ylim=c(0,60))
makeBarPlot(gss16$RINCOME, "2016 AGE VS. RESPONDENT'S INCOME (AGE < 40)", gss16$AGE <40,  ylim=c(0,60))
