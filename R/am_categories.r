#' Get AppMagic Categories
#' @description Get AppMagic Categories <https://api.appmagic.rocks/v1/docs#operation/getCategories>
#' @importFrom httr add_headers content GET
#'
#' @param signature Authentication token
#'
#' @export

am_categories <- function(signature) {
  categories <- GET("https://api.appmagic.rocks/v1/categories",
                    add_headers("Authorization" = signature,
                                "Accept-Encoding" = "gzip",
                                "Accept" = "text/csv"))

  if (categories$status_code != 200) {
    stop(paste0("Error code ", categories$status_code, ": ", content(categories)$message))
  }

  content(categories)
}
