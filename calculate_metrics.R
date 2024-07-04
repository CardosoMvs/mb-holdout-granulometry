# Carregue os pacotes
library(readxl)
library(writexl)
library(yardstick)
library(dplyr)

# Defina a função de métricas de validação
my_summary_metrics <- function(data, lev = NULL, model = NULL) {
  
  # Esta função calcula diversas métricas a partir de vetores de previsões e observações
  regression_eval <- function(pred, obs){
    
    # Converter para vetores numéricos
    pred <- as.numeric(unlist(pred))
    obs <- as.numeric(unlist(obs))
    
    # Erro médio
    ME <- round(mean(pred - obs, na.rm = TRUE), digits = 4)
    
    # Erro médio quadrático
    MSE <- round(mean((pred - obs)^2, na.rm = TRUE), digits = 4)
    
    # Erro absoluto médio
    MAE <- round(mean(abs(pred - obs), na.rm = TRUE), digits = 4)
    
    # Raiz do erro médio quadrático
    RMSE <- round(sqrt(mean((pred - obs)^2, na.rm = TRUE)), digits = 4)
    
    # Coeficiente de correlação de Pearson ao quadrado
    r2 <- round((cor(pred, obs, method = 'spearman', use = 'pairwise.complete.obs')^2), digits = 4)
    
    # Coeficiente de eficiência do modelo Nash–Sutcliffe
    NSE <- round((1 - (sum((obs - pred)^2) / sum((obs - mean(obs))^2))), digits = 4)
    
    # Coeficiente de correlação de concordância de Lin
    CCC <- round(yardstick::ccc_vec(truth = obs, estimate = pred), digits = 4)
    
    # Criando um vetor 'out' com os resultados
    out <- c(ME, MAE, MSE, RMSE, NSE, r2, CCC)
    names(out) <- c("ME", "MAE", "MSE", "RMSE", "NSE", "Rsquared", "CCC")
    
    # Substituindo valores NaN por NA, se houver
    if (any(is.nan(out))) 
      out[is.nan(out)] <- NA
    
    # Retornando o vetor 'out' como resultado   
    out
  }
  
  # Verificando se a variável 'obs' em 'data' é do tipo character e, se for, convertendo-a para factor  
  if (is.character(data$obs)) 
    data$obs <- factor(data$obs, levels = lev)
  
  # Chamando a função 'regression_eval' com as colunas 'pred' e 'obs' de 'data'  
  regression_eval(data[["pred"]], data[["obs"]])
}

# Caminhos dos arquivos
files <- c(
  "C:/Users/marco/OneDrive/Área de Trabalho/Externa/CLAY_V000_EXT.xlsx",
  "C:/Users/marco/OneDrive/Área de Trabalho/Externa/SILT_V000_EXT.xlsx",
  "C:/Users/marco/OneDrive/Área de Trabalho/Externa/SAND_V000_EXT.xlsx"
)

# Função para ler e processar cada arquivo
process_file <- function(file_path) {
  # Leia o arquivo XLSX
  data <- read_excel(file_path)
  
  # Converter colunas 'pred' e 'obs' para numéricas
  data <- data %>%
    mutate(pred = as.numeric(pred),
           obs = as.numeric(obs))
  
  # Calcule as métricas
  metrics <- my_summary_metrics(data)
  
  # Adicione a propriedade como uma coluna no dataframe de métricas
  property <- unique(data$propriedade)
  metrics <- c(property, metrics)
  
  # Retorne as métricas
  metrics
}

# Processar todos os arquivos e compilar as métricas em um dataframe
metrics_list <- lapply(files, process_file)
metrics_df <- do.call(rbind, metrics_list)
metrics_df <- as.data.frame(metrics_df)
colnames(metrics_df)[1] <- "PARTICULA"
rownames(metrics_df) <- c("CLAY", "SILT", "SAND")

# Caminho para salvar o arquivo XLSX
output_file <- "C:/Users/marco/OneDrive/Área de Trabalho/Externa/metrics_v000.xlsx"

# Salvar as métricas no arquivo XLSX
write_xlsx(metrics_df, output_file)

# Mensagem de sucesso
cat("Métricas calculadas e salvas em metrics_summary.xlsx com sucesso!")
