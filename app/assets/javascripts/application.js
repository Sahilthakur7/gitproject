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
//= require activestorage
//= require turbolinks
//= require jquery3
//= require popper
//= require bootstrap
//= require_tree .


(function ($) {

    "use strict";





    /*==================================================================

    [ Validate ]*/

    var input = $('.validate-input .input100');



    $('.validate-form').on('submit',function(){

        var check = true;



        for(var i=0; i<input.length; i++) {

            if(validate(input[i]) == false){

                showValidate(input[i]);

                check=false;

            }

        }



        return check;

    });





    $('.validate-form .input100').each(function(){

        $(this).focus(function(){

            hideValidate(this);

        });

    });



    function validate (input) {

        if($(input).attr('type') == 'email' || $(input).attr('name') == 'email') {

            if($(input).val().trim().match(/^([a-zA-Z0-9_\-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([a-zA-Z0-9\-]+\.)+))([a-zA-Z]{1,5}|[0-9]{1,3})(\]?)$/) == null) {

                return false;

            }

        }

        else {

            if($(input).val().trim() == ''){

                return false;

            }

        }

    }



    function showValidate(input) {

        var thisAlert = $(input).parent();



        $(thisAlert).addClass('alert-validate');

    }



    function hideValidate(input) {

        var thisAlert = $(input).parent();



        $(thisAlert).removeClass('alert-validate');

    }







})(jQuery);

