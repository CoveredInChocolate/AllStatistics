N = 100000
X = runif(N)
Y = runif(N)

# We know: Z = min{X, Y}
Z = pmin(X, Y)

# Comparing simualted vs. theoretical results
sum(Z > 0.5)/N
1/4
sum(Z > 0.25)/N
9/16
sum(Z > 0.75)/N
1/16


pdf("~/AllStatistics/files/ch2_2.7b.pdf", width = 4.7747, height = 4)
hist(Z, main = "Histogram of Z", prob=TRUE)
dev.off()
