lrfm_album_get_top_tags <- function(artist, album, autocorrect = TRUE, n = NULL) {
  # create params object
  api_params <- data.frame(
    param_name = c("artist", "album", "autocorrect"),
    param_val = c(URLencode(artist), URLencode(album), as.numeric(autocorrect)),
    stringsAsFactors = FALSE)

  # request data
  res <- lrfm_send_request("album.gettoptags", api_params)

  # return tags
  if(is.null(n)) {
    return(res$toptags$tag)
  } else {
    return(head(res$toptags$tag, n = n))
  }
}
