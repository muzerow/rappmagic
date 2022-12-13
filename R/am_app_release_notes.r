#' Get Application Release Notes by Store Application ID
#' @description Get Application Release Notes by Store Application ID <https://api.appmagic.rocks/v1/docs#operation/getApplicationReleaseNotes>
#' @importFrom httr add_headers content GET
#' @importFrom glue glue
#'
#' @param store Store code
#' @param store_application_id Store application ID
#' @param signature Authentication token
#'
#' @export

am_app_release_notes <- function(store, store_application_id, signature) {
  app_release_notes <- GET(glue("https://api.appmagic.rocks/v1/applications/{store}/{store_application_id}/release-notes"),
             add_headers("Authorization" = signature,
                         "Accept-Encoding" = "gzip"))

  if (app_release_notes$status_code != 200) {
    stop(paste0("Error code ", app_release_notes$status_code, ": ", content(app_release_notes)$message))
  }

  content(app_release_notes)
}
