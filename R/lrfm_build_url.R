# You can learn more about package authoring with RStudio at:
#
#   http://r-pkgs.had.co.nz/
#
# Some useful keyboard shortcuts for package authoring:
#
#   Build and Reload Package:  'Ctrl + Shift + B'
#   Check Package:             'Ctrl + Shift + E'
#   Test Package:              'Ctrl + Shift + T'


lrfm_build_url <- function(api_params) {
  # generate string with params
  api_url_params <- api_params %>%
    apply(1, function(param) {
      param_df <- data.frame(as.list(param))
      paste("&", param_df$param_name, "=", param_df$param_val, sep = "")
    }) %>%
    paste(collapse = "")

  # merge with API location and return complete url
  api_url <- "http://ws.audioscrobbler.com/2.0/?"
  api_url_final <- paste(api_url, api_url_params, sep = "")
  return(api_url_final)
}
