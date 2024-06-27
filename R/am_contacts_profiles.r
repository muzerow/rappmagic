#' Get Profiles from Company ID
#' @description Get Profiles from Company ID <https://api.appmagic.rocks/v1/docs#operation/getProfiles>
#' @importFrom httr add_headers content POST
#' @importFrom jsonlite toJSON unbox
#'
#' @param company_id Company ID
#' @param page Page number
#' @param person_not_titles Titles to exclude
#' @param person_titles Titles to include
#' @param signature Authentication token
#'
#' @export

am_contacts_profiles <- function(company_id, page = NULL, person_not_titles = NULL,
                                 person_titles = NULL, signature) {
  body <- Filter(length, list(
    company_id = unbox(as.character(company_id)),
    page = unbox(page),
    person_not_titles = person_not_titles,
    person_titles = person_titles
  ))

  contacts_profiles <- POST("https://api.appmagic.rocks/v1/contacts/profiles",
    body = toJSON(body),
    add_headers(
      "Authorization" = signature,
      "Accept-Encoding" = "gzip",
      "Accept" = "text/csv"
    )
  )

  if (contacts_profiles$status_code != 200) {
    stop(paste0("Error code ", contacts_profiles$status_code, ": ", content(contacts_profiles)$message))
  }

  content(contacts_profiles)
}
