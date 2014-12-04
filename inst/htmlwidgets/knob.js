HTMLWidgets.widget({
  
  name: "knob",
  
  type: "output",
  
  initialize: function(el, width, height) {
    
    // sizing options
    var options = this.toSquare(width, height);
    
    // readOnly since this is a display widget
    options.readOnly = true;
    
    // initialize the knob
    $(el).knob(options);
  },

  renderValue: function(el, x) {
    
    // forward options to the knob
    $(el).trigger("configure", x);
    
    // set the knob value and trigger a change event
    $(el).val(x.value).trigger("change");
    
  },

  resize: function(el, width, height) { 
    
    // size the knob as dictated by the enclosing widget's size
    $(el).trigger("configure", this.toSquare(width, height));
  
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
