App.module("Common.Views", function(Views, App, Backbone, Marionette, $, _){
  Views.Loading = Marionette.ItemView.extend({
    template: "#common_loading",

    title: "Loading Data",
    message: "Please wait...",

    serializeData: function() {
      return {
        title: Marionette.getOption(this, "title"),
        message: Marionette.getOption(this, "message")
      }
    },
  });

  Views.NoData = Marionette.ItemView.extend({
    template: "#common_no_data",

    title: "Loading Data",
    message: "Please wait...",

    serializeData: function() {
      return {
        title: Marionette.getOption(this, "title"),
        message: Marionette.getOption(this, "message")
      }
    },
  });
});
