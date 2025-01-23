# everythin stored as in a form of vector

a=0  # assume it as a column of values    
b=6  # vector of length 1

# longer vector
a=1:10   # sequence of integers
b=c(2,5,8,9)  # combine() - creates vector with specific values
d=rep(c("A","B"),2)

length(a)
c=length(b) # saves the length of b in c

class(a)   # checking data type
class(b)
class(c)
class(d)

# sequence vector
a=seq(1,30,by=2)  #sequence of vector with step size=2
help(seq) # or ?seq - opens documentation for sequence

e = rep(2,10)

a=seq(1,30,2)

# subset vector of R
#type it on console for boolean result
a[8]
a>7

a>15 | a<8

m = c(rep("png",5),rep("jpg",3),rep("mkv",4))
num = as.numeric(m)

mm = as.factor(m)
num = as.numeric(mm)
