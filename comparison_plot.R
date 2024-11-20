#Making a graph comparing exponential and logistic growth curves 

#Necessary packages
library(ggplot2)

#loading data
growth_data <- read.csv("experiment.csv")

#exponential growth function
expon_fun <- function(t) {
  N <- N0*exp(r*t)
  return(N)
}

#logistical growth function
log_fun <- function(t) {
  N <- (N0*K*exp(r*t))/(K-N0+N0*exp(r*t))
  return(N)
}

#my estimated parameters
N0 <- 985       #initial pop size
r <- 0.010086    #growth rate
K <- 6.000e+10   #carrying capacity
t <- c(1:5000)  #time

#computing values for exponential and logistic growth
exp_growth <- sapply(t, function(time) expon_fun(time))
log_growth <- sapply(t, function(time) log_fun(time))

#making a dataframe for plotting
growth_df <- data.frame(
  time = t,                 
  exponential = exp_growth, 
  logistic = log_growth)

comparison_fig <- ggplot(growth_df, aes(x = time)) +
  geom_line(aes(y = exponential, colour = "Exponential")) +
  geom_line(aes(y = logistic, colour = "Logistic")) +
  scale_colour_manual(values = c("Exponential" = "pink", "Logistic" = "blue")) +
  scale_y_log10() +  #setting y-axis to logarithmic scale
  labs(
    x = "Time (minutes)",
    y = "Population size of of E. coli (log scale)",
    colour = "Growth Model",
    title = "Comparison of Exponential and Logistic Growth Curves"
  ) +
  theme_minimal() +
  theme(plot.title = element_text(hjust = 0.5))

#displaying the plot
print(comparison_fig)

