#' @describeIn lastrfm-user Get artist top tracks, ordered by popularity
#' @export
#'
#' @return Data.frame of top \code{n} tags with name, play count, number of
#'   listeners, mbid ID, and last.fm url; ordered by popularity.
#'
#' @examples
#' artist_get_top_tracks("Radiohead", n = 5)
user_get_recent_tracks <- function(user, time_range = c(NA, NA), n = page_limit) {
  # create params object
  api_params <- data.frame(
    param_name = c("user", "from", "to"),
    param_val = c(URLencode(artist), as.numeric(autocorrect)),
    stringsAsFactors = FALSE)

  # request data
  res <- send_request_pages("artist.gettoptracks", api_params, n)

  # return tags
  return(res)
}
