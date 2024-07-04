# # Carregue os pacotes
# library(readxl)
# library(dplyr)
# library(ggplot2)
# 
# # Caminhos dos arquivos para V001, V002 e V003
# files <- list(
#   V001 = "C:/Users/marco/OneDrive/Área de Trabalho/Externa/metrics_v001.xlsx",
#   V002 = "C:/Users/marco/OneDrive/Área de Trabalho/Externa/metrics_v002.xlsx",
#   V003 = "C:/Users/marco/OneDrive/Área de Trabalho/Externa/metrics_v003.xlsx"
# )
# 
# # Função para ler e processar cada arquivo
# read_and_process_file <- function(file_path, version) {
#   # Leia o arquivo XLSX
#   data <- read_excel(file_path)
# 
#   # Adicione a coluna de versão
#   data <- data %>%
#     mutate(version = version)
# 
#   return(data)
# }
# 
# # Processar arquivos e combinar os dados
# metrics_combined <- bind_rows(
#   lapply(names(files), function(version) {
#     read_and_process_file(files[[version]], version)
#   })
# )
# 
# # Plotar métricas
# plot_metrics <- function(metric_name) {
#   ggplot(metrics_combined, aes_string(x = "PARTICULA", y = metric_name, fill = "VERSAO")) +
#     geom_bar(stat = "identity", position = "dodge") +
#     labs(title = paste("Granulometria", metric_name),
#          x = "",
#          y = metric_name) +
#     theme_minimal(base_size = 15) +
#     theme(
#       panel.background = element_rect(fill = "white", colour = "white"),
#       plot.background = element_rect(fill = "white", colour = "white"),
#       legend.background = element_rect(fill = "white", colour = "white"),
#       legend.key = element_rect(fill = "white", colour = "white"),
#       plot.title = element_text(size = 20, face = "bold"),
#       axis.title.x = element_text(size = 16),
#       axis.title.y = element_text(size = 16),
#       axis.text.x = element_text(size = 14, angle = 45, hjust = 1),
#       axis.text.y = element_text(size = 14),
#       legend.title = element_text(size = 16),
#       legend.text = element_text(size = 14)
#     )
# }
# 
# # Lista de métricas
# metrics_names <- c("ME", "MSE", "MAE", "RMSE", "NSE", "Rsquared", "CCC")
# 
# # Gerar gráficos para todas as métricas e salvar em PNG
# for (metric in metrics_names) {
#   plot <- plot_metrics(metric)
#   print(plot)
#   ggsave(filename = paste0("C:/Users/marco/OneDrive/Área de Trabalho/Externa/", metric, "_comparison.png"), plot = plot, bg = "white", width = 10, height = 6)
# }

