$(document).on('turbolinks:load', function() {
  $('button#showFormButton').click(function (event) {
    event.preventDefault();
    $('div#showFormDiv').toggle(true);
  });
});