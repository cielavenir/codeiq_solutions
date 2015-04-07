#!/usr/bin/python
import os,math
import pandas,numpy,matplotlib.pyplot
#os.chdir('data')
_gdp=pandas.io.parsers.read_table('indicator_gapminder_gdp_per_capita_ppp.txt')
_life=pandas.io.parsers.read_table('indicator_life_expectancy_at_birth.txt')
_population=pandas.io.parsers.read_table('indicator_gapminder_population.txt')
for i in range(1950,2012+1):
	gdp=_gdp[str(i)]
	life=_life[str(i)]
	population=_population[str(i)]
	matplotlib.pyplot.scatter(gdp[~numpy.isnan(gdp)],life[~numpy.isnan(gdp)],s=[e/1000000 for e in population[~numpy.isnan(gdp)]])
	matplotlib.pyplot.title(str(i))
	matplotlib.pyplot.xlabel("GDP (log)")
	matplotlib.pyplot.ylabel("life expectancy")
	matplotlib.pyplot.xscale('log')
	matplotlib.pyplot.savefig(str(i)+'.png')