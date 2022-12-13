#' Get United Applications by Search Query
#' @description Get United Applications by Search Query <https://api.appmagic.rocks/v1/docs#operation/getUnitedApplications>
#' @importFrom httr add_headers content GET
#'
#' @param search Search query
#' @param limit The number of returned items
#' @param offset Offset of returned items
#' @param signature Authentication token
#'
#' @export

am_united_apps <- function(search, limit = NULL, offset = NULL, signature) {
  united_apps <- GET("https://api.appmagic.rocks/v1/united-applications",
                     query = list(search = search,
                                  limit = limit,
                                  offset = offset),
                     add_headers("Authorization" = signature,
                                 "Accept-Encoding" = "gzip"))

  if (united_apps$status_code != 200) {
    stop(paste0("Error code ", united_apps$status_code, ": ", content(united_apps)$message))
  }

  content(united_apps)
}
