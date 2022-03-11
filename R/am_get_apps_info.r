#' Get Application Info by Store Application ID
#' @description Get Application Info by Store Application ID
#' @importFrom httr add_headers content POST
#' @importFrom glue glue
#'
#' @param store Store code
#' @param store_application_id Store application ID
#' @param signature Authentication token
#'
#' @export

am_get_apps_info <- function(store, store_application_id, signature) {
  apps_info <- GET(glue("http://api.appmagic.rocks/v1/applications/{store}/{store_application_id}/info"),
                   add_headers("Authorization" = signature,
                               "Accept-Encoding" = "gzip"))

  if (apps_info$status_code != 200) {
    stop(paste0("Error code ", apps_info$status_code, ": ", content(apps_info)$message))
  }

  content(apps_info)
}
