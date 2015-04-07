#!/usr/bin/python
#Python program which doesn't look like Python... :p
#Runs on both Py2 and Py3.
car=lambda a:a[0]
cdr=lambda a:a[1:]
cons=lambda e,a:[e]+a
nullp=lambda a:a==[] #not a #fixed
reverse_aux=lambda a,b:b if nullp(a) else reverse_aux(cdr(a),cons(car(a),b))
reverse2=lambda a:reverse_aux(a,[])
print(reverse2(['A', 'B', 'C', 'D', 'E', 'F', 'G']))