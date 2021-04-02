# Exercise 5.10
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

# New identity inequality E[|Z|^k]/t^k 
M3 = mean(abs(Z)^2)/t^2
M4 = mean(abs(Z)^4)/t^4
M5 = mean(abs(Z)^6)/t^6
M6 = mean(abs(Z)^8)/t^8

pdf("~/AllStatistics/files/ch5_10.pdf", width = 7, height = 5)
plot(t, P_Zgt/1e6, type="l",
     main="P(|Z|>t) for t in (0,5)",
     xlab = "t", ylab = "P(|Z| > t)", ylim=c(0, 1))
lines(t, M1, col="blue")
lines(t, M2, col="red")
lines(t, M3, col="green")
lines(t, M4, col="green")
lines(t, M5, col="green")
lines(t, M6, col="darkgreen")
legend(3.6, 1, legend=c("P(|Z|>t)", "Mill's bound","Markov's bound", "New bounds"),
       col=c("black","red", "blue", "green"), lty=1, cex=0.9)
dev.off()
