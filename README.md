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
k1 = knob('Test', 20, 0, 100, angleArc = 250, angleOffset = -125, 
  fgColor = "#66CC66"
)
k1
```

![knob1](http://i.imgur.com/2wekMlK.png)

We can also use it in a Shiny application.

```r
library(shiny)
library(htmlwidgets)
library(knob)
ui = bootstrapPage(
  tags$style('body{margin-left:40px; margin-top:40px;}'),
  sliderInput('value', 'Value', 0, 200, 50),
  sliderInput('angleArc', 'Arc Angle', 0, 360, 250),
  knobOutput('live_gauge', width = 250, height = 200)
)
server = function(input, output, session){
  output$live_gauge <- renderWidget(list(
    title = 'My Gauge',
    min = 0,
    value = input$value,
    angleArc = input$angleArc,
    max = 200,
    fgColor="#66CC66"
  ))
}

runApp(list(ui = ui, server = server))
```

![knob2](http://i.imgur.com/f9p07hI.png)

### See Also

The `knob` package makes use of the `htmlwidgets` package that makes it super-simple to package any HTML widget for R. Please read [this](http://github.com/htmlwidgets/blob/master/README.md) to get a better sense on how the `htmlwidgets` package can make your life easier!
