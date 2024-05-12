
library(readxl)
library(data.table)
suppressPackageStartupMessages(library(data.table))

load_raw_data <- function(folder_path, pattern) {
  excel_file_name <- list.files(folder_path, pattern = pattern)
  if(length(excel_file_name) == 0) {
    stop("No files starting with 'NLR' found in the specified folder.")
  }
  raw_data <- as.data.table(read_excel(file.path(folder_path, excel_file_name[1])))
  # colnames(raw_data)[colnames(raw_data) == "성 명"] <- "성명"
  # raw_data <- raw_data[, .(등록일, 등록번호, 성명, 성별, 나이, 특기사항, 분류명)]
  # raw_data$나이 <- as.integer(sub("세", "", raw_data$나이))
  
  # # 파일명에서 6번째부터 13번째까지 날짜정보를 추출하여 전역변수로 사용
  # date_string <- substr(excel_file_name, 6, 13)
  # downloaded_date <<- as.Date(date_string, format = "%Y%m%d")
  
  return(raw_data)
}

folder_path <- "C:/R/Projects/R-4.4.0-Rectal_Cancer_NLR/data/raw_data/"
pattern <- "NLR.*"
raw_data <- load_raw_data(folder_path, pattern)

print(raw_data)
