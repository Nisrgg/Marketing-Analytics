Data=read.csv("Sample hotel data.csv")

str(Data)
names(Data)

head(Data)

View(Data)

library(dplyr)

summary1 = Data %>% group_by(Hotel_Name_City) %>% summarise(OR=mean(Review_Overall_Rating))

summary1 = Data %>% group_by(Hotel_Name_City) %>% 
  summarise(OR=mean(Review_Overall_Rating),VFM=mean(Rating_Value,na.rm=TRUE),
            LOC=mean(Rating_Location,na.rm=TRUE),SQ=mean(Rating_Sleep_Quality,na.rm=TRUE),
            RMS=mean(Rating_Rooms,na.rm=TRUE),CLN=mean(Rating_Cleanliness,na.rm=TRUE),
            SRV=mean(Rating_Service,na.rm=TRUE))

summary1=data.frame(summary1)
summary2=summary1[16:17,]

  barplot(as.matrix(summary2[,2:8]),names.arg =  colnames(summary2[,2:8]), xlab="aspects",
          ylab="ratings",beside = T, col=c(5,6))
  legend(x=2,y=2,legend = summary2[,1],fill=c(5,6))
  
  #Missing value median imputation
  names(Data)
  
  for(i in 6:11){
    Data[,i]=ifelse(is.na(Data[,i]),median(Data[,i],na.rm=TRUE),Data[,i])
  }
  
  #Outlier detection and removal
  for(i in c(2,6:11)){
    a=!(abs(scale(Data[,i])[,1])>3)
    Data=Data[a,]
  }
  
  #Correl
  
  Correl=cor(Data[,6:11])
  
  #Normality
  
  for(i in c(2,6:11)){
    hist(Data[,i])
    print(shapiro.test(Data[,i]))
  }
  
  #Regression
  
  fit=lm(Review_Overall_Rating~Rating_Value+Rating_Location+
           Rating_Sleep_Quality+Rating_Rooms+
           Rating_Cleanliness+Rating_Service,data=Data)
  summary(fit)
  
  Data1=Data
  
  for(i in c(2,6:11))Data1[,i]=as.factor(Data1[,i])
  
  library(MASS)
  fit1=polr(Review_Overall_Rating~Rating_Value+Rating_Location+
           Rating_Sleep_Quality+Rating_Rooms+
           Rating_Cleanliness+Rating_Service,data=Data1)
  summary(fit1)
