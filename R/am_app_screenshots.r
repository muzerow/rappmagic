#' Get Application Screenshots by Store Application ID
#' @description Get Application Screenshots by Store Application ID <https://api.appmagic.rocks/v1/docs#operation/getApplicationScreenshots>
#' @importFrom httr add_headers content GET
#' @importFrom glue glue
#'
#' @param store Store code
#' @param store_application_id Store application ID
#' @param signature Authentication token
#'
#' @export

am_app_screenshots <- function(store, store_application_id, signature) {
  app_screenshots <- GET(glue("https://api.appmagic.rocks/v1/applications/{store}/{store_application_id}/screenshots"),
                         add_headers("Authorization" = signature,
                                     "Accept-Encoding" = "gzip",
                                     "Accept" = "text/csv"))

  if (app_screenshots$status_code != 200) {
    stop(paste0("Error code ", app_screenshots$status_code, ": ", content(app_screenshots)$message))
  }

  content(app_screenshots)
}
