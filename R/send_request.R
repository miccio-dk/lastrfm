#' @keywords internal
send_request <- function(api_method,
                              api_params = data.frame(
                                param_name = character(),
                                param_val = character(),
                                stringsAsFactors = FALSE)) {
  # read key and store it as parameter
  api_key <- Sys.getenv('LASTFM_KEY')
  if(identical(api_key, "")) {
    stop("Please set env var LASTFM_KEY to your last.fm API key",
      call. = FALSE)
  }

  # combine mandatory params with method-specific ones
  api_params_all <- data.frame(
    param_name = c("method", "api_key", "format"),
    param_val = c(api_method, api_key, "json"),
    stringsAsFactors = FALSE) %>%
    bind_rows(api_params)

  # generate url, send request
  api_url <- build_url(api_params_all)
  api_req <- GET(api_url)
  df <- handle_errors(api_req)
  return(df)
}
