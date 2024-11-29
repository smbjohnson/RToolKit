#' A add in that runs a clears the working environment and packages and runs from the top
#'
#' @return The environment a script run top to bottom
#'
#' @export

from_the_top <- function() {
  to_remove <- ls(envir = globalenv())
  rm(list = to_remove, envir = globalenv())
  pacman::p_unload(pacman::p_loaded(), character.only = TRUE)
  path <- rstudioapi::getActiveDocumentContext()
  print('starting script')
  source(path$path)
  print('finished script')
}

