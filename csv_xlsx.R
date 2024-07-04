# Carregue os pacotes
library(readr)
library(writexl)

# Defina o caminho do arquivo CSV de entrada
csv_file <- "C:/Users/marco/OneDrive/Área de Trabalho/Externa/CLAY_V001_EXT.csv"

# Defina o caminho do arquivo XLSX de saída
xlsx_file <- "C:/Users/marco/OneDrive/Área de Trabalho/Externa/CLAY_V001_EXT.xlsx"

# Leia o arquivo CSV
data <- read_csv(csv_file)

# Escreva os dados no arquivo XLSX
write_xlsx(data, xlsx_file)

# Mensagem de sucesso
cat("Arquivo CSV convertido para XLSX com sucesso!")
