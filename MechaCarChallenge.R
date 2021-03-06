library(dplyr)

# 1. Linear Regression to Predict MPG

# load mpg data
mpg_data <- read_csv('MechaCar_mpg.csv', show_col_types=FALSE)

# perform linear regression on mpg data
lin_reg_mpg <- lm(
  mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD,
  mpg_data
  )

# save linear regression as text for later use, if necessary
sink('outputs/lin_reg_mpg.txt')
print(lin_reg_mpg)
sink()

# retrieve the summary of our linear regression model
lin_reg_mpg_summary <- summary(lin_reg_mpg)

# save the above summary as text for later use, if necessary
sink('outputs/lin_reg_mpg_summary.txt')
print(lin_reg_mpg_summary)
sink()


###
# 2. Summary Statistics on Suspension Coils

# load the suspension coil data
suspension_coil_data <- read_csv('Suspension_Coil.csv', show_col_types = FALSE)

# retrieve summary statistics for psi in our suspension coil data
total_summary <- summarize(
  suspension_coil_data,
  Mean = mean(PSI), 
  Median = median(PSI),
  Variance = var(PSI), 
  SD = sd(PSI),
  .groups = 'keep'
  )

# save above summary statistics as text for later use, if necessary
print(total_summary)
write.table(
  total_summary, 
  file = 'outputs/total_summary.txt', 
  sep = '\t',
  row.names = FALSE, 
  col.names = NA
  )

# retrieve summary statistics for psi in our suspension coil data, grouped by manufacturing lot
lot_summary <- summarize(
  group_by(
    suspension_coil_data, 
    Manufacturing_Lot
    ),
  Mean = mean(PSI), 
  Median = median(PSI),
  Variance = var(PSI), 
  SD = sd(PSI),
  .groups = 'keep'
)

# save above summary statistics as text for later use, if necessary
print(lot_summary)
write.table(
  lot_summary, 
  file = 'outputs/lot_summary.txt', 
  sep = '\t',
  row.names = TRUE, 
  col.names = NA
)

### 
# 3. T-Tests on Suspension Coils

# grab the population mean for PSI
population_mean <- 1500 # the deliverable requirements state this should be 1500, but this is *not* the actual mean

# perform T-Test on PSI data against the population mean
sus_coil_t_test <- t.test(suspension_coil_data$PSI, mu=population_mean)

# save T-Test results as text for later use, if needed
sink('outputs/sus_coil_t_test.txt')
print(sus_coil_t_test)
sink()

# loop through each lot, grab the subset from the loaded dataset
# then perform a t-test and save the results as text
for (lot in lot_summary$Manufacturing_Lot) {
  lot_subset <- subset(suspension_coil_data, Manufacturing_Lot==lot)
  t_test <- t.test(lot_subset$PSI, mu=population_mean)
  sink(paste('outputs/', lot, '_t_test.txt'))
  print(t_test)
  sink()
} 


