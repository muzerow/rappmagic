#' Get Top United Applications
#' @description Get Top United Applications
#' @importFrom httr add_headers content GET
#'
#' @param aggregation Period of data summarization
#' @param sort Type of TOP
#' @param store Store code
#' @param country Alpha-2 country code
#' @param date Date of TOP (minimum date is 2015-01-01)
#' @param limit The number of returned items
#' @param tag_id Tag ID
#' @param signature Authentication token
#'
#' @export

am_top_united_apps <- function(aggregation = NULL, sort, store, country, date, limit = NULL, tag_id = NULL, signature) {
  top_united_apps <- GET("https://api.appmagic.rocks/v1/tops/united-application",
                  query = list(aggregation = aggregation,
                               sort = sort,
                               store = store,
                               country = country,
                               date = date,
                               limit = limit,
                               tag_id = tag_id),
                  add_headers("Authorization" = signature,
                              "Accept-Encoding" = "gzip"))

  if (top_united_apps$status_code != 200) {
    stop(paste0("Error code ", top_united_apps$status_code, ": ", content(top_united_apps)$message))
  }

  top_united_apps <- content(top_united_apps)
  return(top_united_apps)
}
