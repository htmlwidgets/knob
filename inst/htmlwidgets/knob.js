HTMLWidgets.widget({
  
  name: "knob",
  
  type: "output",
  
  initialize: function(el, width, height) {
    
    // sizing options
    var options = this.toSquare(width, height);
    
    // readOnly since this is a display widget
    options.readOnly = true;
    
    var $input = $("<input type='text'>");
    $(el).append($input);
    
    // initialize the knob
    $input.knob(options);
  },

  renderValue: function(el, x) {
    
    if(x.readOnly === false && HTMLWidgets.shinyMode) {
      // update shiny value on change
      x.change = function(v) {
        Shiny.onInputChange(el.id + "_value", v);
      };
      Shiny.onInputChange(el.id + "_value", x.value);    // Return the initial value
    }
    
    $(el).find("input")
      .trigger("configure", x)  // forward options to the knob
      .val(x.value)             // set the knob value
      .trigger("change");       // alert the knob to its new value
  },

  resize: function(el, width, height) { 
    // size the knob as dictated by the enclosing widget's size
    $(el).find("input")
      .trigger("configure", this.toSquare(width, height));
  },
  
  // knob relies on being rendered with equal width
  // and height -- this function ensures that the
  // values are the same
  toSquare: function(width, height) {
    var size = Math.min(width, height);
    return {
      width: size,
      height: size
    };
  }
  
});
