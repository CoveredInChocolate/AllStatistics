# 2.21 - Plotting proportion of H vs T
n = 5000
p = 0.03
coinTosses = sample(c("H","T"), prob = c(p, 1-p), size = n, replace = TRUE)
proportionHeads = rep(0, n)
headCount = 0
for(i in 1:n) {
  if (coinTosses[i] == 'H') {
    headCount = headCount + 1
  } 
  proportionHeads[i] = headCount/i
} 

# Postscript
pdf("~/AllStatistics/ch2_2.21b.pdf")
plot(x = 1:n, y = proportionHeads, type = "l", ylim = c(0,0.1),
     main = paste0("Proportion heads for p=", p))
abline(h = p, col = "red", lty = "dashed")
dev.off()    





plot(x = 1:n, y = proportionHeads, type = "l", ylim = c(0,0.1),
     main = paste0("Proportion heads for p=", p))
abline(h = p, col = "red", lty = "dashed")
