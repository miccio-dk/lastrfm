#' @describeIn lastrfm-user Get a list of the recent tracks listened to by this user.
#' @export
#'
#' @return Data.frame of tracks listended by the given user, including title,
#'         mbid, lastfm url, and whether it is a loved track.
#'
#' @examples
#' user_get_recent_tracks("", n = 5)
user_get_recent_tracks <- function(user, time_range = c(NA, NA), extended_results = FALSE, n = page_limit) {
  # create params object
  api_params <- data.frame(
    param_name = c("user", "from", "to", "extended"),
    param_val = c(
      URLencode(user),
      as.numeric(as.POSIXct(time_range[1])),
      as.numeric(as.POSIXct(time_range[2])),
      as.numeric(extended_results)),
    stringsAsFactors = FALSE)

  # request data
  res <- send_request_pages("user.getrecenttracks", api_params, n)

  # return tags
  return(res)
}
