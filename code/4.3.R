# 4.3(b): p = 0.4, alpha = 0.05 [4.3.R]  
simBern <- function(n) {  # Simulate Bernoulli
  NSIM = 1000 # Do 1000 simulations per n
  simulationList = matrix(rep(0, n*NSIM), nrow = NSIM)
  for (i in 1:NSIM) {
    simulationList[i,1:n] = sample(c(1, 0), size=n,
                                   replace = TRUE, prob = c(0.4, 0.6))
  }
  return(simulationList)
} 
countCoverage <- function(sim, alpha) {
  N = ncol(sim); NSIM = nrow(sim)
  covRate = rep(0, NSIM)
  for (i in 1:NSIM) {
    mn = mean(sim[i, 1:N])
    if(abs(0.4 - mn) < 0.05) {
      covRate[i] = 1 
    }
  } 
  hitRate = sum(covRate)/NSIM
  print(hitRate)
} 
# Bernoulli simulations
bsim10 = simBern(10)
bsim50 = simBern(50)
bsim100 = simBern(100)
bsim200 = simBern(200)
bsim300 = simBern(300)
bsim2000 = simBern(2000)
countCoverage(bsim10, alpha=0.05)
countCoverage(bsim50, alpha=0.05)
countCoverage(bsim100, alpha=0.05)
countCoverage(bsim2000, alpha=0.05)


nvec = c(10, 50, 100, 2000)
cvec = c(countCoverage(bsim10, alpha=0.05),
         countCoverage(bsim50, alpha=0.05),
         countCoverage(bsim100, alpha=0.05),
         countCoverage(bsim2000, alpha=0.05))
pdf("~/AllStatistics/files/ch4_4.pdf", width = 7, height = 5)
plot(as.factor(nvec), cvec, main="n vs. Coverage",
     xlab = "n", ylab = "Coverage rate")
dev.off()


# Plotting length of interval
IntervalLength <- function(sim) {
  N = ncol(sim); NSIM = nrow(sim)
  intLength = rep(0, NSIM)
  for (i in 1:NSIM) {
    mn = mean(sim[i, 1:N])
    intLength[i] = 2*abs(0.4 - mn) 
  } 
  print(mean(intLength))
} 
IntervalLength(bsim10)
IntervalLength(bsim50)
IntervalLength(bsim100)
IntervalLength(bsim200)
IntervalLength(bsim300)
IntervalLength(bsim2000)

nvec = c(10, 50, 100, 200, 300, 2000)
ivec = c(IntervalLength(bsim10),
         IntervalLength(bsim50),
         IntervalLength(bsim100),
         IntervalLength(bsim200),
         IntervalLength(bsim300),
         IntervalLength(bsim2000))
pdf("~/AllStatistics/files/ch4_4b.pdf", width = 7, height = 5)
plot(as.factor(nvec), ivec, main="n vs. Interval Length",
     xlab = "n", ylab = "Interval Length")
abline(h = 0.05, col="red")
dev.off()
