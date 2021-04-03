# 5.14 - Delta Method

# Mean and Var of U(0,1)
X = runif(1e7)
mean(X)
1/2
var(X)
1/12
# So Xbar ~ N(1/2, 1/12) 
# Now we square Xbar: Y^2 = Xbar^2
# g(x) = x^2
# Mean is (1/2)^2 = 1/4
# Var is (2*(1/2))^2*(1/12) = 1/12

# Y is the distribution on Xbars
NSIM = 1000
n = 1000
X = matrix(runif(n*NSIM), ncol = n)

# Calculating Y on 1000 Xbars
Y = rep(0, NSIM)
for (i in 1:NSIM) {
  Y[i] = mean(X[i, 1:n])^2
}
mean(Y)
1/4
var(Y)*sqrt(n*NSIM) # Correcting for sample mean
1/12
