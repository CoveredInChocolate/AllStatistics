# 7.3
n = 100
NSIM = 1000

alpha = 0.05
bnd = sqrt(1/(2*n)*log(2/alpha))

# Calculate CDF 
calcCDF <- function(vars) {
  xval = -1999:2000/1000 # from -2 to 2
  N = length(xval)
  cdfVal = rep(0, N)
  for(i in 1:N) {
    cdfVal[i] = sum(vars < xval[i])
  } 
  cdfVal = cdfVal/max(cdfVal)
  return(list(xval = xval, cdfval = cdfVal))
}

# Calculate CDF for Cauchy [needs different bounds] 
calcCDFCauchy <- function(vars) {
  xval = -149999:150000/1000 # from -150 to 150
  N = length(xval)
  cdfVal = rep(0, N)
  for(i in 1:N) {
    cdfVal[i] = sum(vars < xval[i])
  } 
  cdfVal = cdfVal/max(cdfVal)
  return(list(xval = xval, cdfval = cdfVal))
}

# Calculating the Dvoretzky-Kiefer-Wolfowitz bounds
# and checking if the true CDF is contained within
calcAndCheckBounds <- function(distType, xvals, simVector, bnd) {
  N = length(simVector)
  TRUEDIST = rep(0, N)
  if (distType == 'normal') {
    TRUEDIST = pnorm(xvals)
  } else {
    TRUEDIST = pcauchy(xvals)
  }      
  upperBound = simVector + bnd
  lowerBound = simVector - bnd
  checkUpper = upperBound - TRUEDIST 
  checkLower = TRUEDIST - lowerBound
  returnValue = 1
  # Check if there are any negative values in checkUpper/Lower
  # (which means F lies outside the bounds)
  if (sum(checkUpper < 0) > 0) {
    returnValue = 0
  }
  if (sum(checkLower < 0) > 0) {
    returnValue = 0
  }
  return(returnValue)
} 

######################### NORMAL DISTRIBUTION

# Simulation matrix - normal distribution
X = matrix(rnorm(n*NSIM), ncol = n)

# Summing proportion of bounds containing CDF
# 1 means the bound is contained
checkNorm = rep(0, NSIM)
for(i in 1:NSIM) {
  normSim = calcCDF(X[i, 1:n])
  checkNorm[i]  = calcAndCheckBounds("normal", normSim$xval, normSim$cdfval, bnd)
} 

######################### CAUCHY DISTRIBUTION

# Simulation matrix - Cauchy distribution
nc = 100
Y = matrix(rcauchy(nc*NSIM), ncol = nc)

# Summing proportion of bounds containing CDF
# 1 means the bound is contained
checkCauchy = rep(0, NSIM)
for(i in 1:NSIM) {
  cauchySim = calcCDFCauchy(Y[i, 1:nc])
  checkCauchy[i]  = calcAndCheckBounds("cauchy", cauchySim$xval, cauchySim$cdfval, bnd)
} 

# Summary
print("Proportion of normal distributions containing the CDF")
sum(checkNorm)/length(checkNorm)
print("Proportion of Cauchy distributions containing the CDF")
sum(checkCauchy)/length(checkCauchy)




# pdf("~/AllStatistics/files/ch7_3.pdf",
#     width = 5, height = 4)
# TRUENORM = rnorm(100000)
# TRUECDF = calcCDF(TRUENORM)
# plot(TRUECDF$xval, TRUECDF$cdfval, type="l", xlab = "x", ylab="F(x)",
#      main="True CDF vs. simulations")
# test = rnorm(100)
# test = calcCDF(test)
# lines(test$xval, test$cdfval, type="l", col="red")
# test = rnorm(100)
# test = calcCDF(test)
# lines(test$xval, test$cdfval, type="l", col="green")
# test = rnorm(100)
# test = calcCDF(test)
# lines(test$xval, test$cdfval, type="l", col="blue")
# lines(TRUECDF$xval, TRUECDF$cdfval, type="l")
# dev.off()


