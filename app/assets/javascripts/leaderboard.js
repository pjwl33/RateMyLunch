var individualCharts = {};

function leaderboardReady(){
  setupClickEvents();
  var chartArray = $('.leaderboard-individual-chart');
  for (var i = 0; i < chartArray.length; i++) {
    individualCharts[chartArray[i].id.replace(/leaderboard-/, '')] = chartArray[i];
    chartArray[i].remove();
  }
  setTimeout(function(){
    $(".leaderboard-button").eq(0).click();
  }, 500);
}

function setupClickEvents() {
  $(".leaderboard-button").click(function(){
    $(".leaderboard-button").removeClass("success");
    $(this).addClass("success");
    $("#leaderboard-chart").empty();
    var chartToShow = individualCharts[this.id];
    $(chartToShow).show();
    $(chartToShow).appendTo("#leaderboard-chart");
    // Account for h1, image, rating heights
    var baseHeight = $('#leaderboard-chart').height() - $('.leaderboard-individual-chart h1').eq(0).height() - $('img').eq(0).height() - 20;
    $('.leaderboard-meal img').css("margin-bottom", "0px");
    $('.leaderboard-meal img').each(function(){
      var newHeight = baseHeight * (parseFloat(this.id) / 5) + "px";
      $(this).animate({
        "margin-bottom": newHeight
      }, 800);
    });
  });
}

$(document).ready(leaderboardReady);
$(document).on('page:load', leaderboardReady);