# # Carregue os pacotes
# library(readxl)
# library(dplyr)
# library(ggplot2)
# 
# # Caminhos dos arquivos para V000, V001, V002 e V003
# files <- list(
#   V000 = "C:/Users/marco/OneDrive/Área de Trabalho/Externa/metrics_v000.xlsx",
#   V001 = "C:/Users/marco/OneDrive/Área de Trabalho/Externa/metrics_v001.xlsx",
#   V002 = "C:/Users/marco/OneDrive/Área de Trabalho/Externa/metrics_v002.xlsx",
#   V003 = "C:/Users/marco/OneDrive/Área de Trabalho/Externa/metrics_v003.xlsx"
# )
# 
# # Função para ler e processar cada arquivo
# read_and_process_file <- function(file_path, version) {
#   # Leia o arquivo XLSX
#   data <- read_excel(file_path)
#   
#   # Adicione a coluna de versão
#   data <- data %>%
#     mutate(version = version)
#   
#   return(data)
# }
# 
# # Processar arquivos e combinar os dados
# metrics_combined <- bind_rows(
#   lapply(names(files), function(version) {
#     read_and_process_file(files[[version]], version)
#   })
# )
# 
# # Converter valores das métricas para numéricos
# metrics_combined <- metrics_combined %>%
#   mutate(across(c("ME", "MSE", "MAE", "RMSE", "NSE", "Rsquared", "CCC"), as.numeric))
# 
# # Plotar métricas
# plot_metrics <- function(metric_name) {
#   min_y <- min(metrics_combined[[metric_name]], na.rm = TRUE)
#   max_y <- max(metrics_combined[[metric_name]], na.rm = TRUE)
#   
#   ggplot(metrics_combined, aes(x = PARTICULA, y = .data[[metric_name]], color = version)) +
#     geom_point(size = 3) +
#     labs(title = paste("Granulometria", metric_name),
#          x = "",
#          y = metric_name) +
#     scale_y_continuous(limits = c(min(0, min_y), max_y)) +
#     theme_minimal(base_size = 15) +
#     theme(
#       panel.background = element_rect(fill = "white", colour = "white"),
#       plot.background = element_rect(fill = "white", colour = "white"),
#       legend.background = element_rect(fill = "white", colour = "white"),
#       legend.key = element_rect(fill = "white", colour = "white"),
#       plot.title = element_text(size = 20, face = "bold"),
#       axis.title.x = element_text(size = 16),
#       axis.title.y = element_text(size = 16),
#       axis.text.x = element_text(size = 14, angle = 45, hjust = 1),
#       axis.text.y = element_text(size = 14),
#       legend.title = element_text(size = 16),
#       legend.text = element_text(size = 14)
#     )
# }
# 
# # Lista de métricas
# metrics_names <- c("ME", "MSE", "MAE", "RMSE", "NSE", "Rsquared", "CCC")
# 
# # Gerar gráficos para todas as métricas e salvar em PNG
# for (metric in metrics_names) {
#   plot <- plot_metrics(metric)
#   print(plot)
#   ggsave(filename = paste0("C:/Users/marco/OneDrive/Área de Trabalho/Externa/", metric, "_comparison_eixo.png"), plot = plot, bg = "white", width = 10, height = 6)
# }


# Carregue os pacotes
library(readxl)
library(dplyr)
library(ggplot2)

# Caminhos dos arquivos para V000, V001, V002 e V003
files <- list(
  V000 = "C:/Users/marco/OneDrive/Área de Trabalho/Externa/metrics_v000.xlsx",
  V001 = "C:/Users/marco/OneDrive/Área de Trabalho/Externa/metrics_v001.xlsx",
  V002 = "C:/Users/marco/OneDrive/Área de Trabalho/Externa/metrics_v002.xlsx",
  V003 = "C:/Users/marco/OneDrive/Área de Trabalho/Externa/metrics_v003.xlsx"
)

# Função para ler e processar cada arquivo
read_and_process_file <- function(file_path, version) {
  # Leia o arquivo XLSX
  data <- read_excel(file_path)
  
  # Adicione a coluna de versão
  data <- data %>%
    mutate(version = version)
  
  return(data)
}

# Processar arquivos e combinar os dados
metrics_combined <- bind_rows(
  lapply(names(files), function(version) {
    read_and_process_file(files[[version]], version)
  })
)

# Converter valores das métricas para numéricos
metrics_combined <- metrics_combined %>%
  mutate(across(c("ME", "MSE", "MAE", "RMSE", "NSE", "Rsquared", "CCC"), as.numeric))

# Função para definir limites do eixo y de acordo com a métrica
get_y_limits <- function(metric_name) {
  min_y <- min(metrics_combined[[metric_name]], na.rm = TRUE)
  max_y <- max(metrics_combined[[metric_name]], na.rm = TRUE)
  c(floor(min_y), ceiling(max_y))
}

