(function(){
    console.log('loaded bro!');
    $('#vote').click(startVoting);
})();

function startVoting(){
  $('.show-template').empty();
  $('.vote-template').css('visibility', 'visible');
  var meals = grabMeals();
  $(document).ajaxComplete(function(){
    // appendMeal(meals[0]);
    console.log(meals);
  });
}

function grabMeals(){
  $.ajax({
    method: 'GET',
    url: 'get_meals',
    dataType: 'JSON'
  }).done(function(data){
    console.log(data);
    return data;
  });
}

function appendMeal(meal){
  $('#vote-meal-pic').append('<p>pic</p>');
  $('#vote-meal-goalname').append('<p><p>').html(meal["goal_id"]);
  $('#vote-meal-comment').append('<p></p>').html(meal["comment"]);
  $('#vote-meal-ingredients').append('<p></p>').html(meal["ingredients"]);
}
