#= require active_admin/base
#= require tinymce

$(document).ready ->
  tinyMCE.init
    mode: "textareas"
    theme: "modern"
