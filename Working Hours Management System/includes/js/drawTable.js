$(function() {
    drawTable();

    $(window).resize(function(e) {
        drawTable();
    });
});

function drawTable() {
    //HEIGTHS:
    var windowHeight = $(window).outerHeight(); //WINDOW HEIGHT
    var footer = $("#footer").outerHeight(); //FOOTER HEIGHT
    var margin_top = $("#layout-table").css("margin-top");
    margin_top = parseInt(margin_top, 10); //10 IS A FUNCTION DEFINED VALUE, NOT RELATED TO PAGE CONTENT
    
    //SET TABLE DYNAMIC HEIGTH
    $("#layout-table").height(windowHeight-footer-margin_top);  
}