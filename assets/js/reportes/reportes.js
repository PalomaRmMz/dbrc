$.getScript("./assets/js/reportes/pdf.js", function() {});
//OnClick al botón "Consultar"
var datatable;

async function sltTIpoElecionR() {
    data = { tipo: 'tipo_eleccion' };
    sltPost('servicios/selects.php', data).then((resolve) => {

        if (resolve.status_code == 502) {
            console.error(resolve)
            return;
        }
        sltGenerico(resolve, $("#tipo_eleccion_repo"), true);
    }, console.error);

}


$("#tipo_eleccion_repo").change(function(data) {

    tipoEleccion = Number($("select[id=tipo_eleccion_repo]").val());

    switch (tipoEleccion) {

        case TE_MAYORIA_RELATIVA:
        case TE_REPRESENTACION_PROPORCIONAL:

            data = { tipo: 'distritos', id_eleccion: tipoEleccion }

            $("#slt_report_municipio").addClass("d-none");
            $("#l_distrito_repo").html("Distrito <span class='tx-danger'>*</span>");

            sltPost('servicios/selects.php', data).then(data => {
                $("#l_distrito_repo").html("Distrito <span class='tx-danger'>*</span>");
                $("#distrito_repo").removeAttr("disabled");
                $("#partido_repo").attr("disabled", "disabled");
                $("#partido_repo").html("<option value='Todos'>Todos</option>");
                sltGenerico(data, $("#distrito_repo"), true);

            }, console.error);

            break;
        case TE_GUBERNATURA:
            id_distrito = $("#tipo_eleccion_repo").val();

            data = { tipo: 'partidos', id_distrito, id_tipo_candidatura: TE_GUBERNATURA };

            sltPost("servicios/selects.php", data).then((resolve) => {

                if (resolve.ok) {

                    $("#slt_report_municipio").addClass("d-none");

                    $("#distrito_repo").attr("disabled", true);
                    $("#distrito_repo").html("<option value='Todos'>Sin distrito</option>");

                    sltGenericoLabel(resolve[0], $("#partido_repo"), true);
                    $("#partido_repo").removeAttr("disabled");

                } else {
                    swal("Error", "No hay registros de los partidos políticos", "error");
                }

            }, console.error);
            break;
        case TE_MUNICIPAL:
        case TE_SINDICATURA:
        case TE_REGIDURIA:

            data = { tipo: 'municipios' };

            sltPost("servicios/selects.php", data).then((data) => {

                if (data.ok) {

                    $("#slt_report_municipio").addClass("d-none");

                    $("#l_distrito_repo").html("Municipio <span class='tx-danger'>*</span>");
                    $("#distrito_repo").attr("disabled", false);
                    sltGenerico(data[0], $("#distrito_repo"), true);
                    $("#partido_repo").attr("disabled", true);
                    $("#partido_repo").html("<option value='Todos'>Todos</option>");

                } else {
                    swal("Error", "No hay registros de los partidos políticos", "error");
                }

            }, console.error);
            break;
        case TE_COMUNIDAD:

            data = { tipo: 'municipiosParticipantes' };

            sltPost("servicios/selects.php", data).then((data) => {

                if (data.ok) {

                    $("#l_distrito_repo").html("Comunidad <span class='tx-danger'>*</span>");

                    $("#municipio_repo").attr("disabled", false);
                    $("#slt_report_municipio").removeClass("d-none");

                    sltGenerico(data[0], $("#municipio_repo"), true);

                    $("#partido_repo").attr("disabled", true);
                    $("#partido_repo").html("<option value='Todos'>Todos</option>");
                    $("#distrito_repo").attr("disabled", true);
                    $("#distrito_repo").html("<option value='Todos'>Todos</option>");

                } else {
                    swal("Error", "No hay registros de los partidos políticos", "error");
                }

            }, console.error);
            break;
        default:
            $("#slt_report_municipio").addClass("d-none");
            $("#l_distrito_repo").html("Distrito <span class='tx-danger'>*</span>");

            $("#distrito_repo").attr("disabled", true);
            $("#distrito_repo").html("<option value='Todos'>Todos</option>");

            $("#partido_repo").attr("disabled", true);
            $("#partido_repo").html("<option value='Todos'>Todos</option>");
            console.error('No hay datos');
            break;
    }
});

