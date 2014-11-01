// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require jquery-ui/autocomplete
//= require jquery-ui/effect-highlight
//= require jquery.tagsinput
//= require foundation
//= require_tree .

$(function(){ $(document).foundation(); });

$(document).on('ready', function () {
    var search_terms = [];
    $(".hoverbox").each(function(){
        search_terms.push(this.id);
    });

    search_terms.forEach( function(search_term) {

        $.ajax({
            url: "https://api.stackexchange.com/2.2/tags/" + search_term + "/wikis",
            data: {"site": "stackoverflow"},
            success: function (data) {
                if (data.items[0]) {
                  $(".hoverbox#" + search_term)
                  .append(data.items[0].excerpt);
                } else {
                    $(".hoverbox#" + search_term).hide();
                  }

            }
        });

    })

});
