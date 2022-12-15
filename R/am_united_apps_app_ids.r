#' Get United Applications Info by Store Application IDs
#' @description Get United Applications Info by Store Application IDs <https://api.appmagic.rocks/v1/docs#operation/getUnitedApplicationsByAppIds>
#' @importFrom httr add_headers content POST
#'
#' @param ids_array List of lists with store IDs and store applications IDs
#' @param signature Authentication token
#'
#' @export

am_united_apps_app_ids <- function(ids_array, signature) {
  united_apps_info <- POST("https://api.appmagic.rocks/v1/united-applications/search-by-app-ids",
                           body = ids_array,
                           encode = "json",
                           add_headers("Authorization" = signature,
                                       "Accept-Encoding" = "gzip"))

  if (united_apps_info$status_code != 200) {
    stop(paste0("Error code ", united_apps_info$status_code, ": ", content(united_apps_info)$message))
  }

  content(united_apps_info)
}
