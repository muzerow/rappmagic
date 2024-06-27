#' Get United Application by United Application ID
#' @description Get United Application by United Application ID <https://api.appmagic.rocks/v1/docs#operation/getUnitedApplication>
#' @importFrom httr add_headers content GET
#' @importFrom glue glue
#'
#' @param id United application ID
#' @param signature Authentication token
#'
#' @export

am_united_app <- function(id, signature) {
  united_app <- GET(
    glue("https://api.appmagic.rocks/v1/united-applications/{id}"),
    add_headers(
      "Authorization" = signature,
      "Accept-Encoding" = "gzip",
      "Accept" = "text/csv"
    )
  )

  if (united_app$status_code != 200) {
    stop(paste0("Error code ", united_app$status_code, ": ", content(united_app)$message))
  }

  content(united_app)
}
