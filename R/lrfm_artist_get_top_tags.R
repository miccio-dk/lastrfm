#' Title
#'
#' @param artist
#' @param autocorrect
#' @param n
#'
#' @return
#' @export
#'
#' @examples
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
