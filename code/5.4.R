# 5.4
# Doing 10.000.000 simulations for some X_n
NSIM = 1e7
n = 10
Xn = sample(c(1/n, n), size = NSIM,
            replace = TRUE, prob = c(1-1/n^2, 1/n^2))
# Simulated vs. Theoretical
mean(Xn)
2/n - 1/n^3
var(Xn)
1 - 3/n^2 + 3/n^4 - 1/n^6

n = 50
Xn = sample(c(1/n, n), size = NSIM,
            replace = TRUE, prob = c(1-1/n^2, 1/n^2))
# Simulated vs. Theoretical
mean(Xn)
2/n - 1/n^3
var(Xn)
1 - 3/n^2 + 3/n^4 - 1/n^6

n = 200
Xn = sample(c(1/n, n), size = NSIM,
            replace = TRUE, prob = c(1-1/n^2, 1/n^2))
# Simulated vs. Theoretical
mean(Xn)
2/n - 1/n^3
var(Xn)
1 - 3/n^2 + 3/n^4 - 1/n^6
