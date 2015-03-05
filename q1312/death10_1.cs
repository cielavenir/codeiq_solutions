using System;
class Z{static void Main(){
string a="GTGT",b=a+a+"GTT"+a+"TTGTT",c="TTTFGTTTT"+b+"TWWTTWG"+b+"FGGWMTMTGGTWGGTTGGTTMWGGWGTTMGGM";foreach(var e in c)Console.Write(e=='T'?"tree":e=='F'?"fire":e=='G'?"gold":e=='W'?"water":"moon");
}}