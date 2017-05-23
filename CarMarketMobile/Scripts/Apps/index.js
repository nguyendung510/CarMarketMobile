$(function () {
    $(".img-responsive").lazyload({
        effect: "fadeIn"
    });

    $('input:radio').change(function (element) {
        alert(this.value);
    });
});

function SearchingCarsForYou() {
    $.ajax({
        url: '/Car/SearchingCarsForYou',
        data: { category: $('#Category').val(), year: $('#Year').val(), status: $('#Status').val() === undefined ? -1 : $('#Status').val() },
        method: "POST",
        beforeSend: function () {
        },
        success: function (data) {
            $('#carListContainer').html(data);
        },
        error: function () {
        },
        complete: function () {
        }
    });
}