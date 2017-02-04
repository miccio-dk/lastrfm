#' Get artist top albums
#'
#' Get the top albums for an artist on Last.fm, ordered by popularity.
#' This service does not require authentication.
#'
#' @param artist The artist name (required)
#' @param autocorrect Transform misspelled artist names into correct artist names,
#'        returning the correct version instead (optional)
#' @param n Number of albums to return (optional, default is all)
#'
#' @return Data.frame of top \code{n} tags with name, mbid ID, and url; ordered by popularity.
#' @export
#'
#' @examples
#' lrfm_artist_get_top_albums("Radiohead", n = 5)
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
