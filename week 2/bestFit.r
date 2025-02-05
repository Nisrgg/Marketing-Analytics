Data=read.csv("week 1/Sample hotel data.csv")

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

#Scale the data
Data[,c(2,6:11)]=scale(Data[,c(2,6:11)])

#Regression

fit=lm(Review_Overall_Rating~Rating_Value+Rating_Location+
         Rating_Sleep_Quality+Rating_Rooms+
         Rating_Cleanliness+Rating_Service,data=Data)
summary(fit)

#Does your co-traveller has any impact?

levels(Data$Review_Type)

fit1=lm(Review_Overall_Rating~Rating_Value+Rating_Location+
         Rating_Sleep_Quality+Rating_Rooms+
         Rating_Cleanliness+Rating_Service+Review_Type,data=Data)
summary(fit1)

#Does delay in reviewing has any impact

Data$date_of_review1=as.character(Data$date_of_review)
Data$date_of_review2=as.Date(Data$date_of_review1,"%m/%d/%Y")
Data$date_of_review2[is.na(Data$date_of_review2)]=as.Date(Data$date_of_review1[is.na(Data$date_of_review2)],"%m-%d-%Y")

Data$Month_of_Visit1=as.character(Data$Month_of_Visit)
Data$Month_of_Visit1=paste("1-",Data$Month_of_Visit1,sep="")
Data$Month_of_Visit1=as.Date(Data$Month_of_Visit1,"%d-%b-%y")

Data$timedist=Data$date_of_review2-Data$Month_of_Visit1

Data=na.omit(Data)

fit2=lm(Review_Overall_Rating~Rating_Value+Rating_Location+
          Rating_Sleep_Quality+Rating_Rooms+
          Rating_Cleanliness+Rating_Service+Review_Type+timedist,data=Data)
summary(fit2)