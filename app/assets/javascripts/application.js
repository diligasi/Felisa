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

/* Gerencia a exibição do load e da lista de presentes */
function hideLoadding() {
    $('#loading').hide();
    $('.embed-container').css("visibility", "visible");
};

/* Gerencia o comportamento dos componentes de abas e accordions */
function accordionsAndTabsController(itensList, selectedItem) {
    if (Array.isArray(itensList) && selectedItem) {
        $("body").click(function(event) {
            var clickedItem = event.target.id;

            if (itensList.indexOf(clickedItem) >= 0) {
                $('#' + selectedItem).removeClass('selected');
                $('.' + selectedItem).removeClass('selected');
                $('#' + clickedItem).addClass('selected');
                $('.' + clickedItem).addClass('selected');
                selectedItem = clickedItem;
            }
        });
    } else {
        alert("Para funcionar o metodo 'accordionsAndTabsController' precisa receber um Array de Strings com os Ids de todas as divs e o primeiro item selecionado.");
    }
};

function initAllSliders() {
    var textbgcss = "display:block; position:absolute; top:0px; left:0px; width:100%; height:100%; background-color:#333333; opacity:0.6; filter:alpha(opacity=60);";
    var titlecss = "display:block; position:relative; font:bold 14px \"Lucida Sans Unicode\",\"Lucida Grande\",sans-serif,Arial; color:#fff;"

    // Slider da home page
    initSlider(0, 600, 450);
    // Lightbox com fotos dos pais da Isa e do felipe respectivamente
    initSlider(1, 186, 139, false, 'Classic', 'none', 'static', textbgcss, 'bottomleft', false, false, 'none', titlecss, 'Bottom bar', true);
    initSlider(2, 186, 139, false, 'Classic', 'none', 'static', textbgcss, 'bottomleft', false, false, 'none', titlecss, 'Bottom bar', true);
    // Lightbox com fotos dos padrinhos
    for (i = 3; i <= 45; i++) {
        initSlider(i, 250, 186, false, 'Classic', 'none', 'static', null, null, false, false, 'none', null, null, false);
    }
};

function initTabs() {
    var managerTabsList, tabsList, kidsList;
    managerTabsList = ["managerTabOne", "managerTabTwo", "managerTabThree", "managerTabFour"];
    accordionsAndTabsController(managerTabsList, "managerTabOne");
    tabsList = ["tabOne", "tabTwo", "tabThree", "tabFour", "tabFive", "tabSix", "tabSeven", "tabEight", "tabNine", "tabTen", "tabEleven", "tabTwelve", "tabThirteen", "tabFourteen"];
    kidsList = ["tabFifteen", "tabSixteen", "tabSeventeen", "tabEighteen"];
    accordionsAndTabsController(tabsList, "tabOne");
    accordionsAndTabsController(kidsList, "tabFifteen");
};

function initAccordion() {
    var accordionList;
    accordionList = ["accordionOne", "accordionTwo", "accordionThree"];
    accordionsAndTabsController(accordionList, "accordionOne");
};

/* Ajusta o tamanho da imagem de background ao redimencionar o viewport do sistema */
$(window).on('resize', function(){
    backgroundResize();
});

/* Funções a serem inicializadas com o sistema */
$(document).on('ready page:load', function(){
    backgroundResize();
    initAllSliders();
});

$(document).ready(function(){
    backgroundResize();
    initAllSliders();
});
