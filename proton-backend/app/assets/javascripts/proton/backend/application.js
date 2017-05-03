// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require gentelella
//= require codemirror
//= require codemirror/modes/xml
//= require codemirror/modes/htmlmixed
//= require codemirror/modes/htmlembedded
//= require codemirror/modes/javascript
//= require codemirror/modes/css
//= require proton/backend/gentelella-custom
//= require_tree .

$(document).ready(function() {
  init_sidebar();
  init_wysiwyg();
  init_InputMask();
  init_autosize();
});

window.init_codemirror = function($nodes, options) {
  options = options || {}

  $.each($nodes, function(i, textarea) {
    var $textarea = $(textarea)
    var _options = $.extend({}, options, $textarea.data('cm'))
    var editor = CodeMirror.fromTextArea(textarea, _options)
  })
}
