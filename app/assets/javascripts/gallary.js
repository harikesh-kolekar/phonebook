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
//= require gallaryimage.js
// require jquery.flex.js

//=require jphotogrid.js
//=require setup.js

function show_error(message)
  {
      $("#error")[0].innerHTML  = '<div class="alert alert-warning alert-dismissible" role="alert"><button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true"></span></button>' + message + ' </div>';
  }



function ValidateFileUpload() {
	var fuData = document.getElementById('gallary_photo');
	var FileUploadPath = fuData.value;

    var Extension = FileUploadPath.substring(FileUploadPath.lastIndexOf('.') + 1).toLowerCase();
    if (Extension == "gif" || Extension == "png" || Extension == "bmp"
                || Extension == "jpeg" || Extension == "jpg" || Extension == "xcf" || Extension == "gif" || Extension == "TIFF" || Extension == "GIF") {
            if (fuData.files && fuData.files[0]) {

                var size = fuData.files[0].size;

                if(size > MAX_SIZE){
                    alert("Maximum file size exceeds");
                    return;
                }else{
                    var reader = new FileReader();

                    reader.onload = function(e) {
                        $('.errorr').attr('src', e.target.result);
                    }

                    reader.readAsDataURL(fuData.files[0]);
                }
            }
    } 
	else {
	        show_error("Photo only allows file types of GIF, PNG, JPG, JPEG and BMP. ");
	        return false;
	    }
	 
 	return true
}