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
        $('.close').parent().css("display", "none")
    })

    $(function () {
        $("#ErrorMessage").draggable();
    });

});

window.addEventListener('keydown', function (e) {
    const audio = document.querySelector(`audio`);
    audio.play();
})

window.addEventListener('click', function () {
    const audio = document.querySelector(`audio[data-key="60"]`);
    audio.play();
})

