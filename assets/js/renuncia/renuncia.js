var registrosRenuncia = {};
/* Comienza renuncia.js */
//OnClick del botón buscar sustitución
$(".btn-canc").click(function() {
    let clave_elector = $("#busqueda-renuncia").val();
    $.printInfoAboutRenuncia(clave_elector);
    return false;
});

//Mostrar información de candidato
$.printInfoAboutRenuncia = function(clave_elector) {
    var expreg = new RegExp("[A-Z]{6}[0-9]{8}[A-Z]{1}[0-9]{3}");
    if (clave_elector == "") {
        return swal("Error", "Ingrese una clave de elector", "error");
    }

    if (!expreg.test(clave_elector)) {
        return swal("Error", "La clave elector no tiene el formato correcto", "error");
    }

    $.ajax({
        url: "servicios/renuncia/obtenerInfoRenuncia.php",
        type: "POST",
        data: { "clave_elector": clave_elector }
    }).done(function(respuesta) {
        try {
            var respuesta = JSON.parse(respuesta)
            if (respuesta[0].datos == 0) {
                console.error("No se pudo conectar a la base de datos")
                swal("ERROR", "No se pudo conectar a la base de datos", "warning")
            } else if (respuesta[0].datos == 1) {
                swal("ALERTA", "No se encontraron los datos de la candidatura", "warning")
                console.error("No se encontro al candidato en la base de datos")

            } else if (respuesta[0].datos == 2) {

                llenarRenuncia(respuesta);

            } else if (respuesta[0].datos == 3) {

                registrosRenuncia = respuesta;

                //$("#modal-subsanacion").val(respuesta.clave_elector);

                contenido = "<option value=''>Selecciona una opción</option>";
                respuesta.map((item, index) => {
                    if (index == 0) return;
                    contenido += `<option value="${item.id}">${item.candidatura}</option>`;
                });
                $("#search-tipo-sub").html(contenido);

                $("#renunciaSlt").removeClass("d-none");
                $("#dosclavesSubsanacion").modal('show');
            }
        } catch (e) {
            console.error(e);
            console.error(respuesta);
        }
    }).fail(function() {
        swal("ALERTA", "No se pudo obtener los datos de la candidatura", "warning")
    })
}

$("#renunciaSlt").click(function() {
    $("#renunciaSlt").addClass("d-none");

    $("#dosclavesSubsanacion").modal('hide');
    var clave_elector = $("#busqueda-renuncia").val();
    var id = $("#search-tipo-sub").val();
    registrosRenuncia = registrosRenuncia.filter(item => item.id == id);
    llenarRenuncia(registrosRenuncia);
});

function llenarRenuncia(respuesta) {

    registrosRenuncia = respuesta[0];

    $("#sus-nombre-r").text(respuesta[0].nombre);
    $("#sus-ap-r").text(respuesta[0].apellido_paterno);
    $("#sus-am-r").text(respuesta[0].apellido_materno);
    $("#sus-candidatura-r").text(respuesta[0].propietario_suplente);
    $("#sus-curp-r").text(respuesta[0].curp);
    $("#sus-comunidad-r").text(respuesta[0].candidatura);
    $("#sus-distrito-r").text(respuesta[0].distrito);
    $("#sus-pp-r").text(respuesta[0].partido_politico);
    $("#sus-genero-r").text(respuesta[0].genero);
    $("#codigo-renuncia").val(respuesta[0].code_candidatura);


    $("#id-reg-renuncia").val(respuesta[0].id);

    $("#sus-num_emision-r").text(respuesta[0].num_emision);
    $("#sus-ocr-r").text(respuesta[0].cic);
    $("#sus-cic-r").text(respuesta[0].ocr);
    $("#sus-seccion-r").text(respuesta[0].seccion);




    $(".infoc-cancelacion").show();

    if (respuesta[0].code_candidatura == TE_MAYORIA_RELATIVA) {

        $(".sus-distrito-r,.sus-candidatura-r").show();

    } else if (respuesta[0].code_candidatura == TE_REPRESENTACION_PROPORCIONAL) {

        $(".sus-distrito-r,.sus-candidatura-r").show();

    } else if (respuesta[0].code_candidatura == TE_GUBERNATURA || respuesta[0].code_candidatura == TE_COMUNIDAD) {

        $(".sus-distrito-r,.sus-candidatura-r").hide();

    } else if (respuesta[0].code_candidatura == TE_MUNICIPAL) {
        $(".sus-distrito-r,.sus-candidatura-r").hide();
    }

}

$("#renunciar-candidatura").on("click", function() {


    var today = new Date();
    var dd = today.getDate();
    var mm = today.getMonth() + 1; //January is 0!
    var yyyy = today.getFullYear();
    if (dd < 10) {
        dd = '0' + dd
    }
    if (mm < 10) {
        mm = '0' + mm
    }

    today = dd + '/' + mm + '/' + yyyy;

    registrosRenuncia.fecha = today;
    registrosRenuncia.idTipoCandidatura = $("#codigo-renuncia").val();
    registrosRenuncia.idRegCandidatura = $("#id-reg-renuncia").val();
    registrosRenuncia.usuarioActual = $.buscarCookie("usuario");
    registrosRenuncia.motivoRenuncia = $("#motivoRenuncia").val();
    registrosRenuncia.claveOriginal = $("#busqueda-renuncia").val();
    registrosRenuncia.tipoAccion = "Renuncia";
    registrosRenuncia.claveNuevo = "NO HAY";



    if (motivoRenuncia == "") {
        swal("Error", "Selecciona un motivo de renuncia antes", "error");
    } else {
        swal({
            title: "Alto",
            text: "¿Estas seguro de proseguir con la renuncia?",
            icon: "warning",
            buttons: true,
            dangerMode: true,
        }).then((willDelete) => {
            if (willDelete) {
                $.renunciaCandidato();
            } else {
                swal("Se ha cancelado la renuncia");
            }
        });
    }
});


$.renunciaCandidato = function() {

    $.ajax({

        url: "servicios/renuncia/renunciaCandidato.php",
        type: "POST",
        data: registrosRenuncia
    }).done(function(respuesta) {

        try {
            var respuesta = JSON.parse(respuesta);

            if (respuesta.datos == 0) {
                swal("Error", "No se ha podido cambiar nada", "error");
            } else if (respuesta.datos == 1) {
                swal("Listo", "Se ha guardado el cambio satisfactoriamente", "success");
                limpiarRenuncia();
            } else {
                console.error("Algo salio mal");
            }
        } catch (e) {
            console.error(respuesta);
            console.error(e);
        }

    }).fail(function() {
        console.error("No se pudo realizar el cambio solicitado");
    });
}

function limpiarRenuncia() {
    $("#motivoRenuncia").val("");
    $("#busqueda-renuncia").val("");
    $(".infoc-cancelacion").hide();
}