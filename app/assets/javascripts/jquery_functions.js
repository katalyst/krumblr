// Added below function to toggle divs that have forms to add new blogs/ posts
$(document).on('turbolinks:load', function() {
  $('button#showFormButton').click(function (event) {
    event.preventDefault();
    $('div#showFormDiv').toggle(true);
  });
});