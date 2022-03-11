#' Get Data for United Application
#' @description Get Data for United Application
#' @importFrom httr add_headers content GET
#'
#' @param aggregation Period of data summarization
#' @param date_from Start date for data (minimum date is 2015-01-01)
#' @param date_to End date for data (minimum date is 2015-01-01)
#' @param store Store code
#' @param united_application_id United app ID
#' @param country Alpha-2 country code
#' @param signature Authentication token
#'
#' @export

am_history_united_apps <- function(aggregation = NULL, date_from = NULL, date_to = NULL, store, united_application_id, country, signature) {
  history_united_apps <- GET("https://api.appmagic.rocks/v1/history/united-application",
                             query = list(aggregation = aggregation,
                                          date_from = date_from,
                                          date_to = date_to,
                                          store = store,
                                          united_application_id = united_application_id,
                                          country = country),
                             add_headers("Authorization" = signature,
                                         "Accept-Encoding" = "gzip"))

  if (history_united_apps$status_code != 200) {
    stop(paste0("Error code ", history_united_apps$status_code, ": ", content(history_united_apps)$message))
  }

  content(history_united_apps)
}
