# 6.3
theta = 8
n = 20
NSIM = 100000

# NSIM simulations of n x U(0, theta) random variables
X = matrix(runif(NSIM*n, min=0, max=theta), ncol = n)

# Finding the 2 x mean for each of the NSIM simulations
thetaHAT = rep(0, NSIM)
for (i in 1:NSIM) {
  thetaHAT[i] = 2*mean(X[i, 1:n])
} 

# Simulated vs. Theoretical Value
# Expectation
mean(thetaHAT)
theta
# Variance
var(thetaHAT)
theta^2/(3*n)
