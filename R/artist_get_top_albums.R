#' @describeIn lastrfm-artist Get artist top albums, ordered by popularity
#' @export
#'
#' @return Data.frame of top \code{n} albums with name, mbid ID, and last.fm url;
#'   ordered by popularity.
#'
#' @examples
#' artist_get_top_albums("Pink Floyd", n = 5)
artist_get_top_albums <- function(artist, autocorrect = TRUE, n = NULL) {
  # create params object
  api_params <- data.frame(
    param_name = c("artist", "autocorrect"),
    param_val = c(URLencode(artist), as.numeric(autocorrect)),
    stringsAsFactors = FALSE)

  # request data
  res <- send_request_pages("artist.gettopalbums", api_params, n)

  # return tags
  return(res)
}
