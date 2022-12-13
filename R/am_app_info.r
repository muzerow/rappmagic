#' Get Application Info by Store Application ID
#' @description Get Application Info by Store Application ID <https://api.appmagic.rocks/v1/docs#operation/getApplicationInfo>
#' @importFrom httr add_headers content GET
#' @importFrom glue glue
#'
#' @param store Store code
#' @param store_application_id Store application ID
#' @param signature Authentication token
#'
#' @export

am_app_info <- function(store, store_application_id, signature) {
  app_info <- GET(glue("https://api.appmagic.rocks/v1/applications/{store}/{store_application_id}/info"),
                  add_headers("Authorization" = signature,
                              "Accept-Encoding" = "gzip"))

  if (app_info$status_code != 200) {
    stop(paste0("Error code ", app_info$status_code, ": ", content(app_info)$message))
  }

  content(app_info)
}
