#' Get Publisher Applications by Store Publisher ID
#' @description Get Publisher Applications by Store Publisher ID <https://api.appmagic.rocks/v1/docs#operation/getPublisher>
#' @importFrom httr add_headers content GET
#' @importFrom glue glue
#'
#' @param store Store code
#' @param store_publisher_id Store publisher ID
#' @param signature Authentication token
#'
#' @export

am_publisher_apps <- function(store, store_publisher_id, signature) {
  publisher_apps <- GET(glue("https://api.appmagic.rocks/v1/publishers/{store}/{store_publisher_id}/applications"),
                        add_headers("Authorization" = signature,
                                    "Accept-Encoding" = "gzip"))

  if (publisher_apps$status_code != 200) {
    stop(paste0("Error code ", publisher_apps$status_code, ": ", content(publisher_apps)$message))
  }

  content(publisher_apps)
}
