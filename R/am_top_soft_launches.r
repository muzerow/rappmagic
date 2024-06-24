#' Get Top Soft Launches
#' @description Get Top Soft Launches <https://api.appmagic.rocks/v1/docs#operation/getTopSoftLaunches>
#' @importFrom httr add_headers content GET
#'
#' @param date_from Start date of TOP (minimum date is 2015-01-01)
#' @param date_to End date of TOP (minimum date is 2015-01-01)
#' @param include_countries Include countries of soft launch
#' @param exclude_countries Exclude countries of soft launch
#' @param store Store code
#' @param category_ids Category IDs
#' @param only_global_publisher To include global publishers only
#' @param top_publisher Publisher rank
#' @param sort Sort by downloads or revenue
#' @param limit The number of returned items
#' @param signature Authentication token
#'
#' @export

am_top_soft_launches <- function(date_from, date_to, include_countries, exclude_countries = NULL, store,
                                 category_ids = NULL, only_global_publisher = NULL, top_publisher = NULL,
                                 sort, limit = NULL, signature) {
  top_soft_launches <- GET("https://api.appmagic.rocks/v1/tops/soft-launches",
                           query = list(date_from = date_from,
                                        date_to = date_to,
                                        include_countries = include_countries,
                                        exclude_countries = exclude_countries,
                                        store = store,
                                        category_ids = category_ids,
                                        only_global_publisher = only_global_publisher,
                                        top_publisher = top_publisher,
                                        sort = sort,
                                        limit = limit),
                           add_headers("Authorization" = signature,
                                       "Accept" = "text/csv"))

  if (top_soft_launches$status_code != 200) {
    stop(paste0("Error code ", top_soft_launches$status_code, ": ", content(top_soft_launches)$message))
  }

  content(top_soft_launches)
}
