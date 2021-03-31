simExp = function(beta, N){
  U = runif(N)
  return(-beta*log(1 - U))
}
# Simulating
expRND = simExp(beta = 2/3, N = 50000)
# Making plot
hist(expRND, breaks=80,
     xlim=c(0, 5), prob=TRUE)
lines(density(expRND), col="red", xlim=c(0,5), lwd=2)


# pdf("~/AllStatistics/files/ch2_2.15.pdf",
#     width = 4, height = 4)
# hist(expRND, breaks=80,
#      xlim=c(0, 5), prob=TRUE)
# lines(density(expRND), col="red", xlim=c(0,5), lwd=2)
# dev.off()
