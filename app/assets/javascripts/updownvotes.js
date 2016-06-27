
var num = 0;

var votesCount = function() {
  $(".total-votes p").text( (num) + " votes" )
}

var resetText = function() {
  now = new Date();
    var date = now.toLocaleDateString();
    var time = now.toLocaleTimeString();
  $(".reset p").append( "reset from " + (num) + " at" + (now) )
}

var removeResets = function() {
  $(".reset p").empty()
}


$(document).ready(function() {
  var upvote = $(".upvote")
  votesCount();



  $(".downvote").click(function() {
      num -= 1;
      if ( num < 10 ) {
        upvote.removeClass("over");
      }
      votesCount();
});

  $(".upvote").click(function() {
    num += 1;
    if ( num >= 10 ) {
      upvote.addClass("over");
    }
    votesCount();
});

  $(".reset button").click(function() {
    resetText()
    num = 0;
    votesCount();
});

  $(".clear button").click(function() {
    removeResets()
  })



});
