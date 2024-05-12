library(data.table)

process_numeric_columns <- function(dt, specific_function) {
  numeric_columns <- names(dt)[sapply(dt, is.numeric)]
  for(col in numeric_columns) {
    if(specific_function(dt[[col]])) {
      print(paste("Processing column:", col))
      # 여기에서 특정 함수를 실행하고 결과를 반환할 수 있습니다.
    }
  }
}

# 특정 함수 예시
specific_function <- function(x) {
  # 여기에 특정 조건을 구현하세요
  # 예를 들어, 숫자형 변수 중 특정 조건을 만족하는지 확인할 수 있습니다.
  return(TRUE)
}

# 데이터테이블 예시
dt <- data.table(x = 1:5, y = letters[1:5], z = 6:10)

# 함수 호출
process_numeric_columns(dt, specific_function)
