$(function () {
    $(".img-responsive").lazyload({
        effect: "fadeIn"
    });

    $('input:radio').change(function (element) {
        SearchingCarsForYou();
    });
});

function SearchingCarsForYou() {
    $.ajax({
        url: '/Car/SearchingCarsForYou',
        data: { CurrentPageIndex: 1, ItemsPerPage: 25 },
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

function SearchingCarsNewOld() {
    $.ajax({
        url: '/Car/SearchingCarsNewOld',
        data: { CurrentPageIndex: 1, ItemsPerPage: 25 },
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

function SearchingCarsImportDomestic() {
    $.ajax({
        url: '/Car/SearchingCarsImportDomestic',
        data: { CurrentPageIndex: 1, ItemsPerPage: 25 },
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