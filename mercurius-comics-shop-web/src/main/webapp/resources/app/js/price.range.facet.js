$(document).ready(function() {
    /** Price range **/
    $("#price_range").slider({
        min : 0,
        max : 25000,
        value : [parseFloat($("#bottom_price").val()), parseFloat($("#top_price").val())],
        range : true,
        step : 10
    }).on("change", function() {
        var values = $("#price_range").slider("getValue");
        var bottomPrice = values[0];
        var topPrice = values[1];
        $("#bottom_price_input").val(bottomPrice);
        $("#top_price_input").val(topPrice);
    });

    $(".number_field").numberMask({pattern:/^\d+\.{0,1}\d*$|^\d+,{0,1}\d*$|^$/});

    /** Number fields */
    $("#bottom_price_input").on("change", function() {
        updatePriceSlider();
    });
    $("#top_price_input").on("change", function() {
        updatePriceSlider();
    });

});

function updatePriceSlider() {
    var priceRange = [];
    priceRange.push(parseFloat($("#bottom_price_input").val()));
    priceRange.push(parseFloat($("#top_price_input").val()));
    $("#price_range").slider("setValue", priceRange);
    $("#price_range").slider("relayout");
}