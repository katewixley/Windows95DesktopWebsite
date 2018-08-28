$(document).ready(function () {
    //Start nav bar
    $('#startbutton').click(function () {
        // Show start nav bar
        console.log();
        if ($(".startBarShowing").css('display') == 'block') {
            $('.startBarShowing').css("display", "none");
        } else {
            $('.startBarShowing').css("display", "block");
        }
    })

    $('.close').click(function () {
       $('.close').parent().css("display","none")
    })
});

