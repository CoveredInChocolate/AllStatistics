N = 100000
lambda = 5

exp1 = rexp(N, rate = lambda)
exp2 = rexp(N, rate = lambda)
exp3 = rexp(N, rate = lambda)
exp4 = rexp(N, rate = lambda)
exp5 = rexp(N, rate = lambda)
exp6 = rexp(N, rate = lambda)
exp7 = rexp(N, rate = lambda)
exp8 = rexp(N, rate = lambda)
exp9 = rexp(N, rate = lambda)
exp10 = rexp(N, rate = lambda)

Y = pmax(exp1, exp2, exp3, exp4, exp5,
         exp6, exp7, exp8, exp9, exp10)

hist(Y, breaks = 50, prob = TRUE)
lines(density(Y), col="red", xlim=c(0,2.5), lwd=2)

# pdf("~/AllStatistics/files/ch2_2.21.pdf",
#     width = 5, height = 4)
# hist(Y, breaks = 50, prob = TRUE)
# lines(density(Y), col="red", xlim=c(0,5), lwd=2)
# dev.off()

XVAL = 1:2500/1000
YVAL = 50*exp(-5*XVAL)*(1 - exp(-5*XVAL))^9

plot(XVAL, YVAL)                     