$("#municipio_repo").change(function(data) {

    id_municipio = $("select[id=municipio_repo]").val();
    id_tipo_candidatura = $("select[id=tipo_eleccion_repo]").val();

    data = { tipo: 'comunidades', id_municipio, id_tipo_candidatura };

    if (id_municipio !== 'Todos') {
        sltPost('servicios/selects.php', data).then((data) => {

            if (data.ok) {
                data = data[0];

                $("#distrito_repo").removeAttr("disabled");
                sltGenerico(data, $("#distrito_repo"), true);

            } else {

                $("#distrito_repo").attr("disabled", true);
                $("#distrito_repo").html("<option value='SD'>Sin datos</option>");

            }
        }, console.error);
    } else {
        $("#distrito_repo").attr("disabled", true);
        $("#distrito_repo").html("<option value='Todos'>Todos</option>");
    }
});

$("#distrito_repo").change(function(data) {

    id_distrito = $("select[id=distrito_repo]").val();
    id_tipo_candidatura = $("select[id=tipo_eleccion_repo]").val();

    data = { tipo: 'partidos', id_distrito, id_tipo_candidatura };

    if (id_distrito !== 'Todos') {
        sltPost('servicios/selects.php', data).then((data) => {

            if (data.ok) {
                data = data[0];

                $("#partido_repo").removeAttr("disabled");
                sltGenericoLabel(data, $("#partido_repo"), true);
            } else {
                $("#partido_repo").attr("disabled", true);
                $("#partido_repo").html("<option value='SD'>Sin datos</option>");
            }
        }, console.error);
    } else {
        $("#partido_repo").attr("disabled", true);
        $("#partido_repo").html("<option value='Todos'>Todos</option>");
    }
});

$("#search_reportes").click(function() {

    combinaciones = {
        tipo_eleccion: $("#tipo_eleccion_repo").val(),
        distrito: $("#distrito_repo").val(),
        partido: $("#partido_repo").val(),
        tipo_candidatura: $("#tipo_candidatura_repo").val(),
        estado: $("#estado_repo").val(),
        genero: $("#genero_repo").val(),
        municipio: $("#tipo_eleccion_repo").val() == 4 ? $("#distrito_repo").val() : $("#municipio_repo").val()
    }
    printInfoReportes(combinaciones);
});

//Mostrar información reporte


$("#print_report").on("click", function() {
    tipo_eleccion = $("#tipo_eleccion_repo").val();
    distrito = $("#distrito_repo").val();
    partido = $("#partido_repo").val();
    tipo_candidatura = $("#tipo_candidatura_repo").val();
    estado = $("#estado_repo").val();
    genero = $("#genero_repo").val();
    municipio = $("#municipio_repo").val();

    generarReportes(tipo_eleccion, distrito, partido, tipo_candidatura, estado, genero, municipio);
});

function generarReportes(tipo_eleccion, distrito, partido, tipo_candidatura, estado, genero, municipio) {

    var win = window.open(
        `../registro2021/servicios/reportes/printReportes.php?tipo_eleccion=${tipo_eleccion}&distrito=${distrito}&partido=${partido}&tipo_candidatura=${tipo_candidatura}&estado=${estado}&genero=${genero}&municipio=${municipio} `, '_blank');
    if (win) {
        win.focus();
    } else {
        alert('Porfavor habilíta las ventanas emergentes');
    }
}

$("#print_diary").on("click", function() {
    $("#modal-date").modal("show");
});


function generarDia(dia) {

    var win = window.open(pathReport + '/rep_diario.php?fecha=' + dia + '', '_blank');
    if (win) {
        win.focus();
    } else {
        alert('Porfavor habilíta las ventanas emergentes');
    }
}

$("#seleccionar-date").on("click", function() {
    var dia = $("#reporte-date").val();
    dia = convertDate(dia);

    generarDia(dia);
    $("#modal-date").modal("hide");
});