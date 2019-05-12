// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
// require turbolinks
//= require bootstrap.min.js
//= require jquery.dataTables
//= require moment.min.js
//= require daterangepicker.js
//= require bootstrap-multiselect
 
$(document).ready(function() {
  $('#table').DataTable({
    bProcessing: true,
      bServerSide: true,
      sAjaxSource: $('#products').data('source')
    });
  $('#example').DataTable();
});

function show_error(message)
{
    $("#error")[0].innerHTML  = '<div class="alert alert-warning alert-dismissible" role="alert"><button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true"></span></button>' + message + ' </div>';
}
