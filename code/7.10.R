# 7.10

# Reading Cloud Seed data
cs = read.csv("~/AllStatistics/data/cloud-seeding.csv")

# Seeded clouds are X, Unseeded clouds are Y
X = cs$SeededClouds
Y = cs$UnseededClouds

# Sample mean
EX = mean(X)
EY = mean(Y)
# Difference
theta = EX - EY

# Sample variance and covariance
VarX = var(X)
VarY = var(Y)
CovXY = cov(X,Y)

# Standard Error
seTheta = sqrt(VarX + VarY - 2*CovXY)

# Calculating a 95% confidence interval for theta
CIupr = theta + pnorm(0.975)*seTheta
CIlwr = max(0, theta - pnorm(0.975)*seTheta)

# Output
theta   # Estimate of theta
seTheta # Standard error of theta
sprintf("CI: (%3.2f, %3.2f)", CIlwr, CIupr)
