N = 10000
X = rnorm(N)
Xmean = cumsum(X)/1:N
plot(1:N, Xmean, type="l", ylim = c(-0.2, 0.2),
     main = "Mean of X N(0,1)")
abline(h = 0, col="red")

Y = rcauchy(N)
Ymean = cumsum(Y)/1:N
plot(1:N, Ymean, type="l",
     main = "Mean of Cauchy")


pdf("~/AllStatistics/files/ch3_3.9A.pdf", width = 4.7747, height = 4)
plot(1:N, Xmean, type="l",ylim = c(-0.2, 0.2),
     main = "Mean of N(0,1)")
abline(h = 0, col="red")
dev.off()
pdf("~/AllStatistics/files/ch3_3.9B.pdf", width = 4.7747, height = 4)
plot(1:N, Ymean, type="l",
     main = "Mean of Cauchy")
dev.off()
