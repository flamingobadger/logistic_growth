#Script to plot observed data and predicted model

growth_data <- read.csv("experiment.csv")

logistic_fun <- function(t) {
  
  N <- (N0*K*exp(r*t))/(K-N0+N0*exp(r*t))
  
  return(N)
  
}

N0 <- 985
  
r <- 0.010086
  
K <- 6.000e+10

ggplot(aes(x=t,y=N), data = growth_data) +
  
  geom_function(fun=logistic_fun, colour="red") +
  
  geom_point() +

  scale_y_continuous(trans='log10')

sink(file = "package-versions.txt")
sessionInfo()
sink()
