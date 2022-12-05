#' Get United Publishers Info by United Publishers IDs
#' @description Get United Publishers Info by United Publishers IDs <https://api.appmagic.rocks/v1/docs#operation/getUnitedPublishersByIds>
#' @importFrom httr add_headers content POST
#'
#' @param ids Vector of united publishers IDs
#' @param signature Authentication token
#'
#' @export

am_united_publishers_ids <- function(ids, signature) {
  united_publishers_info <- POST("https://api.appmagic.rocks/v1/united-publishers/search-by-ids",
                                 body = as.list(ids),
                                 encode = "json",
                                 add_headers("Authorization" = signature,
                                             "Accept-Encoding" = "gzip"))

  if (united_publishers_info$status_code != 200) {
    stop(paste0("Error code ", united_publishers_info$status_code, ": ", content(united_publishers_info)$message))
  }

  content(united_publishers_info)
}
