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

This linear model predicts mpg of Mechacar prototypes reasonably well. Reviewing the above R-squared value (0.7149), we can say that there is a 71.49% probability that future data points will fit this linear model.

## Summary Statistics on Suspension Coils

### Summary Statistics of PSI Values

| Mean    | Median | Variance         | SD               |
|---------|--------|------------------|------------------|
| 1498.78 | 1500   | 62.2935570469799 | 7.89262675203762 |

### Summary Statistics of PSI Values *by Manufacturing Lot*

| Manufacturing_Lot | Mean    | Median | Variance          | SD                |
|-------------------|---------|--------|-------------------|-------------------|
| Lot 1             | 1500    | 1500   | 0.979591836734694 | 0.989743318610787 |
| Lot 2             | 1500.2  | 1500   | 7.46938775510204  | 2.73301806710128  |
| Lot 3             | 1496.14 | 1498.5 | 170.28612244898   | 13.0493724925369  |
