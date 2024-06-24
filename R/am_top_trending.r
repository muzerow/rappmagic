#' Get Top Trending Applications
#' @description Get Top Trending Applications <https://api.appmagic.rocks/v1/docs#operation/getTopTrending>
#' @importFrom httr add_headers content GET
#'
#' @param store Store code
#' @param type Type of a top (top free or top grossing)
#' @param country Alpha-2 country code
#' @param date_from Start date of TOP (minimum date is 2015-01-01)
#' @param date_to End date of TOP (minimum date is 2015-01-01)
#' @param limit The number of returned items
#' @param depth Top app analysis limit
#' @param method Type of a top (gainers or losers)
#' @param tag_id Tag IDs
#' @param category_ids Category IDs
#' @param headquarter Alpha-2 country code of application publisher
#' @param new_only Select apps released in specific time period or include others
#' @param kind Type of applications (all, games or apps)
#' @param signature Authentication token
#'
#' @export

am_top_trending <- function(store, type, country, date_from, date_to, limit = NULL, depth = NULL,
                            method = NULL, tag_id = NULL, category_ids = NULL, headquarter = NULL,
                            new_only = NULL, kind = NULL, signature) {
  top_trending <- GET("https://api.appmagic.rocks/v1/tops/trending",
                         query = list(store = store,
                                      type = type,
                                      country = country,
                                      date_from = date_from,
                                      date_to = date_to,
                                      limit = limit,
                                      depth = depth,
                                      method = method,
                                      tag_id = tag_id,
                                      category_ids = category_ids,
                                      headquarter = headquarter,
                                      new_only = new_only,
                                      kind = kind),
                         add_headers("Authorization" = signature,
                                     "Accept" = "text/csv"))

  if (top_trending$status_code != 200) {
    stop(paste0("Error code ", top_trending$status_code, ": ", content(top_trending)$message))
  }

  content(top_trending)
}
