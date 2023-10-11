var registrosSustitucion;
var infoSustitucion = {};
var susEstado = 'Incompleto';

//OnClick del botón buscar sustitución
$(".btn-sust").click(function() {
    let clave_elector = $("#busqueda-sustituir").val();
    $.printInfoAboutCandidatura(clave_elector);
    return false;
})

//Mostrar información de candidato
$.printInfoAboutCandidatura = function(clave_elector) {

    var expreg = new RegExp("[A-Z]{6}[0-9]{8}[A-Z]{1}[0-9]{3}");
    if (clave_elector == "") {
        return swal("Error", "Ingrese una clave de elector", "error");
    }

    if (!expreg.test(clave_elector)) {
        return swal("Error", "La clave de elector no tiene el formato correcto", "error");
    }

    $.ajax({
        url: "servicios/sustitucion/obtenerInfoSustitucion.php",
        type: "POST",
        data: { "clave_elector": clave_elector }
    }).done(function(respuesta) {
        try {
            var respuesta = JSON.parse(respuesta)
            console.log(respuesta);
            if (respuesta[0].datos == 0) {
                swal("ERROR", "No se pudo conectar a la base de datos", "warning")
                $(".candidato-mayoria").hide();
                $(".candidato-plurinominal").hide();
                resetInputs()
            } else if (respuesta[0].datos == 1) {
                swal("ALERTA", "No se encontraron los datos de la candidatura", "warning")
                $(".candidato-mayoria").hide();
                $(".candidato-plurinominal").hide();
                resetInputsCandidatura()
            } else if (respuesta[0].datos == 2) {

                llenarSustitucion(respuesta[0]);

            } else if (respuesta[0].datos === 3) {

                registrosSustitucion = respuesta;
                $("#modal-subsanacion").val(clave_elector);

                contenido = "<option value=''>Selecciona una opción</option>";
                respuesta.map((item, index) => {
                    if (index == 0) return;
                    contenido += `<option value="${item.id_reg}">${item.candidatura}</option>`;
                });

                $("#eleccionSustitucion").html(contenido);
                $("#modalSustitucion").modal('show');

            }
        } catch (e) {
            console.error(respuesta);
            console.error(e);
        }
    }).fail(function() {
        swal("ALERTA", "No se pudo obtener los datos de la candidatura", "warning")
    })
}

$("#btn-slt-sus").click(function() {
    var id_reg = $("#eleccionSustitucion").val();
    registro = registrosSustitucion.filter(item => item.id_reg == id_reg);

    $("#modalSustitucion").modal("hide");
    llenarSustitucion(registro[0]);
});


