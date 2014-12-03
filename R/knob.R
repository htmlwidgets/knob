#' @export
knob <- function(title, value, min, max, width = NULL, height = NULL) {
  
  x <- list()
  x$title <- title
  x$value <- value
  x$min <- min
  x$max <- max
  
  htmlwidgets::createWidget('knob', x, width = width, height = height)
}

#' @export
knobOutput <- function(outputId, width = "100%", height = "500px") {
  htmlwidgets::shinyWidgetOutput(outputId, "knob", width, height, package = "knob")
}

#' @export
renderKnob <- function(expr, env = parent.frame(), quoted = FALSE) {
  if (!quoted) { expr <- substitute(expr) } # force quoted
  htmlwidgets::shinyRenderWidget(expr, knobOutput, env, quoted = TRUE)
}

knob_html <- function(id, style, class, ...){
  htmltools::tags$input(type = "text", class = class, id = id)
}
