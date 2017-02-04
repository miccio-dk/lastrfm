library(lastrfm)
library(ggplot2)
library(stringr)

tags_ignore <- c("albums I own", "singles i own", "favorite albums",
                 "favourite albums", "best albums", "Masterpiece", "favourites",
                 "favorites", "My Favorites",
                 "albums i want", "EPs i own", "music", "ep", "UK", "USA",
                 "british", "american", "live", "My favorites", "Love", "fun", "diverse")


tags_per_artist <- 5
albums_per_artist <- 7
artist <- "Mogwai"
albums <- lrfm_artist_get_top_albums(artist, n=50) %>%
  na.omit() %>%
  head(albums_per_artist)

tags <- apply(albums, 1, function(album) {
  album_name <- as.character(album["name"])
  album_name %>% paste("\t") %>% cat()

  album_tags <- lrfm_album_get_top_tags(artist, album_name, n=15)
  if(is.data.frame(album_tags)) {
    album_year <- album_tags$name %>%
      str_subset("^\\d{4}$") %>%
      as.numeric()
    album_tags_fltr <- album_tags %>%
      filter(!(name %in% tags_ignore)) %>%
      filter(!str_detect(name, "\\d{2}(s|\\d{2}|)")) %>%
      filter(!(tolower(name) %in% c(tolower(album), tolower(artist)))) %>%
      head(tags_per_artist)
    if(nrow(album_tags_fltr) > 0) {
      album_tags_fltr$album <- album_name
      if(length(album_year) > 0) {
        album_tags_fltr$year <- album_year
      } else {
        album_tags_fltr$year <- NA
      }
      album_tags_fltr$rank <- 1:nrow(album_tags_fltr)
      cat("\r\n")
      return(album_tags_fltr)
    }
  } else {
    cat("err\r\n")
  }
})
tags <- bind_rows(tags)

p <- ggplot(tags) +
  # interaction(album, year)
  aes(group = name, color = reorder(name, -count), y = rank, x = reorder(album, year)) +
  theme(axis.text.x = element_text(angle = 45, hjust = 1),
        axis.text = element_text(size = 8),
        axis.ticks = element_blank(),
        panel.background = element_rect(fill = "white"),
        panel.grid.major.x = element_line(color = "grey"),
        panel.grid.minor.y = element_blank(),
        panel.grid.major.y = element_blank()) +
  scale_y_reverse(lim = c(tags_per_artist, 1)) +
  scale_size_area(max_size = 8) +
  geom_point(aes(size = count), alpha = 1) +
  geom_line(position = "identity", stat = "identity", size = 3, alpha = 0.5) +
  guides(alpha = FALSE, size = FALSE) +
  labs(title = artist, x = "Album", y = "", color = "Tags")
if(length(unique(tags$name)) <= 12) {
  p <- p + scale_colour_brewer(palette = "Paired")
}
print(p)
