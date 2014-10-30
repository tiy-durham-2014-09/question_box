var onPage = function (controller, action) {
  return $("body." + controller + "-" + action).length
}

var negativeAnswerText = function (count) {
  var text = "There ";
  if (count === 1) {
    text += "is "
  } else {
    text += "are ";
  }
  text += count;
  // same as using an if/else statement
  text += (count === 1 ? " answer " : " answers ");
  text += "hidden. Click here to show "
  text += (count === 1 ? "it." : "them.");
  return text;
};

var hideNegativeAnswers = function () {
  var $negativeAnswers = $(".answer[data-negative=true]");
  var negativeCount = $negativeAnswers.length;
  if (negativeCount > 0) {
    $negativeAnswers.hide();
    // Create new link to show the hidden answers.
    var linkHTML = "<a href='#'>" + negativeAnswerText(negativeCount) + "</a>";
    $(linkHTML)
      .appendTo("#answers")
      .on('click', function (event) {
        event.preventDefault();
        $(this).fadeOut();
        $negativeAnswers.fadeIn();
      });
  }
}


$(document).on('ready', function () {
  $("#question_tag_list").tagsInput({
    width: '100%',
    height: '1rem'});

  if (onPage("questions", "show")) {
    var question = $(".question-title").text();

    $.ajax({
      dataType: "json",
      url: "/proxy/bing.json",
      data: {"query": question},
      success: function (data) {
        var links = $.map(data.d.results, function (result) {
          return "<li><a href='" + result.Url + "'>" + result.Title + "</a></li>";
        });

        $("#bing-links")
          .find(".results")
          .html("<ul></ul>")
          .children("ul")
          .append(links);
      }
    });

    hideNegativeAnswers();
  }
});

