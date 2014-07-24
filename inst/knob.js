HTMLWidgets.widget({
  name: "knob",
  initialize: function(el) {
    $(el).knob();
  },
  renderValue: function(el, data) {
    $(el).trigger("configure", data);
    $(el).val(data.value).trigger("change");
  }
});
