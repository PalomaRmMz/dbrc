var infoGobernador;


$("#fechanac").on('change', (e) => {
    fecha = $("#fechanac").val();
    fecha = fecha.split('-');
});

$('#Reg-gobernador').click(async function() {
    // Datos personales
    infoGobernador = {
        nombre: $("#reg-nombre").val(),
        apellidop: $("#reg-ap").val(),
        apellidom: $("#reg-am").val(),
        genero: $("#generoGob").val(),
        partidoP: $("#partidos-gubernatura").val(),
        fechaNacimiento: $("#fechanac").val(),
        lugarNacimiento: $("#lugar").val(),
        clv: $("#reg-claveElector").val(),
        curp: $("#reg-curp").val(),
        //nuevos campos
        num_emision: $("#reg-num_emision").val(),
        ocr: $("#reg-ocr").val(),
        cic: $("#reg-CIC").val(),
        seccion: $("#reg-seccion").val(),
        //fin de los nuevos campos
        tiempoRes: $("#reg-timeres").val(),
        sobrenombre: $("#reg-sobrenombre").val(),
        estado: 'Incompleto',
        capturista: $.buscarCookie("usuario"),
        emailGob: $("#correoGob").val(),
        //Documentacion

        //NUEVOS CAMPOS
        carta3D3: $("#doc-carta-3").prop("checked"),
        cartaEleccion: $('input[name=cartaEleccion]:checked').val(),
        constAutOrganoPartidista: $('input[name=constAutOrganoPartidista]:checked').val(),
        manifestacionIndigena: $('input[name=manifestacionIndigena]:checked').val(),
        consVinculoComuni: $('input[name=consVinculoComuni]:checked').val(),
        //FIN NUEVOS CAMPOS

        documentSNR: $("#doc-snr").prop("checked"),
        solicitudRC: $("#doc-regcan").prop("checked"),
        credencialINE: $("#doc-cred").prop("checked"),
        actaNacimentio: $("#doc-actnac").prop("checked"),
        copiaActa: $('input[name=copiaMPT]:checked').val(),
        contanciaResidencia: $("#doc-radicacion").prop("checked"),
        contanciaPostulacion: $("#doc-aceptacion").prop("checked"),
        constanciaSeparacion: $('input[name=separacionCargo]:checked').val(),
        proInahbilitado: $("#doc-inhabilitado").prop("checked"),
        antecedentesNP: $("#doc-antpen").prop("checked"),
        documentManifestacion: $("#doc-me").prop("checked"),
        informeCE: $("#doc-ce").prop("checked"),
        cedulaIF: $("#doc-cp").prop("checked"),
        politicaP: $("#cboPoliticaGP").prop("checked")
    }

    if ($("#partidos-gubernatura").val() == "") {
        return swal("Error", "Seleccione un partido político", "error");
    }

    validarCampos('registroGobernador').then(exito => {

        var expreg = new RegExp("[A-Z]{6}[0-9]{8}[A-Z]{1}[0-9]{3}");
        if (!expreg.test(infoGobernador.clv)) {
            return swal("Error", "La clave elector no tiene el formato correcto", "error");
        }

        var curp = $("#reg-curp").val().toUpperCase();
        if (curpValida(curp)) { // ⬅️ Acá se comprueba

            if(infoGobernador.cic !== ''){
                
            if (!validarCIC(infoGobernador.cic)) {
                return swal("Error", "El CIC no tiene el formato correcto", "error");
            }
        }

            if (!infoGobernador.politicaP) {
                return swal("Error", "No ha aceptado la Política de Privacidad", "error");
            }

            $.ajax({
                url: 'servicios/validaciones.php',
                type: "POST",
                data: { tipo: 'existsOtraCandi', clave_elector: infoGobernador.clv, curp: infoGobernador.curp },

                success: async function(respuesta) {
                    respuesta = JSON.parse(respuesta);
                    if (respuesta.status === 0) {
                        valor = await swal({
                                title: "¿Estas seguro de continuar?",
                                text: respuesta.mensaje,
                                icon: "warning",
                                buttons: true,
                                dangerMode: true,
                            })
                            .then((willDelete) => {
                                if (willDelete) {
                                    return 1;
                                } else {
                                    swal("", "Se ha cancelado el registro", "info");
                                    return 0;
                                }
                            });
                        if (valor == 0) return;
                    } else if (respuesta.status === -1) {
                        return swal("Error", respuesta.mensaje, "error");
                    }
                    EstadoRegistro = documentacionValidacion(
                        infoGobernador.carta3D3,
                        infoGobernador.cartaEleccion,
                        infoGobernador.constAutOrganoPartidista,
                        infoGobernador.manifestacionIndigena,
                        infoGobernador.consVinculoComuni,

                        infoGobernador.documentSNR,
                        infoGobernador.solicitudRC,
                        infoGobernador.credencialINE,
                        infoGobernador.actaNacimentio,
                        infoGobernador.copiaActa,
                        infoGobernador.contanciaResidencia,
                        infoGobernador.contanciaPostulacion,
                        infoGobernador.constanciaSeparacion,
                        infoGobernador.proInahbilitado,
                        infoGobernador.antecedentesNP,
                        infoGobernador.documentManifestacion,
                        infoGobernador.informeCE,
                        infoGobernador.cedulaIF);
                    // si la documentacion esta completa
                    if (EstadoRegistro) {
                        infoGobernador.estado = "Completo";
                        $('#modal-documentos').val("agregar-gubernatura");
                        $("#agregarModal").trigger('click');
                    } else {

                        var imprimir = "";
                        for (var i = 0; i < documentosFaltantes.length; i++) {
                            imprimir += "<br>" + documentosFaltantes[i];
                            $(".listasFaltantes").html(imprimir);
                        }
                        $("#modalFaltantesG").modal("show");
                        infoGobernador.estado = "Incompleto";
                        $('#modal-documentos').val("agregar-gubernatura");
                    }

                },
                error: function() { console.error("Hubo un error al comprobar si existe"); }
            });
        } else {
            return swal("Error", "El curp ingresado no tiene el formato correcto", "error");
        }
    }).catch(fail => {
        console.error(fail);
    });
});


