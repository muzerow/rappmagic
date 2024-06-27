#' Get LinkedIn Companies from United Publisher ID
#' @description Get LinkedIn Companies from United Publisher ID <https://api.appmagic.rocks/v1/docs#operation/getCompanies>
#' @importFrom httr add_headers content GET
#' @importFrom glue glue
#'
#' @param id United publisher ID
#' @param signature Authentication token
#'
#' @export

am_contacts_companies <- function(id, signature) {
  contacts_companies <- GET(
    glue("https://api.appmagic.rocks/v1/contacts/companies/{id}"),
    add_headers(
      "Authorization" = signature,
      "Accept-Encoding" = "gzip",
      "Accept" = "text/csv"
    )
  )

  if (contacts_companies$status_code != 200) {
    stop(paste0("Error code ", contacts_companies$status_code, ": ", content(contacts_companies)$message))
  }

  content(contacts_companies)
}
