pacman::p_load(haven,
               dplyr
               )

# Read data using readxl
data_m600 <- read_dta("./input/m600_noth.dta")

# Eliminar filas con valores NA en cualquier columna
data_m600_clean <- data_m600 |>
  drop_na()  # Elimina filas con cualquier valor NA

# Save in RDS format
saveRDS(data_m600_clean, file = "input/clean_data.rds")





