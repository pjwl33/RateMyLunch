var individualCharts = {};

function leaderboardReady(){
  setupClickEvents();
  var chartArray = $('.leaderboard-individual-chart');
  for (var i = 0; i < chartArray.length; i++) {
    individualCharts[chartArray[i].id.replace(/leaderboard-/, '')] = chartArray[i];
    chartArray[i].remove();
  }
  $(".leaderboard-button").eq(0).click();
}

function setupClickEvents() {
  $(".leaderboard-button").click(function(){
    $(".leaderboard-button").removeClass("success");
    $(this).addClass("success");
    $("#leaderboard-chart").empty();
    var chartToShow = individualCharts[this.id];
    $(chartToShow).appendTo("#leaderboard-chart");
    var chartHeight = $('#leaderboard-chart').height() - 100;
    $('.leaderboard-meal img').css("margin-bottom", "0px");
    $('.leaderboard-meal img').each(function(){
      var newHeight = chartHeight * (parseFloat(this.id) / 5) + "px";
      $(this).animate({
        "margin-bottom": newHeight
      }, 800);
    });
  });
}

$(document).ready(leaderboardReady);
$(document).on('page:load', leaderboardReady);
