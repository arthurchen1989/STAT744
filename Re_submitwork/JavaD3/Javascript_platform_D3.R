# This is a re-submit homework for the part networkD3:
# The part of simple Network:

# Create fake data


library(networkD3)
library(multiplex)
# Reference:
# https://christophergandrud.github.io/networkD3/

# Data Resource:
# http://www-personal.umich.edu/~mejn/netdata/
# Dolphin social networks

data <- read.gml('dolphins.gml')

networkData <- data.frame(data$S, data$R)

# Plot
simpleNetwork(networkData)