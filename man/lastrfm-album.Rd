% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/album_get_info.R, R/album_get_top_tags.R,
%   R/lastrfm_album.R
\name{album_get_info}
\alias{album_get_info}
\alias{album_get_top_tags}
\alias{lastrfm-album}
\title{last.fm Album API methods}
\usage{
album_get_info(artist, album, autocorrect = TRUE, n = NULL)

album_get_top_tags(artist, album, autocorrect = TRUE, n = NULL)
}
\arguments{
\item{artist}{The artist name (required except for \code{album_search})}

\item{album}{The album name (required)}

\item{autocorrect}{Transform misspelled artist names into correct artist
names, returning the correct version instead (optional)}

\item{n}{Number of entries to return (optional)}
}
\value{


Data.frame of top \code{n} tags with count, name, and url; ordered by
  popularity.
}
\description{
These functions return information on albums. None of these services require
authentication, except for \code{album_add_tags} and
\code{album_remove_tags}.
}
\details{
If \code{n} is omitted, the functions return:
\itemize{
 \item{All entries for \code{album_get_top_tags}}
 \item{A number of entries up to \code{page_limit} for TODO}
}
}
\section{Functions}{
\itemize{
\item \code{album_get_info}: Get album metadata and tracklist

\item \code{album_get_top_tags}: Get album top tags, ordered by popularity
}}

\examples{
album_get_info("Radiohead", "OK Computer", n = 5)
album_get_top_tags("Radiohead", "OK Computer", n = 5)
}
