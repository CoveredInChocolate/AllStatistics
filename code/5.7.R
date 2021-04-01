# 5.7
NSIM = 1000000
n = 5
Xn = rpois(NSIM, lambda = 1/n)

mean(Xn)
1/n
var(Xn)
1/n

Yn = n*Xn
mean(Yn)
n*(1/n)
var(Yn)
n^2*(1/n)
