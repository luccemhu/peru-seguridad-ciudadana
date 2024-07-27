create_trend_plot <- function(data, selected_department, color) {
  # Filtrar los datos para el departamento seleccionado y eliminar valores NA
  filtered_data <- data %>%
    na.omit() %>%
    filter(nombredd == selected_department)
  
  # Crear el gráfico de tendencia
  plot <- ggplot(
    filtered_data,
    aes(x = periodo, y = dvictim, color = "Victimización")
  ) +
    geom_line(size = 1) +
    geom_point(size = 3) +
    geom_line(aes(x = periodo, y = dperinseg, color = "Percepción de Inseguridad"), linetype = "dashed", size = 1) +
    geom_point(aes(x = periodo, y = dperinseg, color = "Percepción de Inseguridad"), size = 3) +
    scale_color_manual(values = c("Victimización" = color, "Percepción de Inseguridad" = "red")) +
    labs(
      x = "Año",
      y = "Tasa",
      title = selected_department,
      color = "Leyenda"
    ) +
    theme_minimal() +
    theme(legend.position = "bottom")
  
  return(plot)
}
