# TODO

## Useful links
  - https://cran.r-project.org/web/packages/jsonlite/vignettes/json-apis.html
  - https://cran.r-project.org/web/packages/roxygen2/vignettes/rd.html
  - http://stat545.com/packages05_foofactors-package-02.html
  - http://r-pkgs.had.co.nz/release.html
  - http://www.jayblanco.com/blog/2016/7/9/using-lastfm-and-r-to-understand-my-music-listening-habits
  - https://cran.r-project.org/doc/manuals/r-release/R-exts.html
  - https://cran.r-project.org/web/packages/httr/vignettes/api-packages.html


## Data acquisition workflow
  - [ ] pack parameters
  - [ ] manage multiple pages
  - [x] send request
    - [x] create url
    - [x] handle errors


## Other features
  - [ ] documentation
  - [ ] tests
  - [ ] filter fake/incorrect tags
  - [ ] authentication
  - [ ] mbid data


## API methods

  - [ ] Artist
    - [ ] addTags
    - [x] getCorrection
    - [ ] getInfo
    - [ ] getSimilar
    - [ ] getTags
    - [x] getTopAlbums
    - [x] getTopTags
    - [x] getTopTracks
    - [ ] removeTag
    - [ ] search
  - [ ] Album
    - [ ] addTags
    - [ ] getInfo
    - [ ] getTags
    - [ ] getTopTags
    - [ ] removeTag
    - [ ] search
  - [ ] Track
    - [ ] addTags
    - [ ] getCorrection
    - [ ] getInfo
    - [ ] getSimilar
    - [ ] getTags
    - [ ] getTopTags
    - [ ] love
    - [ ] removeTag
    - [ ] scrobble
    - [ ] search
    - [ ] unlove
    - [ ] updateNowPlaying
  - [ ] Tag
    - [ ] getInfo
    - [ ] getSimilar
    - [ ] getTopAlbums
    - [ ] getTopArtists
    - [ ] getTopTags
    - [ ] getTopTracks
    - [ ] getWeeklyChartList

  - [ ] Auth
    - [ ] getMobileSession
    - [ ] getSession
    - [ ] getToken
  - [ ] User
    - [ ] getArtistTracks
    - [ ] getFriends
    - [ ] getInfo
    - [ ] getLovedTracks
    - [ ] getPersonalTags
    - [ ] getRecentTracks
    - [ ] getTopAlbums
    - [ ] getTopArtists
    - [ ] getTopTags
    - [ ] getTopTracks
    - [ ] getWeeklyAlbumChart
    - [ ] getWeeklyArtistChart
    - [ ] getWeeklyChartList
    - [ ] getWeeklyTrackChart
  - [ ] Library
    - [ ] getArtists

  - [ ] Chart
    - [ ] getTopArtists
    - [ ] getTopTags
    - [ ] getTopTracks
  - [ ] Geo
    - [ ] getTopArtists
    - [ ] getTopTracks
