

function hideAndShowPanelHandler(buttonId, panelId) {
    var button = $("#" + buttonId);
    var buttonClass = button.attr("class");
    if (buttonClass == "glyphicon glyphicon-menu-down") {
        button.attr("class", "glyphicon glyphicon-menu-up");
        $("#" + panelId).hide(500);
    } else {
        if (buttonClass == "glyphicon glyphicon-menu-up") {
            button.attr("class", "glyphicon glyphicon-menu-down");
            $("#" + panelId).show(500);
        }
    }

}