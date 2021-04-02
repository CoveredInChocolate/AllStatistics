# 5.9
##################### Exercise
# Simulating the conditions in the exercise
NSIM = 1000*1000
n = 5
X = sample(c(-1,1), size=NSIM, replace = TRUE)
Xn = sample(c(0, exp(n)), size=NSIM, replace = TRUE, prob = c(1-1/n, 1/n))
# Using 0 as a temporary value, and then replacing with simulated X
ind = Xn == 0
Xn[ind] = X[ind]  
# Theoretical vs. Simulated
mean(Xn)
exp(n)/n
var(Xn)
(1 - 1/n) + (1/n - 1/n^2)*exp(2*n)


##################### Investigating with a simplified example
# What does it mean when we have X inside another random variable?
# How does it affect the mean?

# Simplified example, where we toss a die
# But instead of 6, we have p=1/2 of either 6 or -6 happening
NSIM = 1000000

# Simulate NSIM coin tosses
coinToss = sample(c(-6, 6), size = NSIM, replace = TRUE)

# Simulating a die
dieToss = sample(1:6, size = NSIM, replace = TRUE)
dieTossORG = dieToss

# Replacing 6 with coinToss result
ind = dieToss == 6
dieToss[ind] = coinToss[ind]  

# Comparing original dietossORG to altered dietoss
# The expectation of the altered die toss
# counts the -6 vs. 6 alteration as 0, i.e. its expectation
mean(dieTossORG)
21/6
mean(dieToss)
15/6
# Variance - first second moment (sm)
smORG = sum((1:6)^2/6)
vrORG = smORG - (21/6)^2
vrORG
var(dieTossORG)
# For the altered die toss, we use 6 again
# Which is the square root of E[d^2] = 1/2((-6)^2 + (6)^2) = 36
sm = sum((c(1:5, 6))^2/6)
vr = sm - (15/6)^2
vr
var(dieToss)
# Interesting example - but the expectation is calculated with
# conditional expectation... of course!








