#' Get AppMagic Tags
#' @description Get AppMagic Tags
#' @importFrom httr add_headers content GET
#'
#' @param signature Authentication token
#'
#' @export

am_tags <- function(signature) {
  tags <- GET("https://api.appmagic.rocks/v1/tags",
              add_headers("Authorization" = signature,
                          "Accept-Encoding" = "gzip"))

  if (tags$status_code != 200) {
    stop(paste0("Error code ", tags$status_code, ": ", content(tags)$message))
  }

  tags <- content(tags)
  return(tags)
}