function llenarSustitucion(respuesta) {

    datos = respuesta;
    infoSustitucion.id_partido = respuesta.id_partido;
    infoSustitucion.id_distrito = respuesta.id_distrito;
    infoSustitucion.id_municipio = respuesta.id_municipio;
    infoSustitucion.id_comunidad = respuesta.id_comunidad;

    infoSustitucion.genero = respuesta.genero;
    infoSustitucion.propietario_suplente = respuesta.propietario_suplente;
    infoSustitucion.estado = respuesta.estado;


    $("#new-genero").prop("disabled", "disabled");
    $(`#new-genero option[value='${respuesta.genero}']`).prop("selected", true);
    $("#id-reg-sus").val(respuesta.id_reg);
    // datos generales
    $(".sus-nombre").text(respuesta.nombre);
    $(".sus-ap").text(respuesta.apellido_paterno);
    $(".sus-am").text(respuesta.apellido_materno);
    $(".sus-candidatura").text(respuesta.propietario_suplente);
    $(".sus-curp").text(respuesta.curp);

    // nuevos campos
    $(".sus-candidato_num_emision-rp").text(respuesta.num_emision);
    $(".sus-candidato_ocr-rp").text(respuesta.ocr);
    $(".sus-candidato_cic-rp").text(respuesta.cic);
    $(".sus-candidato_seccion-rp").text(respuesta.seccion);
    // fin nuevos campos

    $("#sus-comunidad").text(respuesta.candidatura);
    $("#sus-prelacion").text(respuesta.prelacion);
    $(".sus-pp").text(respuesta.partido_politico);
    $(".sus-genero").text(respuesta.genero);
    // datos formulario
    $(".new-type").text(respuesta.candidatura);

    $("#id-new-type").val(respuesta.code_candidatura);

    $(".new-pp").html(respuesta.partido_politico);
    $(".new-distrito").html(respuesta.distrito);


    $(".new-candidatura").html(respuesta.candidatura);
    $(".new-partidoPolitico").html(respuesta.partido_politico);

    if (respuesta.code_candidatura == TE_MAYORIA_RELATIVA) {

        $("#new-distrito").html(respuesta.distrito);
        $("#sus-distrito").text(respuesta.distrito);
        $(".sus-comunidad,.sus-prelacion").show();
        $("#new-prelacion,#new-distrito").parent("div").show();

        $("#sus-prelacion").text(respuesta.distrito);
        $("#sus-prelacion").siblings("label").text("distrito");

    } else if (respuesta.code_candidatura == TE_REPRESENTACION_PROPORCIONAL) {

        $(".prelacion-campo").show();
        $("#new-prelacion").text(respuesta.prelacion);
        $(".sus-comunidad , .sus-prelacion").show();
        $("#sus-comunidad").text(respuesta.candidatura);
        $("#new-prelacion, #new-distrito").parent("div").show();

    } else if (respuesta.code_candidatura == TE_GUBERNATURA) {

        $("#new-distrito").html("NO");
        $("#new-prelacion").html("NO");
        $("#new-prelacion,#new-distrito").parent("div").hide();
        $(".sus-prelacion,.sus-comunidad").hide();

        $(".sus-candidatura").html(respuesta.candidatura);

    } else if (respuesta.code_candidatura == TE_COMUNIDAD) {

        $("#new-distrito").html("NO");
        $("#new-prelacion").html("NO");
        $("#new-prelacion,#new-distrito").parent("div").hide();


        $("#sus-prelacion").text(respuesta.distrito);
        $("#sus-prelacion").siblings("label").text("Municipio");
        $(".sus-comunidad").show();
        $(".sus-candidatura").html(respuesta.propietario_suplente);

    } else if (respuesta.code_candidatura == TE_MUNICIPAL || respuesta.code_candidatura == TE_SINDICATURA || respuesta.code_candidatura == TE_REGIDURIA) {

        $("#new-distrito").html("NO");
        $("#new-prelacion").html("NO");
        $("#new-prelacion,#new-distrito").parent("div").hide();

        $("#sus-prelacion").text(respuesta.distrito);
        $("#sus-prelacion").siblings("label").text("Municipio");
        $(".sus-comunidad").show();
        $(".sus-candidatura").html(respuesta.propietario_suplente);
    }
    $("#id-tipo-sustitucion").val(respuesta.code_candidatura);
    $(".candidato-plurinominal").css('display', 'flex');
    $(".infoc-sustitucion").show();
}



