library(dplyr)

df <- read_csv('MechaCar_mpg.csv')

lin_reg <- lm(
  mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD,
  df
  )

lin_reg_summary = summary(lin_reg)


