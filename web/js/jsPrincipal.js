var menuActualActivo = null;
var menuDespegableActivo = null;

$(document).ready(function () {
    $('#side-menu a').click(function (e) {
        e.preventDefault();
        if (!$(this).hasClass("dropdown-toggle")) {
            url = $(this).attr("href");
            load(url, "divPrincipal");
            if (menuActualActivo !== null) {
                $(menuActualActivo).removeClass("active");
            }
            menuActualActivo = $(this).parent();
            $(menuActualActivo).addClass("active");
        }
    });
});

function load(url, id, data) {
    $("#" + id).html(cargandoHtml);
    $.ajax({
        url: url,
        data: data,
        success: function (datos) {
            $("#" + id).html(datos);
        },
        error: function (xhr, ajaxOptions, thrownError) {
            alert(xhr.status + "\n" + thrownError);
        }
    });
}

function dataTable(id) {
    $('#' + id).DataTable({
        responsive: true,
        "language": {
            "url": "dist/spanish.json"
        }
    });
}

function showSms(sms, id) {
    if (sms.tipo === 1) {//exito
        tipo = "success";
    } else {//error "0"
        tipo = "danger";
    }
    $("#" + id).fadeIn("slow");
    $("#" + id).html("<div class=\"alert alert-" + tipo + " alert-dismissable\"> <button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-hidden=\"true\">&times;</button>" + sms.mensaje + "</div>");
    $("#" + id).fadeOut(7000);
}

function showSmsGritter(sms) {
    $.gritter.add({
        // (string | mandatory) the heading of the notification
        title: 'Muy bien!',
        // (string | mandatory) the text inside the notification
        text: sms.mensaje,
        // (string | optional) the image to display on the left
        //image: 'http://a0.twimg.com/profile_images/59268975/jquery_avatar_bigger.png',
        // (bool | optional) if you want it to fade out on its own or just sit there
        sticky: false,
        // (int | optional) the time you want it to be alive for before fading out
        time: ''
    });
}