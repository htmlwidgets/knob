#' @export
knob <- function(value, min, max, step = 1, 
                 angleOffset = 0, angleArc = 360,
                 font = NULL, fgColor = NULL, bgColor = NULL, readOnly = TRUE,
                 width = NULL, height = NULL) {
  
  # create a list containing the options uses to configure the knob
  x <- list()
  x$value <- value
  x$min <- min
  x$max <- max
  x$step <- step
  x$angleOffset <- angleOffset
  x$angleArc <- angleArc
  x$font <- font
  x$fgColor <- fgColor
  x$bgColor <- bgColor
  x$readOnly <- readOnly
  
  # create the widget
  htmlwidgets::createWidget('knob', x, width = width, height = height)
}

# shiny bindings
#' @export
knobOutput <- function(outputId, width = "400px", height = "400px") {
  htmlwidgets::shinyWidgetOutput(outputId, "knob", width, height, package = "knob")
}
#' @export
renderKnob <- function(expr, env = parent.frame(), quoted = FALSE) {
  if (!quoted) { expr <- substitute(expr) } # force quoted
  htmlwidgets::shinyRenderWidget(expr, knobOutput, env, quoted = TRUE)
}
