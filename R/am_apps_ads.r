#' Get Application Ads
#' @description Get Application Ads
#' @importFrom httr add_headers content GET
#'
#' @param appIds Application store ID
#' @param country Country
#' @param dateFrom Start date (minimum date is 2015-01-01)
#' @param dateTo End date (minimum date is 2015-01-01)
#' @param sort Sorting type
#' @param aggregation Aggregation type
#' @param count The number of returned items
#' @param offset Offset of returned items
#' @param adNetwork Ad network
#' @param platform Platform
#' @param type Ad type
#' @param signature Authentication token
#'
#' @export

am_apps_ads <- function(appIds, country, dateFrom, dateTo, sort, aggregation, count = NULL,
                        offset, adNetwork = NULL, platform = NULL, type = NULL, signature) {
  apps_ads <- GET("https://api.appmagic.rocks/v1/adint/application-ads",
                  query = list(appIds = appIds,
                               country = country,
                               dateFrom = dateFrom,
                               dateTo = dateTo,
                               sort = sort,
                               aggregation = aggregation,
                               count = count,
                               offset = offset,
                               adNetwork = adNetwork,
                               platform = platform,
                               type = type),
                  add_headers("Authorization" = signature))

  if (apps_ads$status_code != 200) {
    stop(paste0("Error code ", apps_ads$status_code, ": ", content(apps_ads)$message))
  }

  content(apps_ads)
}
