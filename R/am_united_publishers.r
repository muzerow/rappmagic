#' Search for United Publishers
#' @description Search for United Publishers <https://api.appmagic.rocks/v1/docs#operation/getUnitedPublishers>
#' @importFrom httr add_headers content GET
#'
#' @param search Search query
#' @param signature Authentication token
#'
#' @export

am_united_publishers <- function(search, signature) {
  united_publishers <- GET("https://api.appmagic.rocks/v1/united-publishers",
    query = list(search = search),
    add_headers(
      "Authorization" = signature,
      "Accept-Encoding" = "gzip",
      "Accept" = "text/csv"
    )
  )

  if (united_publishers$status_code != 200) {
    stop(paste0("Error code ", united_publishers$status_code, ": ", content(united_publishers)$message))
  }

  content(united_publishers)
}
