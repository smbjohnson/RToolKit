#' Clear the working environment
#'
#' @return A clean environment
#' @examples
#' to_delete <- rnorm(100)
#' clear()
#'
#' @export

clear <- function() {
  things_to_clear <- ls()
  rm(list = things_to_clear)
}
