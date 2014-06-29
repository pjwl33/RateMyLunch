(function(){
  console.log('loaded bro!');
  $('#vote').click(startVoting);
})();

function startVoting(){
  $('.show-template').empty();
  $('.vote-template').css('visibility', 'visible');
  var meals = $.ajax({
    method: 'GET',
    url: 'get_meals',
    dataType: 'JSON',
    async: false
  }).done(function(data){
    console.log(data.length);
    return data;
  });
  console.log(meals["responseJSON"].length <= 0);
  if (meals["responseJSON"].length <= 0){
    $('.vote-template').empty();
    $('.finished-voting').css('visibility', 'visible');
    console.log('done, yo');
  } else {
    var mealObject = meals["responseJSON"][0][0];
    var image = meals["responseJSON"][0][1];
    var goalName = meals["responseJSON"][0][2];
    appendMeal(mealObject, image, goalName);
  }
}


function appendMeal(meal, image, goalName){
  $('#vote-meal-pic').empty().append("<img src=" + image + "/>");
  $('#vote-meal-goalname').append('<p><p>').html("<strong>Goal Category: </strong>" + goalName);
  $('#vote-meal-comment').append('<p></p>').html("<strong>Comment: </strong>" + meal["comment"]);
  $('#vote-meal-ingredients').append('<p></p>').html("<strong>Description: </strong>" + meal["ingredients"]);
  $('#rating-1').attr("onclick", "addRating(1, " + meal['id'] + ")");
  $('#rating-2').attr("onclick", "addRating(2, " + meal['id'] + ")");
  $('#rating-3').attr("onclick", "addRating(3, " + meal['id'] + ")");
  $('#rating-4').attr("onclick", "addRating(4, " + meal['id'] + ")");
  $('#rating-5').attr("onclick", "addRating(5, " + meal['id'] + ")");
}

function addRating(num, mealID){
  $.ajax({
    method: 'POST',
    url: '/ratings',
    dataType: 'JSON',
    data: {
      rating: num,
      meal_id: mealID
    }
  }).done(function(data){
    startVoting();
  });
}
