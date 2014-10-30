window.onPage = (controller, action) ->
  $("body.#{controller}-#{action}").length
