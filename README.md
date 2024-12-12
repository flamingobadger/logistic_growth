## Question 1: Logistic Growth Analysis & Estimates for $N_0$, $r$ and $K$

### Introduction

* This analysis was conducted to estimate key parameters of a population of *Escherichia coli* bacteria under logistic growth 
* 100μl of *E.coli* bacteria were suspended in 900μl of growth media, totalling 1ml. Population size (*N*) was recorded at 60 minute time intervals (t), and this data showing change to the population isolate over time is in the experiment.csv file.
* These observations can be used to to estimate the values of initial population size ($N_0$), growth rate ($r$) and carrying capacity (K)

### Plotting raw data

**Logistic growth plot**

* In  "plot_data.R" script I used the "ggplot2" package to firstly plot population ($N$) over time ($t$) in order to visualise how the population size changes over time. This gives a graph with an S-shaped curve which is characteristic of logistic growth.
  
* The population initially is in a lag phase as the population is adjusting to the environment of the growth medium and N is small so there are fewer individuals reproducing. After N increases, the population then experiences exponential growth as the concentration of resources in the environment are abundant. The depletion of resources and increase in competition then results in a deceleration phase, and the population then stabilises around the carrying capacity ($K$).

**Logistic growth plot after logarithmic transformation**
  
* As the growth curve appeared logistic, I produced a second plot that was semilog, transforming the y variable by log 10. This results in the exponential phase of logistic growth into a straight line meaning it is easier to analyse and estimate the intrinsic growth rate ($r$)

### Fitting linear models

* In the "fit_linear_model_R" script, I then used the "dyplr" package to filter the dataset.

**Case 1: $K$ >> $N_0$**
* In case 1, I created a data subset where N was below the carrying capacity ($K$) which occurs when $t$ is low ($t$>1500) and therefore growth is exponential. 
* I used the "mutate" function to make a new column where values of N are logarithmic. By transforming $N$ to ln($N$), the relationship becomes linear and it is possible to fit a simple linear regression model
* I then used the "lm" function to fit a linear model of ln($N$) against $t$. The intercept of the linear model can be used to estimate initial population size ($N_0$) and the gradient can be used to estimate intrinsic population growth rate ($r$)

**Case 2: $N(t)$ = $K$**

* Also in the "fit_linear_model_R" script I created a second subset where the population has reached carrying capacity so $N$($t$) = $K$. I made $t$ >3000 as this is where the population had reached equilibrium.
* Again, I fit a linear model which can be used to estimate $K$ from the intercept

### Logistic Model

* In the "plot_data_and_model.R" script I created a function which defines a logistic growth model, and plotted N against t to see how well the data fit a logistic model
* The plot below visualises the observed data (black dots) against the logistic growth model (red). The observed data closely follows a the logistic model prediction and is a typical logistic growth pattern 

![image](https://github.com/user-attachments/assets/86b37b39-99ba-4f7a-839b-bd10a9250241)

### Results:

* From the intercept of my first linear model I could estimate $N_0$ to be 985 ($e$ <sup>6.8941709</sup>)
* From the slope of my first linear model I could estimate $r$ to be 0.0100086
* The slope of my second linear model meant I could estimate $K$ to be 60000000000 (6.000$e$+10)
   
* This gives the estimates of $N0$ = 985, $r$ = 0.010086, and $K$ = 6.000e+10

## Question 2: Calculating population size at $t$ = 4980 minutes

* Assuming the population grows exponentially, at: $t$ = 4980 min, $N$ = $N_0$*exp(r*t) = 985*exp(0.010086*4980) = **6$e$+10**
  
* Whereas under exponential growth, at t = 4980 min, N = (N0*K*exp(r*t))/(K-N_0+N_0*exp($r$*$t$)) = (985*6.000$e$+10(0.010086*4980))/ (6.000$e$+10-985*exp(0.010086*4980)) = **6.42$e$+24**

* The estimate under under exponential growth is less than under logistic growth because growth under logistic growth is limited by the population's carrying capacity.
* The exponential model assumes population growth is not limited by density dependent factors so is unbounded, with no effects of resource depletion, competition or build up of toxic waste. The introduction of a carrying capacity for logistic growth is more realistic, and models the effects of limiting factors

## Question 3: Comparing exponential and logistic growth curves

* My code for the plot below is in the "exp_log_plot.png"
  
* The graph shows how when logistic growth occurs (blue line), the population is limited by its carrying capacity. Whereas for exponential growth (purple line), the population grows without bounds

![My Plot](exp_log_plot.png)
