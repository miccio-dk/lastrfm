#' last.fm Album API methods
#'
#' These functions return information on albums. None of these services require
#' authentication, except for \code{album_add_tags} and
#' \code{album_remove_tags}.
#'
#' @name lastrfm-album
#'
#' @param artist The artist name (required except for \code{album_search})
#' @param album The album name (required)
#' @param autocorrect Transform misspelled artist names into correct artist
#'   names, returning the correct version instead (optional)
#' @param n Number of entries to return (optional)
#'
#' @details If \code{n} is omitted, the functions return:
#' \itemize{
#'  \item{All entries for \code{album_get_top_tags}}
#'  \item{A number of entries up to \code{page_limit} for TODO}
#' }
#'
NULL