# Plotar métricas
plot_metrics <- function(metric_name) {
  y_limits <- get_y_limits(metric_name)
  
  ggplot(metrics_combined, aes(x = PARTICULA, y = .data[[metric_name]], fill = version)) +
    geom_bar(stat = "identity", position = position_dodge()) +
    labs(title = paste("Granulometria", metric_name),
         x = "",
         y = metric_name) +
    scale_y_continuous(limits = y_limits, breaks = seq(y_limits[1], y_limits[2], length.out = 6)) +
    theme_minimal(base_size = 15) +
    theme(
      panel.background = element_rect(fill = "white", colour = "white"),
      plot.background = element_rect(fill = "white", colour = "white"),
      legend.background = element_rect(fill = "white", colour = "white"),
      legend.key = element_rect(fill = "white", colour = "white"),
      plot.title = element_text(size = 20, face = "bold"),
      axis.title.x = element_text(size = 16),
      axis.title.y = element_text(size = 16),
      axis.text.x = element_text(size = 14, angle = 45, hjust = 1),
      axis.text.y = element_text(size = 14),
      legend.title = element_text(size = 16),
      legend.text = element_text(size = 14)
    )
}

# Lista de métricas
metrics_names <- c("ME", "MSE", "MAE", "RMSE", "NSE", "Rsquared", "CCC")

# Gerar gráficos para todas as métricas e salvar em PNG
for (metric in metrics_names) {
  plot <- plot_metrics(metric)
  print(plot)
  ggsave(filename = paste0("C:/Users/marco/OneDrive/Área de Trabalho/Externa/", metric, "_comparison_dnv.png"), plot = plot, bg = "white", width = 10, height = 6)
}



# # Carregue os pacotes
# library(readxl)
# library(dplyr)
# library(ggplot2)
# 
# # Caminhos dos arquivos para V001, V002 e V003
# files <- list(
#   V001 = "C:/Users/marco/OneDrive/Área de Trabalho/Externa/metrics_v001.xlsx",
#   V002 = "C:/Users/marco/OneDrive/Área de Trabalho/Externa/metrics_v002.xlsx",
#   V003 = "C:/Users/marco/OneDrive/Área de Trabalho/Externa/metrics_v003.xlsx"
# )
# 
# # Função para ler e processar cada arquivo
# read_and_process_file <- function(file_path, version) {
#   # Leia o arquivo XLSX
#   data <- read_excel(file_path)
#   
#   # Adicione a coluna de versão
#   data <- data %>%
#     mutate(version = version)
#   
#   return(data)
# }
# 
# # Processar arquivos e combinar os dados
# metrics_combined <- bind_rows(
#   lapply(names(files), function(version) {
#     read_and_process_file(files[[version]], version)
#   })
# )
# 
# # Plotar métricas
# plot_metrics <- function(metric_name) {
#   ggplot(metrics_combined, aes_string(x = "PARTICULA", y = metric_name, color = "VERSAO")) +
#     geom_point(size = 3) +
#     labs(title = paste("Granulometria", metric_name),
#          x = "",
#          y = metric_name) +
#     theme_minimal(base_size = 15) +
#     theme(
#       panel.background = element_rect(fill = "white", colour = "white"),
#       plot.background = element_rect(fill = "white", colour = "white"),
#       legend.background = element_rect(fill = "white", colour = "white"),
#       legend.key = element_rect(fill = "white", colour = "white"),
#       plot.title = element_text(size = 20, face = "bold"),
#       axis.title.x = element_text(size = 16),
#       axis.title.y = element_text(size = 16),
#       axis.text.x = element_text(size = 14, angle = 45, hjust = 1),
#       axis.text.y = element_text(size = 14),
#       legend.title = element_text(size = 16),
#       legend.text = element_text(size = 14)
#     )
# }
# 
# # Lista de métricas
# metrics_names <- c("ME", "MSE", "MAE", "RMSE", "NSE", "Rsquared", "CCC")
# 
# # Gerar gráficos para todas as métricas e salvar em PNG
# for (metric in metrics_names) {
#   plot <- plot_metrics(metric)
#   print(plot)
#   ggsave(filename = paste0("C:/Users/marco/OneDrive/Área de Trabalho/Externa/", metric, "_comparison_point.png"), plot = plot, bg = "white", width = 10, height = 6)
# }
