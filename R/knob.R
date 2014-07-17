#' @export
knob <- function(title, value, min, max, width = NULL, height = NULL, ...){
  params = list(title = title, value = value, min = min, max = max,
    width = width, height = height, ...               
  )
  params = Filter(Negate(is.null), params)
  structure(params, class = c('knob', 'htmlwidget'))
}

#' @export
widget_div.knob <- function(x, id, style, class){
  tags$input(type = "text", class = class, id = id)
}

#' @export
knobOutput <- htmlwidgets::widgetOutput('knob')