$("#sustitucion-finalizar").on("click", function() {

    //Aqui se llenan los datos de la sustitucion
    nombreSustitucion = $("#new-nombre").val();
    appSustitucion = $("#new-ap").val();
    apmSustitucion = $("#new-am").val();
    generoSustitucion = $("#new-genero").val();
    tipoCandidatura = $("#id-new-type").val();
    partidoCandidatura = $("#new-pp").html();
    distritoCandidatura = $("#new-distrito").html();
    curpSustitucion = $("#new-curp").val();
    timeSustitucion = $("#new-time").val();
    aliasSustitucion = $("#new-alias").val();
    fecnacnew = $("#new-fecnac").val();
    newprelacion = "00";
    prosup = $("#sus-candidatura").html();
    newemail = $("#IemailNew").val();
    ncic = $("#new-candidato_cic").val();


    //NUEVOS CAMPOS DE ULTIMA HORA
    newCarta3D3 = $("#doc-carta-3-new").prop("checked");
    newCartaEleccion = $('input[name=cartaEleccionnew]:checked').val();
    newConstAutOrganoPartidista = $('input[name=constAutOrganoPartidistanew]:checked').val();
    newManifestacionIndigena = $('input[name=manifestacionIndigenanew]:checked').val();
    newConsVinculoComuni = $('input[name=consVinculoComuninew]:checked').val();
    //FIN CAMPOS DE ULTIMA HORA


    newSNR = $("#doc-snr-new").prop("checked");
    newReg = $("#doc-regcan-new").prop("checked");
    newAct = $("#doc-actnac-new").prop("checked");
    newCopia = $('input[name=copiaMPTnew]:checked').val();
    newCred = $("#doc-cred-new").prop("checked");
    newAceptacion = $("#doc-aceptacion-new").prop("checked");
    newSeparacion = $('input[name=separacionCargonew]:checked').val();
    newRad = $("#doc-radicacion-new").prop("checked");
    newNP = $("#doc-antpen-new").prop("checked");
    newInahbilitado = $("#doc-inhabilitado-new").prop("checked");
    newME = $("#doc-me-new").prop("checked");
    newCE = $("#doc-ce-new").prop("checked");
    newCP = $("#doc-cp-new").prop("checked");

    var usuarioActual = $.buscarCookie("usuario");
    var motivoSustitucion = $("#motivoSustitucion").val();
    var claveOriginal = $("#busqueda-sustituir").val();
    var claveNuevo = $("#new-claveelector").val();

    if (nombreSustitucion == "" || appSustitucion == "" || apmSustitucion == "" || generoSustitucion == "" ||
        tipoCandidatura == "" || partidoCandidatura == "" || distritoCandidatura == "" || claveOriginal == "" ||
        curpSustitucion == "" || timeSustitucion == "" || fecnacnew == "") {
        swal("Alto", "Hay campos obligatorios que dejaste vacios", "error");

    } else {
        estadoDoc = documentacionValidacion(
            newCarta3D3,
            newCartaEleccion,
            newConstAutOrganoPartidista,
            newManifestacionIndigena,
            newConsVinculoComuni,
            newSNR,
            newReg,
            newCred,
            newAct,
            newCopia,
            newRad,
            newAceptacion,
            newSeparacion,
            newInahbilitado,
            newNP,
            newME,
            newCE, newCP);

        if (motivoSustitucion == "") {
            swal("Alto", "Antes de continuar selecciona el motivo de la sustitución", "warning");
        } else {

            if(ncic !== ''){

            if (!validarCIC($("#new-candidato_cic").val())) {
                return swal("Error", "El CIC no tiene el formato correcto", "error");
            }
        }
            swal({
                title: "¿Esta seguro de proceder?",
                text: "Una vez que la candidatura sea remplazada el registro anterior sera inválido",
                icon: "warning",
                buttons: true,
                dangerMode: true,
            }).then((willDelete) => {
                if (willDelete) {

                    if (estadoDoc) {

                        susEstado = "Completo";
                        $("#finalizarSustitucion").trigger('click');

                    } else {
                        susEstado = "Incompleto";
                        var imprimir = "";
                        for (var i = 0; i < documentosFaltantes.length; i++) {
                            imprimir += "<br>" + documentosFaltantes[i];
                            $(".listasFaltantes").html(imprimir);
                        }
                        $('#modalFaltantesSus').modal('show');
                    }
                } else {
                    swal("No se ha hecho ningún cambio");
                }
            });
        }
    }
});

