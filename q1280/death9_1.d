import std.stdio;void main(){foreach(i;0..208)write(cast(char)(97+i%26-(i%8<1)*32));}