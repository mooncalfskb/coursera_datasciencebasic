custdata <- read.table("https://raw.githubusercontent.com/WinVector/zmPDSwR/master/Custdata/custdata.tsv",header=T,sep='	')
custdata
summary(custdata$income)
summary(custdata$age)
is.na(custdata)

hist(custdata$income,main="hist")
plot(~custdata$income+custdata$age,data = custdata)
