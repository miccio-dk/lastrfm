#' @describeIn lastrfm-album Get album metadata and tracklist
#' @export
#'
#' @return
#'
#' @examples
#' album_get_info("Radiohead", "OK Computer", n = 5)
album_get_info <- function(artist, album, autocorrect = TRUE, n = NULL) {
  # create params object
  api_params <- data.frame(
    param_name = c("artist", "album", "autocorrect"),
    param_val = c(URLencode(artist), URLencode(album), as.numeric(autocorrect)),
    stringsAsFactors = FALSE)

  # request data
  res <- send_request("album.getinfo", api_params)

  # return tags
  if(is.null(n)) {
    return(res$toptags$tag)
  } else {
    return(head(res$toptags$tag, n = n))
  }
}
