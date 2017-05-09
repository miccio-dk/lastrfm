#' last.fm User API methods
#'
#' These functions return information on users. None of these services require
#' authentication.
#'
#' @name lastrfm-user
#'
#' @param user The user name to fetch data for (required)
#' @param period The time period over which to retrieve data for (optional,
#'        default is \code{overall})
#' @param time_range Date range - only display scrobbles within these times.
#'        This must be in the UTC time zone. (optional, default and \code{NA}
#'        are whole range)
#' @param artist The artist name (TODO)
#' @param album The album name (TODO)
#' @param n Number of entries to return (optional)
#'
#' @details If \code{n} is omitted, the functions return:
#' \itemize{
#'  \item{All entries for TODO}
#'  \item{A number of entries up to \code{page_limit} for TODO}
#' }
#'
#' Field \code{period} can be one of \code{overall}, \code{7day}, \code{1month},
#' \code{3month}, \code{6month}, or \code{12month}.
#'
NULL
