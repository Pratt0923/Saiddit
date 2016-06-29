$(document).ready(function() {
  //with this next bit I am trying to get it to pick up the previous upvote and downvote sizes so that
  //I can add/subtrach the data.message from it. The problem is that I am not writting it correctly
  //and it does not know that I am talking about a specifc post so it finds the nums for all of them
  //and jams them together and then does the calculations. Any ideas on how I can format this so that
  //it will work?
  var upvoteSize = parseInt($(".voteButtons").find(".upvotessize").text())
  var downvoteSize = parseInt($(".voteButtons").find(".downvotessize").text())
  console.log(upvoteSize)
  console.log(downvoteSize)
  var score = (upvoteSize - downvoteSize)


  $(".upvote").click(function() {
    var findPostId = $(this).find("p.id-of-post").text();
    var upButton = $(this).find(".buttonUp");
    var downButton = $(this).find(".buttonDown");
    
    upButton.addClass("orange")
    $(".voteButtons").find(".buttonDown").removeClass("orange")

    $.ajax("/post/" + findPostId + "/upvote.json", {
      method: "PUT",
      success: function(data) {
        //This does it for all of them and I need it to only do it for the one I am hitting the vote for
        $(".total-votes-size").text(data.message)
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
        $(".total-votes-size").text(data.message)
      },
      error: function() { alert("Something went wrong!") }
    });
  });
})
