# Title     : Assignmnet 2 code
# Objective : Q1, Q2A, Q2B
# Created by: Xizhe Lin
# Created on: 2020/9/16

#Q1
test = matrix(0, nrow = 4, ncol = 4, byrow = T)
diag(test) = c(1,2,3,4) # a test for diagonal
diag(test) = rep(2,4)  # a test of diagonal

#Actual function:
triDiag = function(diagonal, upper = 0, lower = 0, nrow = length(diagonal), ncol = length(diagonal)) {
  test = matrix(0, nrow = nrow, ncol = ncol)
  diag(test) = rep(diagonal, length = min(nrow, ncol))
  test[row(test) == col(test) - 1] = upper
  test[row(test) == col(test) + 1] = lower
  test #return and print the matirx
}

#Test:
triDiag(2, 5, -1 , 4, 4)
triDiag(c(1,2,3,4), -2, 8)
triDiag(c(1,2,3,4), -2, 8 , 3 , 5)



#Q2A
a = hist(iris$Sepal.Width, breaks = 24)[["breaks"]] #test
a #comes out with all data in iris$Sepal.Width
#It includes the data counts which we will focus on 'counts'
#However the graph is not necessary so plot = F

stratified.hist = function(x, y, xlab = "", ylab = "", main = "Stratified Histogram") {
  initial_graph = hist(x, breaks = 24, plot = F)
  data_breaks = initial_graph[["breaks"]]
  
  plot.new()
  plot.window(xlim = c(2, 4.9), ylim = c(0, 31))
  hist(x, breaks = 24, main = main, xlab = xlab, ylab = ylab)
  box()
  
  x_left = data_breaks[1:24] # x left points for all rectangles
  x_right = data_breaks[2:25] # x right points for all rectangles
  # coordinate of x is stable
  
  setosa = hist(x[y == "setosa"], breaks = data_breaks, plot = F)[["counts"]] # 'counts' for Setosa
  versicolor = hist(x[y == "versicolor"], breaks = data_breaks, plot = F)[["counts"]] # 'counts' for versicolor
  virginica = hist(x[y == "virginica"], breaks = data_breaks, plot = F)[["counts"]] # 'counts' for virginica
  
  rect(x_left, 0, x_right, virginica, col = "#ffacbf", border = NA) # bottom level 
  rect(x_left, virginica, x_right, virginica+versicolor, col = "#9ad685", border = NA) # middle level
  rect(x_left, virginica+versicolor, x_right, setosa+versicolor+virginica, col = "#8eccff", border = NA) #top level
  
  rect(x_left, 0 ,x_right, setosa+versicolor+virginica, density = 0) # Bracket of the rectangles
  
  legend("topright", legend = c("setosa", "versicolor", "virginica"), col = c("#ffacbf", "#9ad685", "#8eccff"), lty = 1, lwd = 3) # Legends
}

with (iris, stratified.hist(Sepal.Width, Species, xlab="Sepal.width"))



#Q2B
layout(matrix(c(7,7,7, # title 1
                1,2,3, # length graph 1, graph 2, graph 3
                8,8,8, # title 2
                4,5,6), # width graph 1, graph 2, graph 3
              ncol = 3, byrow = T),
       widths = c(2.5,2.5,2.5),
       heights = c(0.8,3,0.8,3)) #construct the layout
layout.show(n = 8) # test

opar = par(mar = c(2,2,0,0), cex = 1)

#Sepal.Length:
#color: #8eccff, #9ad685, #ffacbf same as Q2A
#First graph
hist(iris$Sepal.Length[iris$Species == "setosa"], main = "", breaks = seq(4.2,8.0, by = 0.2), col = "#8eccff", axes = F)
axis(1, seq(4.5,8.0, by = 0.5))
axis(2)

#Second graph
hist(iris$Sepal.Length[iris$Species == "versicolor"], main = "", breaks = seq(4.2,8.0, by = 0.2), col = "#9ad685", axes = F)
axis(1, seq(4.5,8.0, by = 0.5))
axis(2)

#Third graph
hist(iris$Sepal.Length[iris$Species == "virginica"], main = "", breaks = seq(4.2,8.0, by = 0.2), col = "#ffacbf", axes = F)
axis(1, seq(4.5,8.0, by = 0.5))
axis(2)

#Sepal.Width
#First graph
hist(iris$Sepal.Width[iris$Species == "setosa"], main = "", breaks = seq(2.0,5.0, by = 0.2), col = "#8eccff", axes = F)
axis(1, seq(2.0,4.0, by = 0.5))
axis(2)

#Second graph
hist(iris$Sepal.Width[iris$Species == "versicolor"], main = "", breaks = seq(2.0,5.0, by = 0.2), col = "#9ad685", axes = F)
axis(1, seq(2.0,4.0, by = 0.5))
axis(2)

#Third graph
hist(iris$Sepal.Width[iris$Species == "virginica"], main = "", breaks = seq(2.0,5.0, by = 0.2), col = "#ffacbf", axes = F)
axis(1, seq(2.0,4.0, by = 0.5))
axis(2)

#set back to default margin
par(opar)

opar1 = par(mar = rep(0,4))

#Title 1
plot.new()
plot.window(xlim = c(0,10), ylim = c(0,10))
text(5,4,"Histogram for iris$Sepal.Length", cex = 2, font = 2)

#Title 2
plot.new()
plot.window(xlim = c(0,10), ylim = c(0,10))
text(5,4,"Histogram for iris$Sepal.Width", cex = 2, font = 2)

#set back to default margin
par(opar1)

