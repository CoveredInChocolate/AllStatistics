# 5.13
# Simplified example. No assumptions are made on Z except
# that it is nonnegative, so it should work on any
# nonnegative distribution, such as Z_i~U(0,1).
# or |Z_i| of Z_i~N(mu, sigma^2) 
NSIM = 1000
n = 10000
Zi = matrix(runif(NSIM*n), ncol = n)
# Zi = matrix(abs(rnorm(NSIM*n, mean=3, sd = 2)), ncol = n)

# Each column i corresponds to Z_i
Xn = rep(0, n)
for (i in 1:n) {
  Xn[i] = n*min(Zi[1:NSIM, i])
} 
hist(Xn, breaks=40, prob = TRUE)
