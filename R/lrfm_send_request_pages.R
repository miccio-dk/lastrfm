lrfm_page_limit <- 50

lrfm_send_request_pages <- function(api_method,
                                    api_params = data.frame(
                                      param_name = character(),
                                      param_val = character(),
                                      stringsAsFactors = FALSE),
                                    n) {
  # add pages params and read first one
  api_params_all <- data.frame(
    param_name = c("page", "limit"),
    param_val = c("1", as.character(lrfm_page_limit)),
    stringsAsFactors = FALSE) %>%
    bind_rows(api_params)
  page <- lrfm_send_request(api_method, api_params_all) %>%
    unlist(recursive = FALSE)

  elems_per_page <- as.numeric(page[[2]]$perPage)
  if(!is.null(n)) {
    if(n <= elems_per_page) {
      res <- page[[1]] %>% head(n) %>% select_if(is.character)
      return(res)
    }
    elems_left <- n - elems_per_page
  } else {
    elems_left <- as.numeric(page[[2]]$total) - elems_per_page
  }

  elems <- page[[1]] %>% select_if(is.character)
  pages_last_left <- ceiling(elems_left / elems_per_page) + 1
  for(page in 2:pages_last_left) {
    api_params_all <- data.frame(
      param_name = c("page", "limit"),
      param_val = c(as.character(page), as.character(elems_per_page)),
      stringsAsFactors = FALSE) %>%
      bind_rows(api_params)
    page <- lrfm_send_request(api_method, api_params_all) %>%
      unlist(recursive = FALSE)
    elems <- bind_rows(elems, select_if(page[[1]], is.character))
  }
  return(head(elems, n))
}
