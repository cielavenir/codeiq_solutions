x=c(97,65,12354,12450,12450,12354,65,97)
for(i in 0:25)for(j in 1:8)cat(intToUtf8(x[j]+i))