#' Get corrected artist name
#'
#' Use the last.fm corrections data to check whether the supplied artist has a correction to a canonical artist
#' This service does not require authentication.
#'
#' @param artist The artist name to correct (required)
#'
#' @return Correct artist name.
#' @export
#'
#' @examples
#' lrfm_artist_get_correction("Radioheat")
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
