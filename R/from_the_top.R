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
  start.time <- Sys.time()
  source(path$path)
  end.time <- Sys.time()
  time.taken <- round(end.time - start.time,2)
  print('finished script. Took ', time.taken, 'seconds')
}

#' A add in that runs a script in the background but doesn't return output
#'
#' @return Everything is run in the background and nothing is output to the global environment
#'
#' @export

from_the_top_bkgd <- function() {
  path <- rstudioapi::getActiveDocumentContext()
  rstudioapi::jobRunScript(path = path$path,
                           importEnv = FALSE,
                           exportEnv = '')
}

#' A add in that runs a script in the background and returns output to global environment
#'
#' @return Everything is run in the background and output is returned to global environment
#'
#' @export

from_the_top_bkgd_output <- function() {
  path <- rstudioapi::getActiveDocumentContext()
  rstudioapi::jobRunScript(path = path$path,
                           importEnv = FALSE,
                           exportEnv = 'R_GlobalEnv')
}
