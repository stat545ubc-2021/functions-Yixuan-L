#' @title Summary Statistics of a numeric column grouped by a category column in a dataset
#'
#' @param dataset The dataset.
#' @param category The category which can be divided into several types, and then we will summarize a numeric column grouped by this category.
#' @param column The numeric column for computing summary statistics.
#' @import dplyr tibble datateachr
#' @return A tibble of the summary statistics.
#' @importFrom stats median sd
#' @export
#'
#' @examples
#' summarize_stat(datateachr::apt_buildings, property_type, no_of_storeys)
#' summarize_stat(datateachr::apt_buildings, air_conditioning, year_built)
#' summarize_stat(datateachr::apt_buildings, window_type, year_built)
#'
summarize_stat <- function(dataset, category, column) {
  # make sure the class of dataset should be dataframe
  if(!is.data.frame(dataset)) {
    stop("Error: type of dataset must be dataframe rather than:", class(dataset)[1], "please input again")}
  # make sure the class of column should be numeric
  flg <- dplyr::summarise(dataset, is.numeric({{ column }}))
  if (!flg[[1]]) {
    stop("Error: type of column must be numeric, please input again")}


  result <- dataset %>%
    # filter none values for column
    dplyr::filter(!is.na({{ column }})) %>%
    # group by category
    dplyr::group_by({{ category }}) %>%
    # summarize for mean, lowest, highest, std, median of column
    dplyr::summarise(
      mean.col = mean({{ column }}, na.rm = TRUE),
      lowest.col = range({{ column }})[1],
      highest.col = range({{ column }})[2],
      std.col = sd({{ column }}, na.rm = TRUE),
      median.col = median({{ column }}, na.rm = TRUE)
    )
  # print the result with tibble format
  print(result)
}
