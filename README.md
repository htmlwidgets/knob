## knob

This is an experimental R package that provides a [jquery Knob](http://anthonyterrien.com/knob/) html widget for R.

### Installation

You can install it from `github`.

```r
library(devtools)
install_github('rstudio/htmltools')
install_github('ramnathv/htmlwidgets')
install_github('ramnathv/knob')
```

### Usage

Let us first create a simple knob.

```r
library(knob)
knob(value = 20, min = 0, max = 100, 
     angleArc = 250, angleOffset = -125, 
     fgColor = "#66CC66")
```

![knob1](http://i.imgur.com/2wekMlK.png)

We can also use it in a Shiny application.

```r
library(shiny)
library(knob)

ui = shinyUI(fluidPage(
  sliderInput('value', 'Value', 0, 200, 50),
  sliderInput('angleArc', 'Arc Angle', 0, 360, 250),
  knobOutput('gauge')
))

server = function(input, output){
  output$gauge <- renderKnob(knob(
    value = input$value,
    min = 0,
    max = 200,
    angleArc = input$angleArc,
    fgColor="#66CC66"
  ))
}

shinyApp(ui = ui, server = server)
```

![knob2](http://i.imgur.com/f9p07hI.png)

### See Also

The `knob` package makes use of the `htmlwidgets` package that makes it super-simple to package any HTML widget for R. Please read [this](http://github.com/ramnathv/htmlwidgets/blob/master/README.md) to get a better sense on how the `htmlwidgets` package can make your life easier!
