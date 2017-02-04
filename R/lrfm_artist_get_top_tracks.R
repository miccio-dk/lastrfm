#' Get artist top tracks
#'
#' Get the top tracks by an artist on Last.fm, ordered by popularity
#' This service does not require authentication.
#'
#' @param artist The artist name (required)
#' @param autocorrect Transform misspelled artist names into correct artist names,
#'        returning the correct version instead (optional)
#' @param n Number of tracks to return (optional, default is \code{lrfm_page_limit})
#'
#' @return Data.frame of top \code{n} tags with name, play count, number of listeners, mbid ID, and url; ordered by popularity.
#' @export
#'
#' @examples
#' lrfm_artist_get_top_tracks("Radiohead", n = 5)
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
