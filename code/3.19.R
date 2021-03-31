# Simulating the uniform distribution
N = 1000; mn = rep(0,N); vr = rep(0,N)
for (i in 1:N) {
  print(i)
  X = runif(n = i)
  mn[i] = mean(X)
  vr[i] = var(X)
} 
# Plotting result
plot(1:N, mn, type="l", ylim = c(0, 0.7))
lines(1:N, vr, type="l", col="red")
abline(h = 0.5, col = "blue", lty = 2)
abline(h = 1/12, col = "blue", lty = 2)

simSamplingDist <- function(numSim) {
  metaN = 1000
  retMean = rep(0, metaN)
  retVar = rep(0, metaN)
  for(i in 1:metaN) {
    sim = runif(numSim)
    retMean[i]  = mean(sim)
    retVar[i]  = var(sim)
  } 
  retVal = list()
  retVal$mn = retMean
  retVal$vr = retVal
  return(retVal)
} 

s1 = simSamplingDist(1)
s5 = simSamplingDist(5)
s25 = simSamplingDist(25)
s100 = simSamplingDist(100)
hist(s1$mn, main = "n = 1", xlim=c(0,1), prob = TRUE)
hist(s5$mn, main = "n = 5", xlim=c(0,1), prob = TRUE)
hist(s25$mn, main = "n = 25", xlim=c(0,1), prob = TRUE)
hist(s100$mn, main = "n = 100", xlim=c(0,1), prob = TRUE)

pdf("~/AllStatistics/files/ch3_19.pdf", width = 7, height = 5)
par(mfrow=c(2,2)) 
hist(s1$mn, main = "n = 1", xlim=c(0,1), prob = TRUE)
hist(s5$mn, main = "n = 5", xlim=c(0,1), prob = TRUE)
hist(s25$mn, main = "n = 25", xlim=c(0,1), prob = TRUE)
hist(s100$mn, main = "n = 100", xlim=c(0,1), prob = TRUE)
dev.off()






  