#' @describeIn lastrfm-artist Get artist top tags, ordered by popularity
#' @export
#'
#' @return Data.frame of top \code{n} tags with count, name, and url; ordered by
#'   popularity.
#'
#' @examples
#' artist_get_top_tags("Mogwai", n = 5)
artist_get_top_tags <- function(artist, autocorrect = TRUE, n = NULL) {
  # create params object
  api_params <- data.frame(
    param_name = c("artist", "autocorrect"),
    param_val = c(URLencode(artist), as.numeric(autocorrect)),
    stringsAsFactors = FALSE)

  # request data
  res <- send_request("artist.gettoptags", api_params)

  # return tags
  if(is.null(n)) {
    return(res$toptags$tag)
  } else {
    return(head(res$toptags$tag, n = n))
  }
}
