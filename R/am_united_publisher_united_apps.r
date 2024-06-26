#' Get United Applications for United Publisher
#' @description Get United Applications for United Publisher <https://api.appmagic.rocks/v1/docs#operation/getUnitedPublisherUnitedApplications>
#' @importFrom httr add_headers content GET
#' @importFrom glue glue
#'
#' @param id United publisher ID
#' @param signature Authentication token
#'
#' @export

am_united_publisher_united_apps <- function(id, signature) {
  united_publisher_united_apps <- GET(
    glue("https://api.appmagic.rocks/v1/united-publishers/{id}/united-applications"),
    add_headers(
      "Authorization" = signature,
      "Accept-Encoding" = "gzip",
      "Accept" = "text/csv"
    )
  )

  if (united_publisher_united_apps$status_code != 200) {
    stop(paste0("Error code ", united_publisher_united_apps$status_code, ": ", content(united_publisher_united_apps)$message))
  }

  content(united_publisher_united_apps)
}
