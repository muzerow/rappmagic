#' Get United Application LTV by United Application ID
#' @description Get United Application LTV by United Application ID <https://api.appmagic.rocks/v1/docs#operation/getUnitedApplicationLTV>
#' @importFrom httr add_headers content GET
#' @importFrom glue glue
#'
#' @param id United application ID
#' @param signature Authentication token
#'
#' @export

am_united_app_ltv <- function(id, signature) {
  united_app_ltv <- GET(glue("https://api.appmagic.rocks/v1/united-applications/{id}/ltv"),
                        add_headers("Authorization" = signature,
                                    "Accept-Encoding" = "gzip"))

  if (united_app_ltv$status_code != 200) {
    stop(paste0("Error code ", united_app_ltv$status_code, ": ", content(united_app_ltv)$message))
  }

  content(united_app_ltv)
}
