#' Get Publishers by Search Query
#' @description Get Publishers by Search Query <https://api.appmagic.rocks/v1/docs#operation/getPublishers>
#' @importFrom httr add_headers content GET
#'
#' @param search Search query
#' @param limit The number of returned items
#' @param offset Offset of returned items
#' @param signature Authentication token
#'
#' @export

am_publishers <- function(search, limit = NULL, offset = NULL, signature) {
  publishers <- GET("https://api.appmagic.rocks/v1/publishers",
    query = list(
      search = search,
      limit = limit,
      offset = offset
    ),
    add_headers(
      "Authorization" = signature,
      "Accept-Encoding" = "gzip",
      "Accept" = "text/csv"
    )
  )

  if (publishers$status_code != 200) {
    stop(paste0("Error code ", publishers$status_code, ": ", content(publishers)$message))
  }

  content(publishers)
}
