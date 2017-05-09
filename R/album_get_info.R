#' @describeIn lastrfm-album Get album metadata and tracklist
#' @export
#'
#' @return
#'
#' @examples
#' album_get_info("Radiohead", "OK Computer", n = 5)
album_get_info <- function(artist, album, autocorrect = TRUE, user = NA, lang = NA) {
  # create params object
  api_params <- data.frame(
    param_name = c("artist", "album", "autocorrect", "username", "lang"),
    param_val = c(
      URLencode(artist),
      URLencode(album),
      as.numeric(autocorrect),
      URLencode(user),
      URLencode(lang)),
    stringsAsFactors = FALSE)

  # request data
  res <- send_request("album.getinfo", api_params)

  # return info
  return(res)
}
