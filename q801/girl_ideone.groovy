#!/usr/bin/env groovy
x=new OutputStreamWriter(System.out,'UTF-8')
[12460, 12540, 12523, 12501, 12524, 12531, 12489, 12417, 12387, 12385, 12419, 12411, 12375, 12356, 65281].collect{x.write(it)}
x.flush()