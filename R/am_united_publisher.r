#' Get Data for United Publisher
#' @description Get Data for United Publisher <https://api.appmagic.rocks/v1/docs#operation/getUnitedPublisher>
#' @importFrom httr add_headers content GET
#' @importFrom glue glue
#'
#' @param id United publisher ID
#' @param signature Authentication token
#'
#' @export

am_united_publisher <- function(id, signature) {
  united_publisher <- GET(glue("https://api.appmagic.rocks/v1/united-publishers/{id}"),
                          add_headers("Authorization" = signature,
                                      "Accept-Encoding" = "gzip",
                                      "Accept" = "text/csv"))

  if (united_publisher$status_code != 200) {
    stop(paste0("Error code ", united_publisher$status_code, ": ", content(united_publisher)$message))
  }

  content(united_publisher)
}
