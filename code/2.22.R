# 2.22 - Binomial Random Variable
REP = 10  # Number of simulations per n
p = 0.3   # Probability of H

sim10 = rep(0, REP)
sim100 = rep(0, REP)
sim1000 = rep(0, REP)

# Simulating 10
for(i in 1:REP) {
  # 1 means head
  coinTosses = sample(c(1,0), prob = c(p, 1-p), size = 10, replace = TRUE)
  sim10[i] = sum(coinTosses) 
} 
# Simulating 100
for(i in 1:REP) {
  # 1 means head
  coinTosses = sample(c(1,0), prob = c(p, 1-p), size = 100, replace = TRUE)
  sim100[i] = sum(coinTosses) 
} 
# Simulating 1000
for(i in 1:REP) {
  # 1 means head
  coinTosses = sample(c(1,0), prob = c(p, 1-p), size = 1000, replace = TRUE)
  sim1000[i] = sum(coinTosses) 
} 
df = data.frame(
  SIM10 = sim10,
  SIM100 = sim100,
  SIM1000 = sim1000
)

# Output
df
apply(df, 2, mean)
