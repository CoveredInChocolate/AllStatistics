# 6.2
theta = 8
n = 20
NSIM = 100000

# NSIM simulations of n x U(0, theta) random variables
X = matrix(runif(NSIM*n, min=0, max=theta), ncol = n)

# Finding the max for each of the NSIM simulations
thetaHAT = rep(0, NSIM)
for (i in 1:NSIM) {
  thetaHAT[i] = max(X[i, 1:n])
} 

# Simulated vs. Theoretical Value
# Expectation
mean(thetaHAT)
n/(n+1)*theta
# Variance
var(thetaHAT)
n/((n+2)*(n+1)^2)*theta^2
