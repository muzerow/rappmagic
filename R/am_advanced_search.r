#' Get Advanced Search
#' @description Get Advanced Search <https://api.appmagic.rocks/v1/docs#operation/advancedSearch>
#' @importFrom httr add_headers content GET
#'
#' @param release_date_gte Release Date Gte (minimum date is 2015-01-01)
#' @param release_date_lte Release Date Lte (minimum date is 2015-01-01)
#' @param country Alpha-2 country code
#' @param store Store code
#' @param size The number of returned items
#' @param screenshots If to include screenshots
#' @param search Search query
#' @param description Description search query
#' @param sort Type of a TOP
#' @param sort_asc Ascending or descending sorting
#' @param category_ids Category IDs
#' @param tag_id Tag IDs
#' @param publisher_place Publisher place
#' @param signature Authentication token
#' @param accept Accept header value
#'
#' @export

am_advanced_search <- function(release_date_gte, release_date_lte, country, store, size, screenshots = NULL,
                               search = NULL, description = NULL, sort, sort_asc = NULL, category_ids = NULL,
                               tag_id = NULL, publisher_place = NULL, signature, accept = "text/csv") {
  advanced_search <- GET("https://api.appmagic.rocks/v1/tops/advanced-search",
    query = list(
      release_date_gte = release_date_gte,
      release_date_lte = release_date_lte,
      country = country,
      store = store,
      size = size,
      screenshots = screenshots,
      search = search,
      description = description,
      sort = sort,
      sort_asc = sort_asc,
      category_ids = category_ids,
      tag_id = tag_id,
      publisherPlace = publisher_place
    ),
    add_headers(
      "Authorization" = signature,
      "Accept" = accept
    )
  )

  if (advanced_search$status_code != 200) {
    stop(paste0("Error code ", advanced_search$status_code, ": ", content(advanced_search)$message))
  }

  content(advanced_search)
}
