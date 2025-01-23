a=1:10
b=seq(2,21,length.out=10)
c=c(rep("sachin",5),rep("sourav",3),rep("sallu",2))

# create the matrix
matrix1= cbind(1,2,3)
matrix2= rbind(a,b,c)
tMatrix= t(matrix2)

#other matrix
matrix3= matrix(c(1:9), nrow=3, byrow= FALSE)

# creating the dataframe
data1=data.frame(pq=a,rs=b,t=c)

# subset a matrix and dataframe
tMatrix[c(2:4),c(2,3)]
tMatrix[-c(2:4),c(1,2)]

# Plot the dataframe
data1$pq
data1$rs>6&data1$rs<10
data1[data1$rs>6&data1$rs<10,]

plot(data1$rs)
plot(data1$pq, type = "l")

#write df
write.csv(data1, "data1.csv", row.names = FALSE)

# df.read()
data2 = read.csv("data1.csv")
