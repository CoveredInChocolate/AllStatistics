simStock <- function(N) {
  dailyMovements = sample(c(-1, 1), size=N, replace = TRUE)
  totalMovements = cumsum(dailyMovements)
  return(totalMovements)
} 

N = 10000
s1 = simStock(N);s2 = simStock(N)
s3 = simStock(N);s4 = simStock(N)
plot(1:N, s1, type="l",
     ylim=c(-119, 212), # Adjust according to simulation results
     main = "Stock simulation")
lines(1:N, s2, type="l", col="red")
lines(1:N, s3, type="l", col="blue")
lines(1:N, s4, type="l", col="green")

pdf("~/AllStatistics/files/ch3_11.pdf", width = 4.7747, height = 4)
plot(1:N, s1, type="l",
     ylim=c(-119, 212),
     main = "Stock simulation")
lines(1:N, s2, type="l", col="red")
lines(1:N, s3, type="l", col="blue")
lines(1:N, s4, type="l", col="green")
dev.off()