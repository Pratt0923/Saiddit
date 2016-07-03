$(document).ready(function() {

  $(".upvote").click(function() {
    var findPostId = $(this).find("p.id-of-post").text();
    var upButton = $(this).find(".buttonUp");
    var downButton = $(this).find(".buttonDown");

    upButton.addClass("orange")
    $(".voteButtons").find(".buttonDown").removeClass("orange")

    $.ajax("/post/" + findPostId + "/upvote.json", {
      method: "PUT",
      success: function(data) {
        console.log(data.message)
      },
      error: function() { alert("Something went wrong!") }
    });
  });




  $(".downvote").click(function() {
    var findPostId = $(this).find("p.id-of-post").text();
    var upButton = $(this).find(".buttonUp");
    var downButton = $(this).find(".buttonDown");

    downButton.addClass("orange")
    $(".voteButtons").find(".buttonUp").removeClass("orange")

    $.ajax("/post/" + findPostId + "/downvote.json", {
      method: "PUT",
      success: function(data) {
        console.log(data.message)
     },
      error: function() { alert("Something went wrong!") }
    });
  });
})
