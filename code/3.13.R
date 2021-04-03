N = 10000
Y = sample(c(0, 1), size=N, replace = TRUE)
X = rep(0, N)
for (i in 1:N) {
  if (Y[i] == 1) {
    X[i] = runif(1)
  } else {
    X[i] = runif(1, min=3, max=4) 
  } 
}   
mean(X)
var(X)
sd(X)


N = 10000
Y = sample(c(0, 1), size=N, replace = TRUE)
X = rep(0, N)
for (i in 1:N) {
  if (Y[i] == 1) X[i] = runif(1)
  else X[i] = runif(1, min=3, max=4) 
}  