(function(){
    console.log('loaded bro!');
    $('#vote').click(startVoting);

})();

function startVoting(){
  $('.show-template').empty();
  $('.vote-template').css('visibility', 'visible');
}
