# 7.7

############################################# Functions
# Empirical distribution
Fhat <- function(x, vector) {
  # Summing up number of values smaller than x
  # Divided by n (the length of the vector)
  
  if (length(x) == 1) {
    # If 'x' is a value
    prob = sum(vector <= x)/length(vector)
    return(prob)
  } else {
    # If 'x' is a vector
    prob = rep(0, length(x))
    for (i in 1:length(x)) {
      prob[i] = sum(vector <= x[i])/length(vector)
    }
    return(prob)
  }
}

# Calculating bound
CalculateBounds <- function(Festimate, bound) {
  Fbound = Festimate + bound
  return(Fbound)
} 


############################################# Main Script

# Reading Fiji Earthquake data
fq = read.table("~/AllStatistics/data/fijiquakes.dat", header = TRUE)

n = nrow(fq) # There are 1000 data points
alpha = 0.05
bound = sqrt(1/(2*n)*log(2/alpha))

# Testing some values
summary(fq$mag)
Fhat(3.9, fq$mag)
Fhat(4.59, fq$mag)
Fhat(4.6, fq$mag)
Fhat(4.9, fq$mag)
Fhat(6.4, fq$mag)

# Defining xval and calculating the CDF
xval = seq(from=3.9, to=6.4, length.out=1000)
length(xval)
xval
# Estimated F
Fest = Fhat(xval, fq$mag)
Fest
Fupper = CalculateBounds(Fest, bound)
Fupper = pmin(Fupper, 1)
Flower = CalculateBounds(Fest, -bound)
Flower = pmax(Flower, 0)

plot(xval, Fest, type="l", main="Estimate of CDF",
     xlab="x (mag)", ylab="F(x)", ylim=c(0, 1.05), xlim=c(3.9, 6.4))
lines(xval, Fupper, type="l", col="red")
lines(xval, Flower, type="l", col="red")

# pdf("~/AllStatistics/files/ch7_7.pdf", width = 5, height = 4)
# plot(xval, Fest, type="l", main="Estimate of CDF",
#      xlab="x (mag)", ylab="F(x)", ylim=c(0, 1.05), xlim=c(3.9, 6.4))
# lines(xval, Fupper, type="l", col="red")
# lines(xval, Flower, type="l", col="red")
# dev.off()

# plot(sort(fq$mag), type="l")

####################################### Standard error for F(4.9) - F(4.3)
Fhat(4.9, fq$mag)
Fhat(4.3, fq$mag)

# As found in exercise 7.6
theta = Fhat(4.9, fq$mag) - Fhat(4.3, fq$mag)
sError = sqrt((theta*(1-theta))/n)
CIupper = theta + qnorm(0.975)*sError
CIlower = theta - qnorm(0.975)*sError
cat("'95% Confidence Interval for F(4.9) - F(4.3):'
       (", round(CIlower, 3) ,",", round(CIupper, 3),")\n" )

