#' @export
knob <- function(title, value, min, max, width = NULL, height = NULL, ...){
  params = list(title = title, value = value, min = min, max = max,
    width = width, height = height, ...               
  )
  params = Filter(Negate(is.null), params)
  htmlwidgets::createWidget('knob', params,
    sizingPolicy = htmlwidgets::sizingPolicy(padding = 0, browser.fill = TRUE)          
  )
}

#' @export
knob_html <- function(id, style, class, ...){
  tags$input(type = "text", class = class, id = id)
}

#' @export
knobOutput <- htmlwidgets::makeShinyOutput('knob')

#' @export
renderKnob <- htmlwidgets::makeShinyRender(knobOutput)


