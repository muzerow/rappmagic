#' Get Top Applications
#' @description Get Top Applications <https://api.appmagic.rocks/v1/docs#operation/getTopApplications>
#' @importFrom httr add_headers content GET
#'
#' @param aggregation Period of data summarization
#' @param sort Type of TOP
#' @param store Store code
#' @param country Alpha-2 country code
#' @param category_id Category ID
#' @param date Date of TOP (minimum date is 2015-01-01)
#' @param limit The number of returned items
#' @param tag_id Tag ID
#' @param signature Authentication token
#'
#' @export

am_top_apps <- function(aggregation = NULL, sort, store, country, category_id = NULL, date, limit = NULL, tag_id = NULL, signature) {
  top_apps <- GET("https://api.appmagic.rocks/v1/tops/application",
                  query = list(aggregation = aggregation,
                               sort = sort,
                               store = store,
                               country = country,
                               category_id = category_id,
                               date = date,
                               limit = limit,
                               tag_id = tag_id),
                  add_headers("Authorization" = signature,
                              "Accept-Encoding" = "gzip",
                              "Accept" = "text/csv"))

  if (top_apps$status_code != 200) {
    stop(paste0("Error code ", top_apps$status_code, ": ", content(top_apps)$message))
  }

  content(top_apps)
}
