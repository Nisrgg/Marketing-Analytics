data=read.csv("choicebasedconjoint.csv")
data=data[,-1]

library(survival)

data$MonthlyIncome=factor(data$MonthlyIncome)

clogout1=clogit(choice~(Distance+Reputation+Delivery+Payment.Method+Price)
               +strata(V1),data=data)
clogout1
AIC(clogout1)


clogout2=clogit(choice~(Distance+Reputation+Delivery+Payment.Method+Price)*
                 (Gender+HealthInsurance)
                 +strata(V1),data=data)
clogout2
AIC(clogout2)
