lrfm_artist_get_correction <- function(artist) {
  # create params object
  api_params <- data.frame(
    param_name = "artist",
    param_val = URLencode(artist),
    stringsAsFactors = FALSE)

  # request data
  res <- lrfm_send_request("artist.getcorrection", api_params)

  # return correction
  return(res$correction$correction$artist$name)
}
