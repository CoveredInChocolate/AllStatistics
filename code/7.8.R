# 7.8

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



# # Dat-file with info text... thanks! >:|
# of = read.table("~/AllStatistics/data/faithful.dat", header = TRUE, skip = 25)
# write.csv(of, "~/AllStatistics/data/faithful.csv", row.names = FALSE)

# Reading Old Faithful data
of = read.csv("~/AllStatistics/data/faithful.csv")
n = nrow(of)

# Viewing the data
plot(sort(of$waiting), type="l")

# Estimating the mean with the sample mean
Xbar = mean(of$waiting)

# Variance
Xvar = sum((of$waiting - Xbar)^2)/n

# Standard error for the mean
seError = sqrt(Xvar)

CIupper = Xbar + qnorm(0.95)*seError
CIlower = Xbar - qnorm(0.95)*seError

  
# Calculating the empirical distribution
xval = seq(from=43, to=96)
Femp = Fhat(xval, of$waiting)
plot(xval, Femp, type="l")

# Estimating median from the empirical distribution
# Finding the smallest xvalue with a probabilitiy larger than 0.5
indexes = which(Femp >= 0.5)
smallestIndex = min(indexes)
xvalMedian = xval[smallestIndex]


##### Output

# Mean
sprintf("Sample mean: %2.3f", Xbar)
# 90% confidence interval
sprintf("90%% Confidence interval: (%.3f, %.3f)", CIlower, CIupper)
# Median
sprintf("Median at: %2.f, with probability %2.2f", xvalMedian, Fhat(xvalMedian, of$waiting))
