#' Get Top Publishers
#' @description Get Top Publishers <https://api.appmagic.rocks/v1/docs#operation/getTopPublishers>
#' @importFrom httr add_headers content GET
#'
#' @param date Date of TOP (minimum date is 2015-01-01)
#' @param store Store code
#' @param aggregation Period of data summarization
#' @param tag_id Tag ID
#' @param headquarters Publishers headquarters country
#' @param countries Alpha-2 country code
#' @param limit The number of returned items
#' @param sort Sort by downloads, revenue or featuring
#' @param signature Authentication token
#'
#' @export

am_top_publishers <- function(date, store, aggregation, tag_id = NULL, headquarters = NULL,
                              countries, limit = NULL, sort, signature) {
  top_publishers <- GET("http://api.appmagic.rocks/v1/tops/publishers",
                        query = list(date = date,
                                     store = store,
                                     aggregation = aggregation,
                                     tag_id = tag_id,
                                     headquarters = headquarters,
                                     countries = countries,
                                     limit = limit,
                                     sort = sort),
                        add_headers("Authorization" = signature))

  if (top_publishers$status_code != 200) {
    stop(paste0("Error code ", top_publishers$status_code, ": ", content(top_publishers)$message))
  }

  content(top_publishers)
}

