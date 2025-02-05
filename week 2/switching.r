df=read.csv("switching.csv")

#When objective is to find relationships
r1 <- glm(SwBh~Age+MF+ProfessionBusiness+UrbanRural+RecipientOperator+
            Sat+Servqual+PSB+ESB+OSB+Price,data=df,binomial(link="logit"))
summary(r1)

#When objective is prediction

a=sample(1:dim(df)[1],120)
trainingdata=df[-a,]
testingdata=df[a,]

r2 <- glm(SwBh~Age+MF+ProfessionBusiness+UrbanRural+RecipientOperator+
            Sat+Servqual+PSB+ESB+OSB+Price,data=trainingdata,binomial(link="logit"))
summary(r2)

r3 <- step(r2)
summary(r3)

predictions<-predict(r3,newdata=testingdata,type="response")
predicted<-ifelse(predictions<mean(testingdata$SwBh),0,1)
actual=testingdata$SwBh
table(predicted,actual)