#' Get Applications Info by Store Application IDs
#' @description Get Applications Info by Store Application IDs <https://api.appmagic.rocks/v1/docs#operation/getApplicationsByIds>
#' @importFrom httr add_headers content POST
#'
#' @param ids_array List of lists with store IDs and store applications IDs
#' @param signature Authentication token
#' @param accept Accept header value
#'
#' @export

am_apps_ids <- function(ids_array, signature, accept = "text/csv") {
  apps_info <- POST("https://api.appmagic.rocks/v1/applications/search-by-ids",
    body = ids_array,
    encode = "json",
    add_headers(
      "Authorization" = signature,
      "Accept-Encoding" = "gzip",
      "Accept" = accept
    )
  )

  if (apps_info$status_code != 200) {
    stop(paste0("Error code ", apps_info$status_code, ": ", content(apps_info)$message))
  }

  content(apps_info)
}
