# Exercise 4.6 -[4.6.R]
# Plotting P(Z > t) as a function of t
Z = rnorm(1000000)
t = 1:2000/400 # t goes from 0 to 5
P_Zgt = rep(0, length(t))

for (i in 1:length(t)) {
  P_Zgt[i] = sum(abs(Z) > t[i])
} 
plot(t, P_Zgt/1e6, type="l",
     main="P(|Z|>t) for t in (0,5)")

# Markov's inequality E[|Z|]/t 
M1 = sqrt(2/pi)/t

# Mill's inequality
M2 = sqrt(2/pi)*exp(-t^2/2)/t

pdf("~/AllStatistics/files/ch4_6.pdf", width = 7, height = 5)
plot(t, P_Zgt/1e6, type="l",
     main="P(|Z|>t) for t in (0,5)",
     xlab = "t", ylab = "P(|Z| > t)", ylim=c(0, 1))
lines(t, M1, col="blue")
lines(t, M2, col="red")
legend(3.6, 1, legend=c("P(|Z|>t)", "Mill's bound","Markov's bound"),
       col=c("black","red", "blue"), lty=1, cex=0.9)
dev.off()

# Verifying the expected value E[|Z|] and var(|Z|) 
Z2 = rnorm(10000000)
mean(abs(Z2))
sqrt(2/pi)
