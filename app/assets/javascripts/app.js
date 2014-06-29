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
    console.log(data);
    return data;
  });
  appendMeal(meals["responseJSON"][0][0], meals["responseJSON"][0][1]);
}

function appendMeal(meal, image){
  console.log(meal["id"]);
  console.log(meal);
  $('#vote-meal-pic').empty().append("<img src=" + image + "/>");
  $('#vote-meal-goalname').append('<p><p>').html(meal["goal_id"]);
  $('#vote-meal-comment').append('<p></p>').html(meal["comment"]);
  $('#vote-meal-ingredients').append('<p></p>').html(meal["ingredients"]);
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
    console.log(data);
    startVoting();
  });
}
