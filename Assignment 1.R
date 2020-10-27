#Q1
#a
seq(from = 5.5,to = 32.5, by = 3)

#b
cumsum(2:8)

#c
0.3 + 720/cumprod(6:2)

#d
(1:12)%/%3

#e
seq(from = 2.3, to = 3.8, by = .3)

#f
x = integer(14)
x[cumsum(2:5)] = 1:4

#g
rep(seq(from = 0.1, to = 0.6, by = 0.1), rep(3:1, 2))

#h
#paste("x^", rep(3:1, 1:3), sep = "")
paste0("x^", rep(3:1, 1:3))

#Q2
#a
a = function (n) {
  result = 0 #initialise
  test = 1:length(n) #vector
  result = sum(exp(n) / n ^ test) #formula
  result #output
}
a(numeric(0))

#b
b = function (n) {
  if (length(n) > 0){
    result = 0 #initialise
    result = sum(exp(seq(length(n))) / factorial(seq(length(n)))) #formula
    result #output
  }
  else if (length(n) == 0) {
    return (0) #for the case of size 0
  }
}
b(numeric(0))

#Q3
#a
BMI = function (w, h) {
  return (round(w / (h ^ 2), digits = 3)) #round to 3 d.p.
}
BMI(77.3, 1.8)

#b
weight.category = function (i) {
  if (i < 18.5) { #if-then-else
    print("This Corresponds to category: underweight")
  }
  else if (i >= 18.5 && i < 25) {
    print("This Corresponds to category: normal weight")
  }
  else if (i >= 25 && i < 33) {
    print("This Corresponds to category: overweight")
  }
  else if (i >= 33) {
    print("This Corresponds to category: obeseity")
  }
}
#weight.category(BMI(77.3, 1.8))
weight.category(21.133)

#Q4
#a
test4a = function (num) {
  if (num == 0) { #when doing nothing
    return (0)
  }
  else {
    a = sample(c(1, -1), size = num, prob = c(0.55, 0.45), replace = TRUE) #generate the vector of 1 nad -1 with probability of 0.55 and 0.45
    #print(a)
    c(0, cumsum(a)) #count together
  }
}
test4a(10)

#b
set.seed(4) #new generation

final = function (x) {
  test4b = which(x == 0)
  test4b = test4b[-1]
  temp1 = x[test4b - 1] > 0
  temp2 = x > 0
  sum(temp1, temp2)

}
final(test4a(10))










