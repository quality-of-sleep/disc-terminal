$(document).ready(function () {

  $('.show-content').on('mouseover',function() {
    $($(this).children()).show();
      return false;
   });
  $('.show-content').on('mouseout',function() {
    $($(this).children()).hide();
        return false;
     });

});
