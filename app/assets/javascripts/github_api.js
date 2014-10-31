var username = "josechirivella14"

$.getJSON( "https://api.github.com/users/" + username, function( user ) {
  // $("#profile_pic").html("<img src='" + user.avatar_url +"' id='pic'>")
  // $("#github_name").html(user.name);
  $("#github_login").html(user.login);
  // $("#github_location").html(user.location);
  // $("#email").html("<a href='mailto:" + user.email + "'>" + user.email + "</a>");
  // $("#blog").html("<a href='" + user.blog + "'>" + user.blog + "</a>");
  // $("#created_at").html("Joined on " + moment(user.created_at).format('ll'));
  // $("#followers").html("<a href='" + user.followers_url + "'>" + user.followers + "</a>");
  // $("#following").html("<a href='" + user.following_url + "'>" + user.following + "</a>");
 });

 $.ajax({
      dataType: "json",
      url: "https://api.github.com/users/" + username + "/repos",
      success: function (data) {
        var repos_data = data;

        var repos = repos_data.sort(function(a, b){
          var dateA=new Date(a.pushed_at), dateB=new Date(b.pushed_at)
          return dateB-dateA
        });

        var sorted_repos = $.map(repos, function (repo) {
          return "<li><div class='repo_list_stats'>"
                 + repo.language + " <i class='fa fa-star'></i> " + repo.stargazers_count
                 + " <i class='fa fa-code-fork''></i> " + repo.forks_count + "</div><a href='"
                 + repo.url + "'>" + repo.name + "</a>" + "<br>"
                 + repo.description + "<p> Updated "
                //  + moment(repo.updated_at).fromNow()
                 + "</p></li>";
         });

    $("#repos")
      .html("<ul></ul>")
      .append(sorted_repos)
    console.log("completed request");
  }
});
