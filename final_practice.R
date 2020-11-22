#1
1:8 * rep(seq(1,-2, length = 2), 4)

rep(1:4, rep(3:2, 2))

seq(1.4,4.9, by = 0.7)

rep(0:4, each = 3)[2:13]

rep(rbind(0, 5:1), rbind(5:1, 1))


#2
question2 = c(-1,-2,1,2,3,4,5) # tested vector
sum(question2, na.rm = T) # a

mean(question2[question2>0], na.rm = T) # b

which((x[-length(x)] > x[-1]))[1] + 1# c

X = 10:20 # d
index.n = function(x, y) { 
  index = which(x)
  result = index[y]
  result
}
index.n(X>14, 2)
index.n(X>14, 7)


#3
X = matrix(c(1,0,1,1,0,1,1,0,0,0,1,0,0,0,1,0,1,1,1,0), ncol = 5, byrow = T)
X[2, 1:3]
sum(X[2, 1:3] == 0)
sum(X[2, 1:3] == 1)

maj.mat = function(X, d) {
  elements = X[1:d]
  number_of_zero = sum(elements == 0)
  number_of_one = sum(elements == 1)
  if (number_of_one > number_of_zero) {
    1
  } else {
    0
  }
}
apply(X, 1 , maj.mat , d = 2)


#4
mat = matrix(c(4,4,5,1,0,0,0,2,0,3,0,6), 4, 3, byrow = T)
layout(mat, widths = c(0.5,2,3), heights = c(1,2,2,4))
layout.show(6)
box("outer")


#5
plot(x, y , pch = 2, xlim = c(-2, 52), ylim = c(0, 6), ylab = "Visits", xlab = "Individuals")
points(x, z , pch = 16, col = 'red')
legend("topright", c('Male', 'Female'), pch = c(2,6), col = c("black", "red"), cex = 0.75)
title("Number of Individual Visits")
lines( x= c(0,50), y = c(3, 3), lty = 2 , col = "blue")


#6


#7
jan2009 = c(1,2,3,4,5,6,7,8,9,10)
feb2009 = c(1,2,3,4,5,6,7,8,9,10)
jun2009 = c(1,2,3,4,5,6,7,8,9,10)
aug2009 = c(1,2,3,4,5,6,7,8,9,10)
dec2009 = c(1,2,3,4,5,6,7,8,9,10)
jan2010 = c(1,2,3,4,5,6,7,8,9,10)
allData = data.frame(jan2009, feb2009, jun2009, aug2009, dec2009, jan2010)
allData
head(colnames(allData))
# test end
tail(allData[, grepl("^jan", colnames(allData))])


#8
apply(population[,-1], 1, mean)


#9
wind = readLines("wind.txt")
number = unlist(strsplit(wind, ""))
data = as.integer(number)
strength = matrix(data, ncol = 24, byrow = T)
strength
strength[1:3,1:4]
ncol(strength)


#10
selectedID = tapply(df$id,df$gender,sample,size=5)