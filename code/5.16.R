# 5.16
NSIM = 100000
X = runif(NSIM)
Y = runif(NSIM, min=-1, max=0)

D = X + Y
mean(D)
var(D)
hist(D, breaks=40, prob=TRUE)
