#' last.fm Artist API methods
#'
#' These functions return information on artits. None of these services require
#' authentication, except for \code{artist_add_tags} and
#' \code{artist_remove_tags}.
#'
#' @name lastrfm-artist
#'
#' @param artist The artist name (required)
#' @param autocorrect Transform misspelled artist names into correct artist
#'   names, returning the correct version instead (optional)
#' @param n Number of entries to return (optional)
#'
#' @details If \code{n} is omitted, the functions return:
#' \itemize{
#'  \item{All entries for \code{artist_get_top_tags}, \code{artist_get_top_albums}}
#'  \item{A number of entries up to \code{page_limit} for \code{artist_get_top_tracks}}
#' }
#'
NULL
