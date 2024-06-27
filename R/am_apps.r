#' Get Applications by Search Query
#' @description Get Applications by Search Query <https://api.appmagic.rocks/v1/docs#operation/getApplications>
#' @importFrom httr add_headers content GET
#'
#' @param search Search query
#' @param limit The number of returned items
#' @param offset Offset of returned items
#' @param signature Authentication token
#' @param accept Accept header value
#'
#' @export

am_apps <- function(search, limit = NULL, offset = NULL, signature, accept = "text/csv") {
  apps <- GET("https://api.appmagic.rocks/v1/applications",
    query = list(
      search = search,
      limit = limit,
      offset = offset
    ),
    add_headers(
      "Authorization" = signature,
      "Accept-Encoding" = "gzip",
      "Accept" = accept
    )
  )

  if (apps$status_code != 200) {
    stop(paste0("Error code ", apps$status_code, ": ", content(apps)$message))
  }

  content(apps)
}
