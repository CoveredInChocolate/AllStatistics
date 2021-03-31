# Simulating X-Y
N = 10000
X = runif(N)
Y = runif(N)
d1 = X - Y
hist(d1, breaks = 50, prob = TRUE,
     main="Histogram of X-Y")

# Simulating X/Y
N = 1000000
X = runif(N)
Y = runif(N)
d2 = X/Y
d3 = d2[abs(d2) < 3] # Removing very rare large vals
d3 = d3*length(d2)/length(d3) # Normalizing probability
hist(d3, breaks=60, prob=TRUE,
     main = "Histogram of X/Y")

# pdf("~/AllStatistics/files/ch2_2.20b.pdf",
#    width = 4.5, height = 4)
# hist(d3, breaks=60, prob=TRUE,
#      main = "Histogram of X/Y")
# dev.off()

d3 = d2[d2 < 2 | d2 > 0] 
hist(d3)
hist(d3, breaks = 5000, prob = TRUE, xlim=c(0,2))
