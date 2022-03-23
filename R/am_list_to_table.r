#' Transform list into table
#' @description Transform list into table
#' @importFrom purrr map
#' @importFrom data.table as.data.table rbindlist
#'
#' @param data List data
#'
#' @export

am_list_to_table <- function(data) {
  data <- map(data, as.data.table)
  rbindlist(data, fill = T, idcol = F)
}
