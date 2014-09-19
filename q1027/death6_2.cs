using System;
using System.Linq;
class Z{static void Main(){Console.Write(String.Join(":",Enumerable.Range(2,999).Where(i=>Enumerable.Range(2,i-2).All(j=>i%j>0))));}}