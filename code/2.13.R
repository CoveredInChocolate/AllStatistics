x = rnorm(10000)
y = exp(x)
pdf("~/AllStatistics/files/ch2_2.13b.pdf", width = 4.7747, height = 4)
hist(y, breaks = 200, xlim = c(0, 8), prob=TRUE)
lines(density(y), col="red", xlim=c(0,8), lwd=2)
dev.off()

hist(y, breaks = 200, xlim = c(0, 8), prob=TRUE)
lines(density(y), col="red", xlim=c(0,8), lwd=2)
# plot(d, xlim = c(0,20), col="red")
