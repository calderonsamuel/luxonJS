#' <Add Title>
#'
#' <Add Description>
#'
#' @param datetime
#'
#' @import htmlwidgets
#'
#' @export
lux_to_relative <- function(datetime, usetz = TRUE, width = NULL, height = NULL, elementId = NULL) {

  stopifnot(lubridate::is.POSIXct(datetime))

  # forward options using x
  x = list(
    datetime = lubridate::format_ISO8601(datetime, usetz = usetz)
  )

  # create widget
  htmlwidgets::createWidget(
    name = 'lux_to_relative',
    x,
    width = width,
    height = height,
    package = 'luxonJS',
    elementId = elementId
  )
}

#' Shiny bindings for lux_to_relative
#'
#' Output and render functions for using lux_to_relative within Shiny
#' applications and interactive Rmd documents.
#'
#' @param outputId output variable to read from
#' @param width,height Must be a valid CSS unit (like \code{'100\%'},
#'   \code{'400px'}, \code{'auto'}) or a number, which will be coerced to a
#'   string and have \code{'px'} appended.
#' @param expr An expression that generates a lux_to_relative
#' @param env The environment in which to evaluate \code{expr}.
#' @param quoted Is \code{expr} a quoted expression (with \code{quote()})? This
#'   is useful if you want to save an expression in a variable.
#'
#' @name lux_to_relative-shiny
#'
#' @export
lux_to_relative_output <- function(outputId, width = '100%', height = '400px'){
  htmlwidgets::shinyWidgetOutput(outputId, 'lux_to_relative', width, height, package = 'luxonJS')
}

#' @rdname lux_to_relative-shiny
#' @export
render_lux_to_relative <- function(expr, env = parent.frame(), quoted = FALSE) {
  if (!quoted) { expr <- substitute(expr) } # force quoted
  htmlwidgets::shinyRenderWidget(expr, lux_to_relative_output, env, quoted = TRUE)
}
