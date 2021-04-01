# 5.8 - Approximating a Poisson distribution
n = 100  # 100 pages per book
NSIM = 1000000 # Repeating simulation 100.000 times
LMBD = 1

# Running simulations
Xn = matrix(rep(0, n*NSIM), ncol=n)
for (i in 1:NSIM) {
  Xn[i, 1:n]  = rpois(n, lambda = LMBD)
} 
# We are summing 100 independent Poisson distributions
# So the resulting Y is Poisson(100)
Y = rep(0, NSIM)
for(i in 1:NSIM) {
  Y[i]  = sum(Xn[i, 1:n])
} 
mean(Y)
var(Y)
# The CLT only applies to the SAMPLE MEAN
MN = rep(0, NSIM)
VR = rep(0, NSIM)
for(i in 1:NSIM) {
  MN[i]  = mean(Xn[i, 1:n])
  VR[i]  = var(Xn[i, 1:n])
} 
print("Comparing Simulated to Theoretical")
mean(MN)
LMBD
var(VR)
LMBD/n

# Approximating answer numerically
length(Y)
sum(Y < 90)/length(Y)
# Poor CLT approximation
pnorm(-9)
