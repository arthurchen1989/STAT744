
rm(list=ls())

library(rggobi)

# Clean all variables on the environment



# Here we still use the dataset 'mtcars', 
# however, it saved as an external pointer of 'GGobi' object
# To make the supplement materials consistency with my previous homewrok
# I am keeping use the mtcars data set

# Our target is to see the relationship between mpg and serveal factors
# Forexamle, mpg vs cyl, mpg vs hp,..etc.


g<-ggobi(mtcars)

# Through to set an object g, we can see the relationship between mpg and other factors
# As we discussed before, the most possible factors are hp,cyl and 

display(g[1], vars=list(X="hp", Y="mpg"))
display(g[1], vars=list(X="cyl", Y="mpg"))
display(g[1], vars=list(X="disp", Y="mpg"))

display(g[1], "Parallel Coordinates Display")

clustering <- hclust(dist(mtcars[,2:4]),method = "average")

# References
# 1. An introduction to rggobi, Hadley Wickham and Duncan T.L
# 2. GGobi Manual, Deborah F. Swayne


