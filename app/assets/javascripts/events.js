$( document ).ready(function() {
  // Copia el texto del input en Show
  $(function () {
    $('#inputButton').click(function(){
      $('#eventLink').focus();
      $('#eventLink').select();
      document.execCommand('copy');
    });
  });
});