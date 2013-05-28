//= require active_admin/base
//= require tinymce

$(document).ready(function() {
  tinyMCE.init({
     mode: 'textareas',
     theme: 'advanced'
   });
});