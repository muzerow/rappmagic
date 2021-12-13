#' Get AppMagic Categories
#' @description Get AppMagic Categories
#' @importFrom httr add_headers content GET
#'
#' @param signature Authentication token
#'
#' @export

am_categories <- function(signature) {
  categories <- GET("https://api.appmagic.rocks/v1/categories",
                    add_headers("Authorization" = signature,
                                "Accept-Encoding" = "gzip"))

  if (categories$status_code != 200) {
    stop(paste0("Error code ", categories$status_code, ": ", content(categories)$message))
  }

  categories <- content(categories)
  return(categories)
}
