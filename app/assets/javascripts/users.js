//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .
//= require materialize-sprockets

$('input[type=checkbox]').change(function(e){
   if ($('input[type=checkbox]:checked').length > 3) {
        $(this).prop('checked', false)
   }
})