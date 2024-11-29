#' Splits a data frame into a named list given grouping variables
#'
#' @return A named list of data frames
#' @param .tbl A tbl.
#' @param ... If .tbl is an ungrouped data frame, a grouping specification, forwarded to dplyr::group_split().
#' @param .keep Should the grouping columns be kept?
#' @param .sep Separator to use between grouping specification.
#' @examples
#' data <- data.frame(first = c('jonathan','porter','sam','davis','quinn'),
#'                    last = c('duncan','christensen','morgan','dayley','durrant'),
#'                    x = rnorm(100), y = rnorm(100,2), z = rnorm(100,10,5))
#'
#' group_name_split(data,first)
#'
#' @export

group_name_split <- function(.tbl , ..., .keep = TRUE, .sep = '_') {
  ## creating a grouping variable
  grp_var <- NULL
  tmp <- .tbl |>
    tidyr::unite(col = 'grp_var', ... = ..., remove = FALSE, sep = .sep) |>
    dplyr::group_split(... = ..., .keep = .keep)

  ## creating a vector of names for the list of data frames
  list_names <- unlist(lapply(X = tmp, \(x) {unique(x$grp_var)}))

  ## renmaing list of data frames
  names(tmp) <- list_names

  ## dropping the grp_var that was created
  tmp <- lapply(X = tmp, \(x) {dplyr::select(x,-grp_var)})

  ## return
  return(tmp)
}

