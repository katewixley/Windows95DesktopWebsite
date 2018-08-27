$(document).ready(function () {
    //Start nav bar
    $('.startbutton').click(function () {
        // Show start nav bar
        if ($(".startBarShowing").css('display') == 'block') {
            $('.startBarShowing').css("display", "none");
        }else{
            $('.startBarShowing').css("display", "block");
        }
    })
});