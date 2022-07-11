# MechaCar_Statistical_Analysis

## Linear Regression to Predict MPG

    Call:
    lm(formula = mpg ~ vehicle_length + vehicle_weight + spoiler_angle + 
        ground_clearance + AWD, data = df_mpg)

    Residuals:
         Min       1Q   Median       3Q      Max 
    -19.4701  -4.4994  -0.0692   5.4433  18.5849 

    Coefficients:
                       Estimate Std. Error t value Pr(>|t|)    
    (Intercept)      -1.040e+02  1.585e+01  -6.559 5.08e-08 ***
    vehicle_length    6.267e+00  6.553e-01   9.563 2.60e-12 ***
    vehicle_weight    1.245e-03  6.890e-04   1.807   0.0776 .  
    spoiler_angle     6.877e-02  6.653e-02   1.034   0.3069    
    ground_clearance  3.546e+00  5.412e-01   6.551 5.21e-08 ***
    AWD              -3.411e+00  2.535e+00  -1.346   0.1852    
    ---
    Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

    Residual standard error: 8.774 on 44 degrees of freedom
    Multiple R-squared:  0.7149,    Adjusted R-squared:  0.6825 
    F-statistic: 22.07 on 5 and 44 DF,  p-value: 5.35e-11

The above snippet is the output of the summarized linear regression model for our `MechaCar_mpg.csv` dataset.

Reviewing the above output, we can see that Vehicle Length and Ground Clearance have p-values (`Pr(>|t|)`) less than 0.05 - `2.60e-12` and `5.21e-08`, respectively. This means that they provide a non-random amount of variance to the mpg values in our dataset.

The p-value for our linear regression analysis is `5.35e-11`. As a result, the slope of our linear model is *not* zero. As well, we can reject our null hypothesis.

This linear model predicts mpg of MechaCar prototypes reasonably well. Reviewing the above R-squared value (0.7149), we can say that there is a 71.49% probability that future data points will fit this linear model.

## Summary Statistics on Suspension Coils

### Table 1. Summary Statistics of PSI Values Table

| Mean    | Median | Variance         | SD               |
|---------|--------|------------------|------------------|
| 1498.78 | 1500   | 62.2935570469799 | 7.89262675203762 |

### Table 2. Summary Statistics of PSI Values *by Manufacturing Lot*

| Manufacturing_Lot | Mean    | Median | Variance          | SD                |
|-------------------|---------|--------|-------------------|-------------------|
| Lot 1             | 1500    | 1500   | 0.979591836734694 | 0.989743318610787 |
| Lot 2             | 1500.2  | 1500   | 7.46938775510204  | 2.73301806710128  |
| Lot 3             | 1496.14 | 1498.5 | 170.28612244898   | 13.0493724925369  |

Design specifications for the MechaCar suspension coils dictate that the variance of the suspension coils must not exceed 100 pounds per square inch. Collectively, this specification is met. Above, Table 1, shows the summary statistics for *all* manufacturing lots, where we see a variance of 62.29. *However*, reviewing Table 2, we see that Manufacturing Lot 3 has an exceedingly high variance of 170.29 pounds per square inch, which exceeds the amount allowed per our suspension coil specifications.

## T-Tests on Suspension Coils

### All Manufacturing Lots T-Test

        One Sample t-test

    data:  suspension_coil_data$PSI
    t = -1.8931, df = 149, p-value = 0.06028
    alternative hypothesis: true mean is not equal to 1500
    95 percent confidence interval:
     1497.507 1500.053
    sample estimates:
    mean of x 
      1498.78 

Assuming our significance level was the common 0.05%, our p-value of 0.06028 is above our significance level. Therefore, we do not have sufficient evidence to reject the null hypothesis, and we would state that the two means are statistically similar. To restate, the PSI across all manufacturing lots is *not* statistically different from the population mean.

### Lot 1 T-Test

        One Sample t-test

    data:  lot_subset$PSI
    t = 0, df = 49, p-value = 1
    alternative hypothesis: true mean is not equal to 1500
    95 percent confidence interval:
     1499.719 1500.281
    sample estimates:
    mean of x 
         1500 

### Lot 2 T-Test

        One Sample t-test

    data:  lot_subset$PSI
    t = 0.51745, df = 49, p-value = 0.6072
    alternative hypothesis: true mean is not equal to 1500
    95 percent confidence interval:
     1499.423 1500.977
    sample estimates:
    mean of x 
       1500.2 

### Lot 3 T-Test

        One Sample t-test

    data:  lot_subset$PSI
    t = -2.0916, df = 49, p-value = 0.04168
    alternative hypothesis: true mean is not equal to 1500
    95 percent confidence interval:
     1492.431 1499.849
    sample estimates:
    mean of x 
      1496.14 

As above, let's assume our significance level is the common 0.05%.

**Lot 1:**

Our p-value of 1 is above our significance level. We do not have sufficient evidence to reject the null hypothesis. The PSI for Lot 1 is not statistically different from the population mean.

**Lot 2:**

Our p-value of 0.6072 is above our significance level. We do not have sufficient evidence to reject the null hypothesis. The PSI for Lot 2 is not statistically different from the population mean.

**Lot 3:**

Our p-value of 0.04168 is below our significance level. We have sufficient evidence to reject the null hypothesis. The PSI for Lot 3 is statistically different from the population mean.

## Study Design: MechaCar vs Competition

For our study, we should concern ourselves with maintenance costs, especially with reliability and dependency in mind. JD Power's annual dependability report can be a North Star for many prospective car buyers. Below are the results of the 2022 dependability study.

![jd_2022_reliability](https://www.jdpower.com/sites/default/files/styles/large/public/image/2022-02/2022010a.JPG?itok=z4MTxG3y) ~Source:\ <https://www.jdpower.com/business/press-releases/2022-us-vehicle-dependability-study>~

For our study, we will group maintenance into mileage buckets, e.g. maintenance that needs to be done every 5k - 10k miles, 10k - 30k miles, 30k - 75k miles, and 75k - 100k miles. We will then assess the cost associated with each of these buckets and determine - for 1, 3, and 5 years of ownership - the cost to maintain a MechaCar vehicle. 

With our 1, 3, and 5 year cost of maintenance metrics in place, we must also gather the same data for a sample of competitors. 

**Null hypothesis**

A MechaCar's maintenance cost is equal to that of its competitors. 

**Alternative hypothesis** 

A MechaCar's maintenance cost is not equal to that of its competitors.

To test our hypothesis, we should use a two sample t-test for each of our 1, 3, and 5 year maintenance costs against our sample of competitor's maintenance costs.
