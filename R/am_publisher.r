#' Get Publisher by Store Publisher ID
#' @description Get Publisher by Store Publisher ID <https://api.appmagic.rocks/v1/docs#operation/getPublisher>
#' @importFrom httr add_headers content GET
#' @importFrom glue glue
#'
#' @param store Store code
#' @param store_publisher_id Store publisher ID
#' @param signature Authentication token
#'
#' @export

am_publisher <- function(store, store_publisher_id, signature) {
  publisher <- GET(
    glue("https://api.appmagic.rocks/v1/publishers/{store}/{store_publisher_id}"),
    add_headers(
      "Authorization" = signature,
      "Accept-Encoding" = "gzip",
      "Accept" = "text/csv"
    )
  )

  if (publisher$status_code != 200) {
    stop(paste0("Error code ", publisher$status_code, ": ", content(publisher)$message))
  }

  content(publisher)
}
