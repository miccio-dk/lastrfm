#' @keywords internal
build_url <- function(api_params) {
  # generate string with params
  api_url_params <- api_params %>%
    na.omit() %>%
    apply(1, function(param) {
      param_df <- data.frame(as.list(param))
      paste("&", param_df$param_name, "=", param_df$param_val, sep = "")
    }) %>%
    paste(collapse = "")

  # merge with API location and return complete url
  api_url <- "http://ws.audioscrobbler.com/2.0/?"
  api_url_final <- paste(api_url, api_url_params, sep = "")
  print(api_url_final)
  return(api_url_final)
}
