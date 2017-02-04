lrfm_artist_get_top_albums <- function(artist, autocorrect = TRUE, n = NULL) {
  # create params object
  api_params <- data.frame(
    param_name = c("artist", "autocorrect"),
    param_val = c(URLencode(artist), as.numeric(autocorrect)),
    stringsAsFactors = FALSE)

  # request data
  res <- lrfm_send_request_pages("artist.gettopalbums", api_params, n)

  # return tags
  return(res)
}
