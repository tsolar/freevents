// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//  require turbolinks // turbolinks makes dropdown-menu stop working
//= require jquery3
//= require popper
//= require bootstrap-sprockets
//= require jquery-datetimepicker/build/jquery.datetimepicker.full
//= require cocoon
//= require_tree .

const datetimepickerDefaults = {
  formatDate: 'y-m-d',
  format: 'Y-m-d H:i',
  allowBlank: true,
  defaultSelect: false,
  validateOnBlur: false
};

$('.datetimepicker').datetimepicker(datetimepickerDefaults);

$('.container').on('cocoon:after-insert', function() {
  $('.datetimepicker').datetimepicker(datetimepickerDefaults);
})
$.datetimepicker.setLocale('en');
