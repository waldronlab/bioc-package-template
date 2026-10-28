#' Say hello
#'
#' A placeholder function so the package passes `R CMD check` and BiocCheck
#' from the first commit. Replace it with real code.
#'
#' @param name `character(1)`. Who to greet.
#'
#' @return `character(1)`, the greeting.
#'
#' @examples
#' hello("world")
#'
#' @export
hello <- function(name) {
    if (!is.character(name) || length(name) != 1L || is.na(name)) {
        stop("'name' must be a single, non-missing character string.",
            call. = FALSE)
    }
    paste0("Hello, ", name, "!")
}
