(function(){
    console.log('loaded bro!');
    $('#vote').click(startVoting);

})();

function startVoting(){
  $('.show-template').empty();
  $('.vote-template').css('visibility', 'visible');
  grabMeals();
}

function grabMeals(){
  $.ajax({
    method: 'GET',
    url: 'get_meals',
    dataType: 'JSON'
  }).done(function(data){
    console.log(data);
    for(var i = 0; i < data.length; i++){
      console.log(data[i]);
    }
  });
}
