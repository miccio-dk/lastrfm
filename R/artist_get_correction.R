#' @describeIn lastrfm-artist Get corrected artist name
#' @export
#'
#' @return Correct artist name.
#'
#' @examples
#' artist_get_correction("Radioheat")
artist_get_correction <- function(artist) {
  # create params object
  api_params <- data.frame(
    param_name = "artist",
    param_val = URLencode(artist),
    stringsAsFactors = FALSE)

  # request data
  res <- send_request("artist.getcorrection", api_params)

  # return correction
  return(res$correction$correction$artist$name)
}
