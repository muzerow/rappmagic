#' Get Application Similarity by Store Application ID
#' @description Get Application Similarity by Store Application ID <https://api.appmagic.rocks/v1/docs#operation/getApplicationSimilarity>
#' @importFrom httr add_headers content GET
#' @importFrom glue glue
#'
#' @param store Store code
#' @param store_application_id Store application ID
#' @param signature Authentication token
#'
#' @export

am_app_similarity <- function(store, store_application_id, signature) {
  app_similarity <- GET(glue("https://api.appmagic.rocks/v1/applications/{store}/{store_application_id}/similarity"),
                        add_headers("Authorization" = signature,
                                    "Accept-Encoding" = "gzip"
                                    "Accept" = "text/csv"))

  if (app_similarity$status_code != 200) {
    stop(paste0("Error code ", app_similarity$status_code, ": ", content(app_similarity)$message))
  }

  content(app_similarity)
}
