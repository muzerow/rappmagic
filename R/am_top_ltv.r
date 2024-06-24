#' Get Top LTV
#' @description Get Top LTV <https://api.appmagic.rocks/v1/docs#operation/getTopLtv>
#' @importFrom httr add_headers content GET
#'
#' @param tag_id Tag ID
#' @param store Store code
#' @param limit The number of returned items
#' @param country Alpha-2 country code
#' @param signature Authentication token
#'
#' @export

am_top_ltv <- function(tag_id = NULL, store, limit = NULL, country, signature) {
  top_ltv <- GET("https://api.appmagic.rocks/v1/tops/ltv",
                  query = list(tag_id = tag_id,
                               store = store,
                               limit = limit,
                               country = country),
                  add_headers("Authorization" = signature,
                              "Accept-Encoding" = "gzip",
                              "Accept" = "text/csv"))

  if (top_ltv$status_code != 200) {
    stop(paste0("Error code ", top_ltv$status_code, ": ", content(top_ltv)$message))
  }

  content(top_ltv)
}