$("#finalizarSustitucion").on("click", function() {
    $('#modalFaltantesSus').modal('hide');

    infoSustitucion.nombreSustitucion = $("#new-nombre").val();
    infoSustitucion.appSustitucion = $("#new-ap").val();
    infoSustitucion.apmSustitucion = $("#new-am").val();
    infoSustitucion.tipoCandidatura = $("#id-new-type").val();
    infoSustitucion.partidoCandidatura = $("#new-pp").html();
    infoSustitucion.clvSustitucion = $("#new-claveelector").val();
    infoSustitucion.curpSustitucion = $("#new-curp").val();
    infoSustitucion.candidato_num_emision = $("#new-candidato_num_emision").val();
    infoSustitucion.candidato_ocr = $("#new-candidato_ocr").val();
    infoSustitucion.candidato_cic = $("#new-candidato_cic").val();
    infoSustitucion.candidato_seccion = $("#new-candidato_seccion").val();
    infoSustitucion.distritoCandidatura = $("#new-distrito").html();
    infoSustitucion.fecnacnew = $("#new-fecnac").val();
    infoSustitucion.lugarNacimiento = $("#sustitucion-sitenac").val();
    infoSustitucion.timeSustitucion = $("#new-time").val();
    infoSustitucion.aliasSustitucion = $("#new-alias").val();
    infoSustitucion.prosup = $(".sus-candidatura").html();
    infoSustitucion.estado = susEstado;
    infoSustitucion.usuarioActual = $.buscarCookie("usuario");
    infoSustitucion.newprelacion = "00";
    infoSustitucion.idRegistroSus = $("#id-reg-sus").val();
    infoSustitucion.nombreOriginal = $(".sus-nombre").html();
    infoSustitucion.appOriginal = $(".sus-ap").html();
    infoSustitucion.apmOriginal = $(".sus-am").html();
    infoSustitucion.email = $("#IemailNew").val();

    //cambios de ultima hora
    infoSustitucion.newCarta3D3 = $("#doc-carta-3-new").prop("checked");
    infoSustitucion.newCartaEleccion = 'NO APLICA';
    infoSustitucion.newConstAutOrganoPartidista = 'NO APLICA';
    infoSustitucion.newManifestacionIndigena = 'NO APLICA';
    infoSustitucion.newConsVinculoComuni = 'NO APLICA';
    //fin de cambios de ultima hora


    infoSustitucion.newSNR = $("#doc-snr-new").prop("checked");
    infoSustitucion.newReg = $("#doc-regcan-new").prop("checked");
    infoSustitucion.newAct = $("#doc-actnac-new").prop("checked");
    infoSustitucion.newCopia = 'NO APLICA';
    infoSustitucion.newCred = $("#doc-cred-new").prop("checked");
    infoSustitucion.newAceptacion = $("#doc-aceptacion-new").prop("checked");
    infoSustitucion.newSeparacion = $('input[name=separacionCargonew]:checked').val();
    infoSustitucion.newRad = $("#doc-radicacion-new").prop("checked");
    infoSustitucion.newNP = $("#doc-antpen-new").prop("checked");
    infoSustitucion.newInahbilitado = $("#doc-inhabilitado-new").prop("checked");
    infoSustitucion.newME = $("#doc-me-new").prop("checked");
    infoSustitucion.newCE = $("#doc-ce-new").prop("checked");
    infoSustitucion.newCP = $("#doc-cp-new").prop("checked");
    infoSustitucion.claveOriginal = $("#busqueda-sustituir").val();
    infoSustitucion.motivoSustitucion = $("#motivoSustitucion").val();
    infoSustitucion.claveNuevo = $("#new-claveelector").val()

    //Aqui se llenan los datos de la sustitucion
    if (tipoCandidatura == TE_MAYORIA_RELATIVA) {

        $.sustitucionCandidato(infoSustitucion);

    } else if (tipoCandidatura == TE_REPRESENTACION_PROPORCIONAL) {

        infoSustitucion.newprelacion = $("#new-prelacion").html();
        infoSustitucion.prosup = $(".sus-candidatura").html();
        $.sustitucionCandidato(infoSustitucion);

    } else if (tipoCandidatura == TE_GUBERNATURA) {
        // LISTO
        $.sustitucionGubernatura(infoSustitucion);

    } else if (tipoCandidatura == TE_MUNICIPAL || tipoCandidatura == TE_SINDICATURA || tipoCandidatura == TE_REGIDURIA) {

        $.sustitucionMunicipal(infoSustitucion);

    } else if (tipoCandidatura == TE_COMUNIDAD) {

        $.sustitucionComunidad(infoSustitucion);
    }


});


