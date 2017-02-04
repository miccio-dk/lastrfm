library(readr)
library(dplyr)

lrfm_send_request <- function(api_method,
                              api_params = data.frame(
                                param_name = character(),
                                param_val = character(),
                                stringsAsFactors = FALSE)) {
  # read key and store it as parameter
  api_key <- gsub("[[:space:]\r\n]", "", read_file("key.txt"))

  # combine mandatory params with method-specific ones
  api_params_all <- data.frame(
    param_name = c("method", "api_key", "format"),
    param_val = c(api_method, api_key, "json"),
    stringsAsFactors = FALSE) %>%
    bind_rows(api_params)

  # generate url, send request
  api_url <- lrfm_build_url(api_params_all)
  api_req <- httr::GET(api_url)
  df <- lrfm_handle_errors(api_req)
  return(df)
}
