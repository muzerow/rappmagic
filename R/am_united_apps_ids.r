#' Get United Applications Info by United Applications IDs
#' @description Get United Applications Info by United Applications IDs <https://api.appmagic.rocks/v1/docs#operation/getUnitedApplicationsByIds>
#' @importFrom httr add_headers content POST
#'
#' @param ids Vector of united applications IDs
#' @param signature Authentication token
#' @param accept Accept header value
#'
#' @export

am_united_apps_ids <- function(ids, signature, accept = "text/csv") {
  united_apps_info <- POST("https://api.appmagic.rocks/v1/united-applications/search-by-ids",
                           body = as.list(ids),
                           encode = "json",
                           add_headers("Authorization" = signature,
                                       "Accept-Encoding" = "gzip",
                                       "Accept" = accept))

  if (united_apps_info$status_code != 200) {
    stop(paste0("Error code ", united_apps_info$status_code, ": ", content(united_apps_info)$message))
  }

  content(united_apps_info)
}
