$(document).on 'ready', () ->
  $("#question_tag_list").tagsInput
    width: '100%'
    height: '1rem'

if onPage "questions", "show"
  question = $(".question-title").text()

  $.ajax
    dataType: "json"
    url: "/proxy/bing.json"
    data:
      query: question
    success: (data) ->
      links = $.map data.d.results, (result) ->
        "<li><a href='#{result.Url}'>#{result.Title}</a>"

      $("#bing-links")
        .find ".results"
        .html "<ul></ul>"
        .children "ul"
        .append links