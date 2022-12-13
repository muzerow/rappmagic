#' Get Application by Store Application ID
#' @description Get Application by Store Application ID <https://api.appmagic.rocks/v1/docs#operation/getApplication>
#' @importFrom httr add_headers content GET
#' @importFrom glue glue
#'
#' @param store Store code
#' @param store_application_id Store application ID
#' @param signature Authentication token
#'
#' @export

am_app <- function(store, store_application_id, signature) {
  app <- GET(glue("https://api.appmagic.rocks/v1/applications/{store}/{store_application_id}"),
             add_headers("Authorization" = signature,
                         "Accept-Encoding" = "gzip"))

  if (app$status_code != 200) {
    stop(paste0("Error code ", app$status_code, ": ", content(app)$message))
  }

  content(app)
}
