#part 2

gss91<-read.spss("GSS1991.sav",to.data.frame=TRUE,use.value.labels = FALSE, trim_values=TRUE)
print(names(gss91))

gss16<-read.spss("GSS2016.sav",to.data.frame=TRUE,use.value.labels = FALSE,trim_values = TRUE)
print(names(gss16))

#part 3
zzz <- hist(gss91$WRKYEARS, labels=TRUE, ylim=c(0,300), main="GSS91 # of paid working years since age 16", xlab="# of paid working years since age 16", col="yellow")
print(zzz$breaks)
print(zzz$density)
readline("Press enter to continue")

hist(gss91$AGE, labels=TRUE, ylim=c(0,250), xlim=c(16,90), main="GSS91 Age of Respondents", xlab="Age of Respondents", ylab="# of Respondents", col="RED")
readline("Press enter to continue")

#part 4
plot(gss91$AGE, gss91$WRKYEARS, xlab="Age of Respondents", ylab="# of paid working years since age 16", main="Age vs. Paid working years since 16", col="Blue")
#part 4-9
plot(gss16$EDUC,gss16$RINCOME,xlab="# of educational years",ylab="Respondent's income",col="purple", main="Number of educational years vs. Income")

#part 5
tab91 <- table(gss91$CONEDUC)
tab91perc <- 100*tab91/sum(tab91)
tab16 <- table(gss16$CONEDUC)
tab16perc <- 100*tab16/sum(tab16)

tab91name<-names(attr(gss91$CONEDUC,'value.labels'))
tab91name<-tab91name[3:1]
par(mar=c(6,4,4,2))
barplot(tab91perc,names.arg=tab91name, ylim=c(0,100), cex.names=0.75, las=1, space=0.5, ylab="Percentage of respondents (%)", xlab="Level of Confidence", main="GSS91 Respondents' Confidence in Education", col = "RED")


tab16name<-names(attr(gss16$CONEDUC,'value.labels'))
tab16name<-tab16name[3:1]
par(mar=c(6,4,4,2))
barplot(tab16perc,names.arg=tab16name, ylim=c(0,100), cex.names=0.75, las=1, space=0.5, ylab="Percentage of respondents (%)", xlab="Level of Confidence", main="GSS16 Respondents' Confidence in Education", col = "BLUE")

#part 5-12
race16tab <-table(gss16$RACE)
race16perc <- 100*race16tab/sum(race16tab)
race16name <- names(attr(gss16$RACE,'value.labels'))
race16name <- race16name[3:1]
barplot(race16perc,names.arg=race16name, cex.names=1, las=1, ylab="Percentage of Respondents (%)",xlab="Race of Respondents", main="GSS16 RACE of Respondents", col="blue",ylim=c(0,100))

race91tab <-table(gss91$RACE)
race91perc <- 100*race91tab/sum(race91tab)
race91name <- names(attr(gss91$RACE,'value.labels'))
race91name <- race91name[3:1]
barplot(race91perc,names.arg=race91name, cex.names=1, las=1, ylab="Percentage of Respondents (%)",xlab="Race of Respondents", main="GSS91 RACE of Respondents", col="red",ylim=c(0,100))