$.sustitucionComunidad = function(infoSustitucion) {

    configuracion = {
        docFaltantesCIndp: 'plantillasComunidad/RComuDocFal',
        docRenuncia: 'plantillasComunidad/RSCARGOPPC',
        docFaltantesPP: 'plantillasComunidad/coppC',
        allDocument: 'plantillasComunidad/cvC',
    };
    postSustitucion('servicios/sustitucion/sustituirComunidad.php', infoSustitucion, configuracion);
}

$.sustitucionMunicipal = function(infoSustitucion) {
    let url = "";
    configuracion = {
        docFaltantesCIndp: 'plantillasMunicipal/RMuniDocFal',
        docRenuncia: 'plantillasMunicipal/RSCARGOPPM',
        docFaltantesPP: 'plantillasMunicipal/coppM',
        allDocument: 'plantillasMunicipal/cvM',
    };

    if (infoSustitucion.tipoCandidatura == TE_MUNICIPAL) {

        url = 'servicios/sustitucion/sustituirMunicipal.php';

    } else if (infoSustitucion.tipoCandidatura == TE_SINDICATURA) {

        url = 'servicios/sustitucion/sustituirSindico.php';

    } else if (infoSustitucion.tipoCandidatura == TE_REGIDURIA) {

        url = 'servicios/sustitucion/sustituirRegidor.php';
    }
    postSustitucion(url, infoSustitucion, configuracion);
}

$.sustitucionGubernatura = function(infoSustitucion) {


    configuracion = {
       // docFaltantesCIndp: 'plantillasGobernatura/RGobDocFal',
        //docRenuncia: 'plantillasGobernatura/RSCARGOG',
       // docFaltantesPP: 'plantillasGobernatura/RGobDocFal',
        allDocument: 'plantillasGobernatura/cvRegGob',
    };
    postSustitucion("servicios/sustitucion/sustituirGubernatura.php", infoSustitucion, configuracion);
}

