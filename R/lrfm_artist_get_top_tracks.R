lrfm_artist_get_top_tracks <- function(artist, autocorrect = TRUE, n = lrfm_page_limit) {
  # create params object
  api_params <- data.frame(
    param_name = c("artist", "autocorrect"),
    param_val = c(URLencode(artist), as.numeric(autocorrect)),
    stringsAsFactors = FALSE)

  # request data
  res <- lrfm_send_request_pages("artist.gettoptracks", api_params, n)

  # return tags
  return(res)
}
