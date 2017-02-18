#' @keywords internal
handle_errors <- function(api_req) {
  json <- content(api_req, as = "text", encoding = "UTF-8") %>%
    fromJSON(simplifyDataFrame = TRUE)

  if(api_req$status_code != 200) {
    stop(paste("Server status ", api_req$status_code,
               ", last.fm API error #", json$error,
               ": ", json$message,
               sep = ""))
  }

  return(json)
}
