#' @describeIn lastrfm-album Get album top tags, ordered by popularity
#' @export
#'
#' @return Data.frame of top \code{n} tags with count, name, and url; ordered by
#'   popularity.
#'
#' @examples
#' album_get_top_tags("Radiohead", "OK Computer", n = 5)
album_get_top_tags <- function(artist, album, autocorrect = TRUE, n = NULL) {
  # create params object
  api_params <- data.frame(
    param_name = c("artist", "album", "autocorrect"),
    param_val = c(URLencode(artist), URLencode(album), as.numeric(autocorrect)),
    stringsAsFactors = FALSE)

  # request data
  res <- send_request("album.gettoptags", api_params)

  # return tags
  if(is.null(n)) {
    return(res$toptags$tag)
  } else {
    return(head(res$toptags$tag, n = n))
  }
}
