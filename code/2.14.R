simulateUnitCircle = function(N) {  
  TR = runif(N)
  UR = runif(N); VR = runif(N)
  t = 2*pi*TR
  u = UR+VR
  u[u > 1] = 2 - u[u > 1]
  r = u
  X = r*cos(t)
  Y = r*sin(t)
  retVal = list()
  retVal$X = X 
  retVal$Y = Y
  return(retVal)
}
simVal = simulateUnitCircle(1000)
X = simVal$X
Y = simVal$Y
plot(X, Y)
pdf("~/AllStatistics/files/ch2_2.14.pdf",
    width = 4, height = 4)
plot(X, Y)
dev.off()

simVal = simulateUnitCircle(50000)
R = sqrt(simVal$X^2 + simVal$Y^2)
pdf("~/AllStatistics/files/ch2_2.14b.pdf",
    width = 4, height = 4)
hist(R, breaks = 40, prob = TRUE)
plot(X, Y)
dev.off()

hist(R, breaks = 40, prob = TRUE)
