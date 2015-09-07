x=new OutputStreamWriter(System.out,'UTF-8')
26.times{i->e=[97,65,12354,12450,12450,12354,65,97].collect{x.write(it+i)}}
x.flush()