$.sustitucionCandidato = function(infoSustitucion) {

    ({ estado, clvSustitucion, usuarioActual, tipoCandidatura } = infoSustitucion);

    $.ajax({

        url: "servicios/sustitucion/sustituirCandidato.php",
        type: "POST",
        data: infoSustitucion

    }).done(function(respuesta) {


        try {
            var respuesta = JSON.parse(respuesta);
            var tipo_can = $("#id-new-type").val();

            if (respuesta.datos == 0) {
                swal("ERROR", "No se pudo conectar a la base de datos", "warning");
            } else if (respuesta.datos == 1) {
                swal("Alto", "Ya existe una candidatura con la misma clave de elector", "warning");
            } else if (respuesta.datos == 2) {
                swal("Alto", "Ya existe una candidatura con la misma curp", "warning");
            } else if (respuesta.datos == 3) {

                var documento = "";
                if (estado == "Completo") {
                    documento = "plantillasDiputaciones/cv";
                    generarCV(clvSustitucion, usuarioActual, documento, tipoCandidatura);
                }

                var documento = "";
                if (estado == "Completo") {
                    if (tipo_can == "MAYORÍA RELATIVA") { //se agregaron las siguientes lineas para que diferenciara
                        documento = "plantillasDiputaciones/cv";
                        usuarioActual = $.buscarCookie("usuario");
                        generarCV(clvSustitucion, usuarioActual, documento, tipoCandidatura);


                    } else {
                        documento = "plantillasDiputaciones/cvpluri"; //entre los tipos de carta de verificacion
                        usuarioActual = $.buscarCookie("usuario"); //aqui
                        generarCV(clvSustitucion, usuarioActual, documento, tipoCandidatura); //aqui tambienb

                    }
                } else if (estado == "Incompleto") {

                    if (partidoCandidatura == "Candidatura Independiente") {
                        if (newSeparacion == "NO") {
                            documento = "plantillasDiputaciones/coind";
                            generarPDF(clvSustitucion, documento, tipoCandidatura);
                            documento = "plantillasDiputaciones/RSCARGO";
                            generarPDF(clvSustitucion, documento, tipoCandidatura);
                        } else {
                            documento = "plantillasDiputaciones/coind";
                            generarPDF(clvSustitucion, documento, tipoCandidatura);
                        }
                    } else {
                        if (newSeparacion == "NO") {
                            if (tipo_can == "REPRESENTACION PROPORCIONAL") {
                               // documento = "plantillasDiputaciones/copp";
                               // generarPDF(clvSustitucion, documento, tipoCandidatura);
                               // documento = "plantillasDiputaciones/RSCARGOPLURI";
                               // generarPDF(clvSustitucion, documento, tipoCandidatura);
                            } else {
                               // documento = "plantillasDiputaciones/copp";
                                //generarPDF(clvSustitucion, documento, tipoCandidatura);
                               // documento = "plantillasDiputaciones/RSCARGOPP";
                               // generarPDF(clvSustitucion, documento, tipoCandidatura);
                            }

                        } else {
                            //documento = "plantillasDiputaciones/copp";
                            //generarPDF(clvSustitucion, documento, tipoCandidatura);
                        }
                    }
                    var imprimir = "";

                    for (var i = 0; i < documentosFaltantes.length; i++) {
                        imprimir += "<br>" + documentosFaltantes[i];
                        $(".doc-faltantes").html(imprimir);
                    }
                } else {
                    console.error("Ocurrio un error");
                }
                infoSustitucion = {};
                limpiarSustitucion();
                swal("Listo", "Se ha realizado existosamente la sustitución", "success");
            }
        } catch (e) {
            console.error(e);
            console.error(respuesta);
        }


    }).fail(function() {
        console.error("Algo salio terriblemente mal");
    })
}



function postSustitucion(url, infoSustitucion, configuracion) {

    ({ estado, clvSustitucion, usuarioActual, tipoCandidatura, newSeparacion } = infoSustitucion);

    ({ docFaltantesCIndp, docRenuncia, docFaltantesPP, allDocument } = configuracion);

    var tipo_can = $("#id-new-type").val();

    $.ajax({

        url: url,
        type: "POST",
        data: infoSustitucion

    }).done(function(respuesta) {

        try {

            var respuesta = JSON.parse(respuesta);

            if (respuesta.datos == 0) {
                swal("ERROR", "No se pudo conectar a la base de datos", "warning");
            } else if (respuesta.datos == 1) {
                swal("Alto", "Ya existe una candidatura con la misma clave de elector", "warning");
            } else if (respuesta.datos == 2) {
                swal("Alto", "Ya existe una candidatura con la misma curp", "warning");
            } else if (respuesta.datos == 3) {

                if (estado !== "Completo") {

                    if (partidoCandidatura == "Candidatura Independiente") {

                        if (newSeparacion == "NO") {

                            generarPDF(clvSustitucion, docFaltantesCIndp, tipoCandidatura);
                            generarPDF(clvSustitucion, docRenuncia, tipoCandidatura);

                        } else {

                            generarPDF(clvSustitucion, docFaltantesCIndp, tipoCandidatura);

                        }
                    } else {

                        if (newSeparacion == "NO") {
                            generarPDF(clvSustitucion, docFaltantesPP, tipoCandidatura);
                            generarPDF(clvSustitucion, docRenuncia, tipoCandidatura);
                        } else {
                            generarPDF(clvSustitucion, docFaltantesPP, tipoCandidatura);
                        }
                    }
                } else {

                    generarCV(clvSustitucion, usuarioActual, allDocument, tipoCandidatura);
                }


                limpiarSustitucion();
                $("#docPropietario")[0].reset();
                swal("Listo", "Se ha realizado existosamente la sustitución", "success");
            }


        } catch (e) {
            console.error(respuesta);
            console.error(e);
        }



    })
}