# 2.23 - Simulating a conditional probability
options(digits=8)
numberOfTosses = 10000
A = c(2, 3, 4, 5, 6)
B = c(2, 4, 6, 8)
AandB = intersect(A, B)

dieTosses = sample(1:6, size = numberOfTosses, replace = TRUE)
coinTosses = sample(1:2, size = numberOfTosses, replace = TRUE)
jointToss = dieTosses*coinTosses

# Calculating P(A), P(B), P(A)*P(B) and P(A cap B)
PA = sum(jointToss %in% A)/numberOfTosses
PB = sum(jointToss %in% B)/numberOfTosses
PAandB = sum(jointToss %in% AandB)/numberOfTosses

# Output
PA
PB
PA*PB
PAandB
