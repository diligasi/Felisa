// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require ckeditor/init
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .


/* Ajusta o tamanho da imagem no background */
function backgroundResize(){
    var windowH = $(window).height();
    $(".background").each(function(i){
        var path = $(this);

        // Variavéis
        var contW = path.width();
        var contH = path.height();
        var imgW = path.attr("data-img-width");
        var imgH = path.attr("data-img-height");
        var ratio = imgW / imgH;
        var remainingH = 0;

        // Sobrescrevendo diferenças
        var diff = parseFloat(path.attr("data-diff"));
        diff = diff ? diff : 0;

        // Setando valores de acordo com o cont
        imgH = contH + remainingH + diff;
        imgW = imgH * ratio;

        // Corrigindo quando o valor é muito alto
        if(contW > imgW){
            imgW = contW;
            imgH = imgW / ratio;
        }

        path.data("resized-imgW", imgW);
        path.data("resized-imgH", imgH);
        path.css("background-size", imgW + "px " + imgH + "px");
    });
};

/* Ajusta o tamanho da imagem de background ao redimencionar o viewport do sistema */
$(window).on('resize', function(){
    backgroundResize();
});

/* Funções a serem inicializadas com o sistema */
$(document).on('ready page:load', function(){
    backgroundResize();
    homeSliderPic();
});

/* Gerencia a exibição do load e da lista de presentes */
function hideLoadding() {
    $('#loading').hide();
    $('.embed-container').css("visibility", "visible");
};

function homeSliderPic() {
    var options = {
        $AutoPlay: true,        //[Optional] Whether to auto play, to enable slideshow, this option must be set to true, default value is false
        $DragOrientation: 3     //[Optional] Orientation to drag slide, 0 no drag, 1 horizental, 2 vertical, 3 either, default value is 1 (Note that the $DragOrientation should be the same as $PlayOrientation when $DisplayPieces is greater than 1, or parking position is not 0)
    };

    var jssor_slider1 = new $JssorSlider$("slider1_container", options);
};
