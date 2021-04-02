# 5.11
NSIM = 10000

calcCDF <- function(vars) {
  xval = -999:1000/1000
  N = length(xval)
  cdfVal = rep(0, N)
  for(i in 1:N) {
    cdfVal[i] = sum(vars < xval[i])
  } 
  cdfVal = cdfVal/max(cdfVal)
  return(cdfVal)
}

pdf("~/AllStatistics/files/ch5_11.pdf",
    width = 5, height = 4)
for(n in c(5000, 1000, 500, 200, 100, 50, 25, 15, 10, 5, 2, 1)) {
  xval = -999:1000/1000
  Xn = rnorm(NSIM, mean = 0, sd = 1/sqrt(n))
  if (n == 5000) {
    c1 = calcCDF(Xn)
    plot(xval, c1, xlim = c(-1, 1), main="CDF of N(0, 1/n)",
         col="black", type="l", ylab = "CDF", xlab = "Xn")
  } else {
    c2 = calcCDF(Xn)
    lines(xval, c2, type="l", col="gray")
  }
} 
# Plotting black curve again
n = 5000
Xn = rnorm(NSIM, mean = 0, sd = 1/sqrt(n))
lines(xval, c1, type="l", col="black")
dev.off()
