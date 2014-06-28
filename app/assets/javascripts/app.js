(function(){
    console.log('loaded bro!');
    $('#vote').click(startVoting);

})();

function startVoting(){
  $('body').empty();
  $('body').append('<p>Vote baby!</p>');
}
