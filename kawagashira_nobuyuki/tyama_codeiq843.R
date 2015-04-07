#!/usr/bin/Rscript
#引っ掛けがありそうですが、総じて前回より簡単…。
data=read.csv('homicide_log.csv',header=T)
male=data[,'Male']
female=data[,'Female']
lm(male~female) #問1
pdf('predict.pdf') #問3
plot(female,male,xlim=c(-1,3),ylim=c(-1,3),main='predicting male victims from female victims')
abline(lm(male~female),col='blue')
dev.off()
#問2
#a = 1.094
#b = 0.548