$(document).ready(function() {
    $('#modalFaltantesG').on('hide.bs.modal', function(e) {
        $("#modal-documentos").val("");
    });

    $("#agregarModal").click(function() {

        if ($('#modal-documentos').val() === "agregar-gubernatura") {

            ({ estado, clv, capturista, constanciaSeparacion } = infoGobernador);

            $.ajax({
                url: 'servicios/gubernatura/agregarGubernatura.php',
                type: "POST",
                data: infoGobernador,
                success: function(respuesta) {

                    var respuesta = JSON.parse(respuesta);
                    //console.log(respuesta);

                    if (respuesta.status == 1) {
                        

                        if (estado !== "Completo") {

                            generarPDF(clv, 'plantillasGobernatura/RGobDocFal', TE_GUBERNATURA);

                            if (constanciaSeparacion == "NO") {

                                documento = "plantillasGobernatura/RSCARGOG";

                                generarPDF(clv, documento, TE_GUBERNATURA);

                            }

                        } else {

                            var documento = "plantillasGobernatura/cvRegGob";
                            generarCV(clv, capturista, documento, TE_GUBERNATURA);
                        }


                        swal("Gubernatura añadida", "Se ha registrado con éxito", "success");
                        $('#modalFaltantesG').modal('hide');
                        $("#parti2")[0].reset();

                        $("#registroGobernador")[0].reset();
                        $("#boxGob").hide();
                        $("#email").hide();
                        $("#docPropietarioGubernatura")[0].reset();


                    } else {

                        swal("Error", respuesta.mensaje, "error");

                    }
                },
                error: function() {
                    console.log("No se ha podido obtener la información");
                }
            });
        }
    });
});