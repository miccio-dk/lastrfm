#' Get artist top tags
#'
#' Get the top tags for an artist on Last.fm, ordered by popularity.
#' This service does not require authentication.
#'
#' @param artist The artist name (required)
#' @param autocorrect Transform misspelled artist names into correct artist names,
#'        returning the correct version instead (optional)
#' @param n Number of tags to return (optional, default is all)
#'
#' @return Data.frame of top \code{n} tags with count, name, and url; ordered by popularity.
#' @export
#'
#' @examples
#' lrfm_artist_get_top_tags("Radiohead", n = 5)
lrfm_artist_get_top_tags <- function(artist, autocorrect = TRUE, n = NULL) {
  # create params object
  api_params <- data.frame(
    param_name = c("artist", "autocorrect"),
    param_val = c(URLencode(artist), as.numeric(autocorrect)),
    stringsAsFactors = FALSE)

  # request data
  res <- lrfm_send_request("artist.gettoptags", api_params)

  # return tags
  if(is.null(n)) {
    return(res$toptags$tag)
  } else {
    return(head(res$toptags$tag, n = n))
  }
}
