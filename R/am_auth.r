#' Get AppMagic API Authentication token
#' @description Get AppMagic API Authentication token
#' @importFrom RCurl base64
#'
#' @param name Account name
#' @param password Account password
#'
#' @export

am_auth <- function(name, password) {
  token <- base64(paste0(name, ":", password))
  paste("Basic", token)
}
