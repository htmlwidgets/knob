if (window.Shiny == undefined){
  renderKnob('#' + payload.id, payload)
} else {
// This output binding handles statusOutputBindings
  var knobOutputBinding = new Shiny.OutputBinding();
  $.extend(knobOutputBinding, {
    find: function(scope) {
      return scope.find('.knob_output');
    },
    renderValue: renderKnob
  });
  Shiny.outputBindings.register(knobOutputBinding, 'dashboard.knobOutputBinding');
}

function renderKnob(el, data){
  if (!$(el).val()){
    $(el).knob()
  }
  $(el).val(data.value).trigger('change')
  $(el).trigger('configure', data)
}