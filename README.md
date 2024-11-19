## Question 1

### Analysis
* I used data from the experiment.csv file which I saved into a dataframe called growth_data. This file includes data showing the change to an E.coli population isolate over time when suspended in growth media.

* In  "plot_data.R" script I used the "ggplot2" package to firstly plot population (N) over time (t) in order to see how the population changes over time. Subsequently, as the growth curve appeared logistic, I produced a second plot that was semilog, transforming the y variable by log 10

* In the "fit_linear_model_R" script, I then used the "dyplr" package to filter the dataset. In case 1, I created a data subset where N was below the carrying capacity (K) which occurs when t is low (t>1500), using the "mutate" function to make a new column where values of N are logarithmic.  I then used the "lm" function to fit a linear model of N(log) against t, which we can use to estimate initial population size (N0) and intrinsic population growth rate (r)
  
* Also in the "fit_linear_model_R) script I created a second subset where the population has reached carrying capacity so N(t) = K and so made t>3000 as this is where the population had reached equilibrium. Again I fit a linear model which can be used to estimate K.

* In the "plot_data_and_model.R" script I created a function which defines a logistic growth model, and plotted N against t to see how well the data fit a logistic model

### Results:

* From the intercept of my first linear model I could estimate N0 to be 985 (e6.8941709)
* From the slope of my first linear model I could estimate r to be 0.0100086
* The slope of my second linear model meant I could estimate K to be 6.000e+10
   
* This gives the estimates of N0 = 985, r = 0.010086, and K = 6.000e+10 


## Question 2



