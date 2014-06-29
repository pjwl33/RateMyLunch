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
    return data;
    });
  appendMeal(meals["responseJSON"][0]);
}

// function grabMeals(){
//   $.ajax({
//     method: 'GET',
//     url: 'get_meals',
//     dataType: 'JSON',
//     async: false
//   }).done(function(data){
//     return data;
//     });
// }



function appendMeal(meal){
  console.log(meal["id"]);
  $('#vote-meal-pic').append('<p>pic</p>');
  $('#vote-meal-goalname').append('<p><p>').html(meal["goal_id"]);
  $('#vote-meal-comment').append('<p></p>').html(meal["comment"]);
  $('#vote-meal-ingredients').append('<p></p>').html(meal["ingredients"]);
}
