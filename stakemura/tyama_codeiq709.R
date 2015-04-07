#!/usr/bin/Rscript
#library(pmr)
m=matrix(1:25,ncol=5)
m[1,]=c(1,3,5,7,1)
m[2,]=c(1/3,1,3,7,1)
m[3,]=c(1/5,1/3,1,3,1/5)
m[4,]=c(1/7,1/7,1/3,1,1/7)
m[5,]=c(1,1,5,7,1)
#a=ahp(m)
#print(a$Saaty) # CI=0.04216369
#print(a$weighting)
# 0.37173148 0.21627737 0.07698453 0.03660230 0.29840431
#print(sum(a$weighting)) # 1
a=eigen(m)
print(Re((a$values[1]-dim(m)[1])/(dim(m)[1]-1))) # CI=0.043237
print(Re(a$vectors[,1]/sum(a$vectors[,1])))
# 0.37765676 0.21616067 0.07565920 0.03644011 0.29408327