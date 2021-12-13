#' Get Data for Application
#' @description Get Data for Application
#' @importFrom httr add_headers content GET
#'
#' @param aggregation Period of data summarization
#' @param date_from Start date for data (minimum date is 2015-01-01)
#' @param date_to End date for data (minimum date is 2015-01-01)
#' @param store Store code
#' @param store_application_id Store app ID
#' @param country Alpha-2 country code
#' @param category_id Category ID
#' @param signature Authentication token
#'
#' @export

am_history_apps <- function(aggregation = NULL, date_from = NULL, date_to = NULL, store,
                            store_application_id, country, category_id = NULL, signature) {
  history_apps <- GET("https://api.appmagic.rocks/v1/history/application",
                             query = list(aggregation = aggregation,
                                          date_from = date_from,
                                          date_to = date_to,
                                          store = store,
                                          store_application_id = store_application_id,
                                          country = country,
                                          category_id = category_id),
                             add_headers("Authorization" = signature,
                                         "Accept-Encoding" = "gzip"))

  if (history_apps$status_code != 200) {
    stop(paste0("Error code ", history_apps$status_code, ": ", content(history_apps)$message))
  }

  history_apps <- content(history_apps)
  return(history_apps)
}
