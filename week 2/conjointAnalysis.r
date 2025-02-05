data=read.csv("conjoint data price.csv")

str(data)

#Change the X variables to factor form

for(i in 2:4)data[,i]=as.factor(data[,i])

#Find the regression

fit=lm(Rating~Fuel+Capacity+Price,data=data)
summary(fit)
