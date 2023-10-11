function documentacionValidacion(
    carta3D3,
     cartaEleccion,
     constAutOrganoPartidista,
     manifestacionIndigena,
     consVinculoComuni,
    snr,
    reg,
    cred,
    act,
     copia,
    rad,
    aceptacion,
    separacion,
    noinah,
    np,
    me,
    ce,
    cp) {

    documentosFaltantes = [];
    // cambios de ultima hora
    if (carta3D3 == false) {
        documentosFaltantes.push("CARTA 3 DE 3");
    }
     if (cartaEleccion == "NO") {
        documentosFaltantes.push("CARTA REELECCIÓN");
    }
    if (constAutOrganoPartidista == "NO") {
        documentosFaltantes.push("CONSTANCIA DE AUTORIZACIÓN DEL ÓRGANO PARTIDISTA EN CASO DE RELECCIÓN");
    }
    if (manifestacionIndigena == "NO") {
        documentosFaltantes.push("MANIFESTACIÓN DE AUTOADSCRIPCIÓN INDÍGENA");
    }
    if (consVinculoComuni == "NO") {
        documentosFaltantes.push("CONSTANCIAS QUE ACREDITEN EL VÍNCULO COMUNITARIO");
    }
    //Fin cambios de ultima hora
    if (snr == false) {
        documentosFaltantes.push("Documento emitido por el SNR del INE");
    }
    if (reg == false) {
        documentosFaltantes.push("Solicitud de Registro de Candidatura");
    }
    if (cred == false) {
        documentosFaltantes.push("Credencial para votar vigente");
    }
    if (act == false) {
        documentosFaltantes.push("Copia certificada del Acta de Nacimiento (extracto)");
    }
    if (copia == "NO") {
        documentosFaltantes.push("Copia certificada del Acta de Nacimiento del padre o madre Tlaxcalteca");
    }
    if (rad == false) {
        documentosFaltantes.push("Constancia de radicación");
    }
    if (aceptacion == false) {
        documentosFaltantes.push("Constancia de aceptación de la postulación");
    }
    if (separacion == "NO") {
        documentosFaltantes.push("Constancia de separación del cargo de la función pública");
    }
    if (noinah == false) {
        documentosFaltantes.push("Escrito bajo protesta de decir verdad, que no se encuentra inhabilitado para ocupar un cargo público y que no se cuenta con antecedentes penales");
    }
    if (np == false) {
        documentosFaltantes.push("Carta de antecendentes no penales");
    }
    if (me == false) {
        documentosFaltantes.push("Manifiesto de partido político");
    }
    if (ce == false) {
        documentosFaltantes.push("Informe de capacidad económica");
    }
    if (cp == false) {
        documentosFaltantes.push("Cédula de identificación fiscal");
    } else {}
    if (documentosFaltantes.length > 0) {
        return false;
    } else {
        return true;
    }
}



var proEstado = "";
var usuarioActual;
var documentosFaltantes = [];

$(document).ready(function() {
    var infoDiputaciones;
    usuarioActual = $.buscarCookie("usuario");

    /* variables globales */
    var tipoCandidatura = "";
    var distritoCandidatura = "";
    var partidoCandidatura = "";


    /* Información propietario  */
    var nombrePropietario = "";
    var appPropietario = "";
    var apmPropietario = "";
    var fecnPropietario = "";
    var genPropietario = "";
    var sitePropietario = "";
    var clvPropietario = "";
    var clvPropietario = "";
    var curpPropietario = "";
    var timePropietario = "";
    var aliasPropietario = "";

    /* Documentación propietario */
    var proSNR = "";
    var proReg = "";
    var proAct = "";
    var proCopia = "";
    var preCred = "";
    var proAceptacion = "";
    var proRad = "";
    var proNP = "";
    var proInahbilitado = "";
    var proME = "";
    var proCE = "";
    var proCP = "";
    var proSeparacion = "";
    var estado = "Completo";
    var proEstado = "";

    /* Información suplente  */
    var nombreSuplente = "";
    var appSuplente = "";
    var apmSuplente = "";
    var fecnSuplente = "";
    var genSuplente = "";
    var siteSuplente = "";
    var clvSuplente = "";
    var clvSuplente = "";
    var curpSuplente = "";
    var timeSuplente = "";
    var aliasSuplente = "";
    /* Documentación suplente */
    var supSNR = "";
    var supReg = "";
    var supAct = "";
    var supCopia = "";
    var supCred = "";
    var supAceptacion = "";
    var supRad = "";
    var supNP = "";
    var supInahbilitado = "";
    var supME = "";
    var supCE = "";
    var supCP = "";
    var supSeparacion = "";

    /* Informacion sustitucion */
    var partidoCandidatura = "";
    var tipoCandidatura = "";

    var distritoCandidatura = "";


    /* Añadir Propietario cuando es representacion proporcional */
    $.addPropietarioPrelacion = function(infoDiputaciones) {
            $.ajax({
                url: "servicios/addPrelacion.php",
                type: "POST",
                data: {
                    "nombre": infoDiputaciones.nombrePropietario,
                    "apellidoPaterno": infoDiputaciones.appPropietario,
                    "apellidoMaterno": infoDiputaciones.apmPropietario,
                    "fechaNacimiento": infoDiputaciones.fecnPropietario,
                    "genero": infoDiputaciones.genPropietario,
                    "partidoPolitico": infoDiputaciones.partidoCandidatura,
                    "candidatura": infoDiputaciones.tipoCandidatura,
                    "claveElector": infoDiputaciones.clvPropietario,
                    "curp": infoDiputaciones.curpPropietario,
                    "reg_pro_num_emision": infoDiputaciones.reg_pro_num_emision,
                    "reg_pro_ocr": infoDiputaciones.reg_pro_ocr,
                    "reg_pro_CIC": infoDiputaciones.reg_pro_CIC,
                    "reg_pro_seccion": infoDiputaciones.reg_pro_seccion,
                    "distrito": infoDiputaciones.distritoCandidatura,
                    "fecha": infoDiputaciones.fecnPropietario,
                    "sitePropietario": infoDiputaciones.sitePropietario,
                    "tiempoResidencia": infoDiputaciones.timePropietario,
                    "sobrenombre": infoDiputaciones.aliasPropietario,
                    "estado": infoDiputaciones.proEstado,
                    "prelacion": infoDiputaciones.prelacion,
                    "capturista": infoDiputaciones.usuarioActual,
                    "prosup": infoDiputaciones.prosup,



                    "supCarta3D3": infoDiputaciones.propCarta3D3,
                    "supCartaEleccion": infoDiputaciones.propCartaEleccion,
                    "supConstAutOrganoPartidista": infoDiputaciones.propConstAutOrganoPartidista,
                    "supManifestacionIndigena": infoDiputaciones.propManifestacionIndigena,
                    "supConsVinculoComuni": infoDiputaciones.propConsVinculoComuni,


                    "docsnr": infoDiputaciones.proSNR,
                    "regcandidatura": infoDiputaciones.proReg,
                    "acta": infoDiputaciones.proAct,
                    "copiaacta": infoDiputaciones.proCopia,
                    "credencial": infoDiputaciones.preCred,
                    "aceptacion": infoDiputaciones.proAceptacion,
                    "supSeparacion": infoDiputaciones.proSeparacion,
                    "radicacion": infoDiputaciones.proRad,
                    "nopenales": infoDiputaciones.proNP,
                    "noinahbilitado": infoDiputaciones.proInahbilitado,
                    "manifiesto": infoDiputaciones.proME,
                    "capacidad": infoDiputaciones.proCE,
                    "cedularfc": infoDiputaciones.proCP,
                    "politicaP": infoDiputaciones.politicaP,
                    "email": infoDiputaciones.email
                }
            }).done(function(respuesta) {
                console.log(respuesta);
                respuesta = JSON.parse(respuesta);
                if (!respuesta.status) {
                    swal("Error", respuesta.mensaje, "error");
                } else {

                    if (infoDiputaciones.proEstado == "Completo") {
                        var documento = "plantillasDiputaciones/cvpluri";
                        usuarioActual = $.buscarCookie("usuario");
                        generarCV(clvPropietario, usuarioActual, documento, TE_REPRESENTACION_PROPORCIONAL);

                    } else if (infoDiputaciones.proEstado == "Incompleto") {

                        if (partidoCandidatura == "Candidatura Independiente") {
                            documento = "plantillasDiputaciones/coind";

                            if (infoDiputaciones.proSeparacion == "NO") {

                                generarPDF(clvPropietario, documento, TE_REPRESENTACION_PROPORCIONAL);
                                generarPDF(clvPropietario, "plantillasDiputaciones/RSCARGOPLURI", TE_REPRESENTACION_PROPORCIONAL);

                            } else {

                                generarPDF(clvPropietario, documento, TE_REPRESENTACION_PROPORCIONAL);

                            }

                        } else {

                            if (infoDiputaciones.proSeparacion == "NO") {
                                documento = "plantillasDiputaciones/copluri";
                                generarPDF(clvPropietario, documento, TE_REPRESENTACION_PROPORCIONAL);
                                documento = "plantillasDiputaciones/RSCARGOPLURI";
                                generarPDF(clvPropietario, documento, TE_REPRESENTACION_PROPORCIONAL);
                            } else {
                                documento = "plantillasDiputaciones/copluri";
                                generarPDF(clvPropietario, documento, TE_REPRESENTACION_PROPORCIONAL);
                            }
                        }
                    } else {
                        console.error("Ocurrio un error");
                    }

                    swal({
                        title: "Se ha registrado con éxito",
                        text: 'Candidatura a diputación ha sido añadida',
                        icon: "success",
                        button: "Ok",
                    }).then((value) => {

                        data = {
                            'tipoEleccion': infoDiputaciones.tipoCandidatura,
                            'distrito': infoDiputaciones.distritoCandidatura,
                            'partido': infoDiputaciones.partidoCandidatura,
                            'prelacion': infoDiputaciones.prelacion,
                            'tipoCand': 1
                        };

                        var selected = $(':selected', $("#reg-partidos-politicos"));
                        candIndependiente = selected.parent().attr('value');
                        if (candIndependiente != 4) {

                            sltPost('servicios/diputaciones/validarSexo.php', data).then((respuesta) => {
                                if (respuesta.status_code == 201) {
                                    $("#rdContainer").addClass("d-none");
                                    return swal("Información", 'Ya se han registrado el propietario y suplente', 'info');
                                }
                                esconderForm('rdContainer', respuesta);
                            }).catch(console.error);
                        }

                    });


                    limpiarPropietario();
                    /* $("#registroPropietario")[0].reset();
                    $("#docPropietario")[0].reset();
                    $("#reg-tipoEleccion").val("0");
                    $("#reg-distritos").prop("disabled", true)
                    $("#reg-partidos-politicos").prop("disabled", true) */
                }
            }).fail(function() {
                console.error("Algo salio mal");
            });
        }
        /* Añade una candidatura  */

    /****
     * 
     * 
     * 
     * 
     * addCandidatura
     * 
     * 
     * 
     * 
     * 
     * **/


    $.addCandidatura = function(
        nombreSuplente,
        appSuplente,
        apmSuplente,
        genSuplente,
        partidoCandidatura,
        tipoCandidatura,
        clvSuplente,
        curpSuplente,
        reg_pro_num_emision,
        reg_pro_ocr,
        reg_pro_CIC,
        reg_pro_seccion,
        distritoCandidatura,
        fecnSuplente, siteSuplente, timeSuplente, aliasSuplente,
        estado,
        prelacion,
        usuarioActual,
        prosup,

        supCarta3D3,
        supCartaEleccion,
        supConstAutOrganoPartidista,
        supManifestacionIndigena,
        supConsVinculoComuni,

        supSNR,
        supReg,
        supAct,
        supCopia,
        supCred,
        supAceptacion,
        supSeparacion,
        supRad,
        supNP,
        supInahbilitado,
        supME,
        supCE,
        supCP,
        politicaP,
        email) {


        $.ajax({
            url: "servicios/addCandidatura.php",
            type: "POST",
            data: {
                "nombre": nombreSuplente,
                "apellidoPaterno": appSuplente,
                "apellidoMaterno": apmSuplente,
                "fechaNacimiento": fecnSuplente,
                "genero": genSuplente,
                "partidoPolitico": partidoCandidatura,
                "candidatura": tipoCandidatura,
                "claveElector": clvSuplente,
                "curp": curpSuplente,
                "reg_pro_num_emision": reg_pro_num_emision,
                "reg_pro_ocr": reg_pro_ocr,
                "reg_pro_CIC": reg_pro_CIC,
                "reg_pro_seccion": reg_pro_seccion,
                "distrito": distritoCandidatura,
                "fecha": fecnSuplente,
                "sitePropietario": siteSuplente,
                "tiempoResidencia": timeSuplente,
                "sobrenombre": aliasSuplente,
                "estado": estado,
                "prelacion": prelacion,
                "capturista": usuarioActual,
                "prosup": prosup,


                "propCarta3D3": supCarta3D3,
                "propCartaEleccion": supCartaEleccion,
                "propConstAutOrganoPartidista": supConstAutOrganoPartidista,
                "propManifestacionIndigena": supManifestacionIndigena,
                "propConsVinculoComuni": supConsVinculoComuni,


                "docsnr": supSNR,
                "regcandidatura": supReg,
                "acta": supAct,
                "copiaacta": supCopia,
                "credencial": supCred,
                "aceptacion": supAceptacion,
                "supSeparacion": supSeparacion,
                "radicacion": supRad,
                "nopenales": supNP,
                "noinahbilitado": supInahbilitado,
                "manifiesto": supME,
                "capacidad": supCE,
                "cedularfc": supCP,
                "politicaP": politicaP,
                "email": email
            }
        }).done(function(respuesta) {
            var respuesta = JSON.parse(respuesta);

            if (!respuesta.status) {
                swal("Error", respuesta.mensaje, "error");
            } else {
                var documento = "";
                if (infoDiputaciones.proEstado == "Completo") {

                    documento = "plantillasDiputaciones/cv";
                    usuarioActual = $.buscarCookie("usuario");

                    generarCV(clvSuplente, usuarioActual, documento, TE_MAYORIA_RELATIVA);

                    $('#reg-distritos').attr('disabled', true);
                    $('#reg-partidos-politicos').attr('disabled', true);

                } else if (infoDiputaciones.proEstado == "Incompleto") {

                    if (partidoCandidatura == "Candidatura Independiente") {

                        if (infoDiputaciones.supSeparacion == "NO") {
                            documento = "plantillasDiputaciones/coind";
                            generarPDF(clvSuplente, documento, TE_MAYORIA_RELATIVA);
                            documento = "plantillasDiputaciones/RSCARGO";
                            generarPDF(clvSuplente, documento, TE_MAYORIA_RELATIVA);
                        } else {
                            documento = "plantillasDiputaciones/coind";
                            generarPDF(clvSuplente, documento, TE_MAYORIA_RELATIVA);
                        }
                    } else {
                        if (infoDiputaciones.supSeparacion == "NO") {
                            documento = "plantillasDiputaciones/copp";
                            generarPDF(clvSuplente, documento, TE_MAYORIA_RELATIVA);
                            documento = "plantillasDiputaciones/RSCARGOPP";
                            generarPDF(clvSuplente, documento, TE_MAYORIA_RELATIVA);
                        } else {
                            documento = "plantillasDiputaciones/copp";
                            generarPDF(clvSuplente, documento, TE_MAYORIA_RELATIVA);
                        }
                    }

                } else {
                    console.error("Ocurrio un error");
                }

                $("#registroSuplente")[0].reset();
                $("#docSuplente")[0].reset();

                swal({
                    title: "Se ha registrado con éxito",
                    text: 'Candidatura a suplente ha sido añadida',
                    icon: "success",
                    button: "Ok",
                }).then((value) => {
                    data = { 'tipoEleccion': tipoCandidatura, 'distrito': distritoCandidatura, 'partido': partidoCandidatura, prelacion, 'tipoCand': 1 };


                    var selected = $(':selected', $("#reg-partidos-politicos"));
                    candIndependiente = selected.parent().attr('value');
                    if (candIndependiente != 4) {
                        sltPost('servicios/diputaciones/validarSexo.php', data).then((respuesta) => {
                            if (respuesta.status_code == 201) {
                                $("#rdContainer").addClass("d-none");
                                return swal("Información", 'Ya se han registrado el propietario y suplente', 'info');
                            }
                            esconderForm('rdContainer', respuesta);
                        }).catch(console.error);
                    }


                });
            }
        }).fail(function() {
            console.error("Algo salio mal");
        });
    }

    /* Añade una candidatura  */
    $.addCandidaturaIndependiente = function(infoDiputaciones) {
        ({ clvSuplente, } = infoDiputaciones)
        $.ajax({
            url: "servicios/addIndependiente.php",
            type: "POST",
            data: {
                "nombre": infoDiputaciones.nombreSuplente,
                "apellidoPaterno": infoDiputaciones.appSuplente,
                "apellidoMaterno": infoDiputaciones.apmSuplente,
                "fechaNacimiento": infoDiputaciones.fecnSuplente,
                "genero": infoDiputaciones.genSuplente,
                "partidoPolitico": infoDiputaciones.partidoCandidatura,
                "candidatura": infoDiputaciones.tipoCandidatura,
                "claveElector": infoDiputaciones.clvSuplente,
                "curp": infoDiputaciones.curpSuplente,
                "reg_pro_num_emision": infoDiputaciones.reg_pro_num_emision,
                "reg_pro_ocr": infoDiputaciones.reg_pro_ocr,
                "reg_pro_CIC": infoDiputaciones.reg_pro_CIC,
                "reg_pro_seccion": infoDiputaciones.reg_pro_seccion,
                "distrito": infoDiputaciones.distritoCandidatura,
                "fecha": infoDiputaciones.fecnSuplente,
                "sitePropietario": infoDiputaciones.siteSuplente,
                "tiempoResidencia": infoDiputaciones.timeSuplente,
                "sobrenombre": infoDiputaciones.aliasSuplente,
                "estado": infoDiputaciones.proEstado,
                "prelacion": infoDiputaciones.prelacion,
                "capturista": infoDiputaciones.usuarioActual,
                "prosup": infoDiputaciones.prosup,
                "docsnr": infoDiputaciones.supSNR,
                "regcandidatura": infoDiputaciones.supReg,
                "acta": infoDiputaciones.supAct,
                "copiaacta": infoDiputaciones.supCopia,
                "credencial": infoDiputaciones.supCred,
                "aceptacion": infoDiputaciones.supAceptacion,
                "supSeparacion": infoDiputaciones.supSeparacion,
                "radicacion": infoDiputaciones.supRad,
                "nopenales": infoDiputaciones.supNP,
                "noinahbilitado": infoDiputaciones.supInahbilitado,
                "manifiesto": infoDiputaciones.supME,
                "capacidad": infoDiputaciones.supCE,
                "cedularfc": infoDiputaciones.supCP,
                "politicaP": infoDiputaciones.politicaP,
                "email": infoDiputaciones.email
            }
        }).done(function(respuesta) {
            var respuesta = JSON.parse(respuesta);
            if (!respuesta.status) {
                swal("Error", respuesta.mensaje, "error");
            } else {

                var documento = "";
                if (infoDiputaciones.proEstado == "Completo") {
                    documento = "plantillasDiputaciones/cv";
                    usuarioActual = $.buscarCookie("usuario");
                    generarCV(clvSuplente, usuarioActual, documento, TE_MAYORIA_RELATIVA);


                } else if (infoDiputaciones.proEstado == "Incompleto") {
                    if (partidoCandidatura == "Candidatura Independiente") {
                        if (infoDiputaciones.supSeparacion == "NO") {
                            documento = "plantillasDiputaciones/coind";
                            generarPDF(clvSuplente, documento, TE_MAYORIA_RELATIVA);
                            documento = "plantillasDiputaciones/RSCARGO";
                            generarPDF(clvSuplente, documento, TE_MAYORIA_RELATIVA);
                        } else {
                            documento = "plantillasDiputaciones/coind";
                            generarPDF(clvSuplente, documento, TE_MAYORIA_RELATIVA);
                        }
                    } else {
                        if (infoDiputaciones.supSeparacion == "NO") {
                            documento = "plantillasDiputaciones/copp";
                            generarPDF(clvSuplente, documento, TE_MAYORIA_RELATIVA);
                            documento = "plantillasDiputaciones/RSCARGOPP";
                            generarPDF(clvSuplente, documento, TE_MAYORIA_RELATIVA);
                        } else {
                            documento = "plantillasDiputaciones/copp";
                            generarPDF(clvSuplente, documento, TE_MAYORIA_RELATIVA);
                        }
                    }
                } else {
                    console.error("Ocurrio un error");
                }


                $("#registroSuplente")[0].reset();
                $("#docSuplente")[0].reset();

                swal({
                    title: "Se ha registrado con éxito",
                    text: 'Candidatura a diputación ha sido añadida',
                    icon: "success",
                    button: "Ok",
                }).then((value) => {

                    data = { 'tipoEleccion': tipoCandidatura, 'distrito': distritoCandidatura, 'partido': partidoCandidatura, prelacion, 'tipoCand': 1 };


                    var selected = $(':selected', $("#reg-partidos-politicos"));
                    candIndependiente = selected.parent().attr('value');
                    if (candIndependiente != 4) {

                        sltPost('servicios/diputaciones/validarSexo.php', data).then((respuesta) => {
                            if (respuesta.status_code == 201) {
                                $("#rdContainer").addClass("d-none");
                                return swal("Información", 'Ya se han registrado el propietario y suplente', 'info');

                            }

                            esconderForm('rdContainer', respuesta);
                        }).catch(console.error);
                    }

                });

                /* $('#reg-distritos').attr('disabled', true);
                $("#reg-distritos").html("<option value='Todos'>Seleccione una una opción</option>");

                $('#reg-partidos-politicos').attr('disabled', true);
                $("#reg-partidos-politicos").html("<option value='Todos'>Seleccione una una opción</option>");

                 */

            }
        }).fail(function() {
            console.error("Algo salio mal");
        });
    }

    /* Añade una candidatura  */
    $.addCandidaturaPrelacion = function(nombreSuplente, appSuplente, apmSuplente,
        genSuplente, partidoCandidatura, tipoCandidatura,
        clvSuplente, curpSuplente,
        reg_pro_num_emision,
        reg_pro_ocr,
        reg_pro_CIC,
        reg_pro_seccion,
        distritoCandidatura,
        fecnSuplente, sitePropietario, timeSuplente, aliasSuplente,
        estado, prelacion, usuarioActual,
        prosup,


        supCarta3D3,
        supCartaEleccion,
        supConstAutOrganoPartidista,
        supManifestacionIndigena,
        supConsVinculoComuni,

        supSNR,
        supReg,
        supAct,
        supCopia,
        supCred,
        supAceptacion,
        supSeparacion,
        supRad,
        supNP,
        supInahbilitado,
        supME,
        supCE,
        supCP,
        politicaP,
        email) {

        $.ajax({
            url: "servicios/addPrelacion.php",
            type: "POST",
            data: {
                "nombre": nombreSuplente,
                "apellidoPaterno": appSuplente,
                "apellidoMaterno": apmSuplente,
                "fechaNacimiento": fecnSuplente,
                "genero": genSuplente,
                "partidoPolitico": partidoCandidatura,
                "candidatura": tipoCandidatura,
                "claveElector": clvSuplente,
                "curp": curpSuplente,
                "reg_pro_num_emision": reg_pro_num_emision,
                "reg_pro_ocr": reg_pro_ocr,
                "reg_pro_CIC": reg_pro_CIC,
                "reg_pro_seccion": reg_pro_seccion,
                "distrito": distritoCandidatura,
                "fecha": fecnSuplente,
                "sitePropietario": sitePropietario,
                "tiempoResidencia": timeSuplente,
                "sobrenombre": aliasSuplente,
                "estado": estado,
                "prelacion": prelacion,
                "capturista": usuarioActual,
                "prosup": prosup,


                //NUEVOS CAMPOS
                "supCarta3D3": supCarta3D3,
                "supCartaEleccion": supCartaEleccion,
                "supConstAutOrganoPartidista": supConstAutOrganoPartidista,
                "supManifestacionIndigena": supManifestacionIndigena,
                "supConsVinculoComuni": supConsVinculoComuni,
                // FIN NUEVOS CAMPOS

                "docsnr": supSNR,
                "regcandidatura": supReg,
                "acta": supAct,
                "copiaacta": supCopia,
                "credencial": supCred,
                "aceptacion": supAceptacion,
                "supSeparacion": supSeparacion,
                "radicacion": supRad,
                "nopenales": supNP,
                "noinahbilitado": supInahbilitado,
                "manifiesto": supME,
                "capacidad": supCE,
                "cedularfc": supCP,
                "politicaP": politicaP,
                "email": email
            }
        }).done(function(respuesta) {

            var respuesta = JSON.parse(respuesta);

            if (!respuesta.status) {
                swal("Error", respuesta.mensaje, "error");
            } else {

                var documento = "";
                if (infoDiputaciones.proEstado == "Completo") {
                    documento = "plantillasDiputaciones/cvpluri";
                    usuarioActual = $.buscarCookie("usuario");
                    generarCV(clvSuplente, usuarioActual, documento, TE_REPRESENTACION_PROPORCIONAL);

                } else if (infoDiputaciones.proEstado == "Incompleto") {
                    if (partidoCandidatura == "Candidatura Independiente") {
                        if (infoDiputaciones.supSeparacion == "NO") {

                            documento = "plantillasDiputaciones/coind";
                            generarPDF(clvSuplente, documento, TE_REPRESENTACION_PROPORCIONAL);
                            documento = "plantillasDiputaciones/RSCARGOPLURI";
                            generarPDF(clvSuplente, documento, TE_REPRESENTACION_PROPORCIONAL);

                        } else {

                            documento = "plantillasDiputaciones/coind";
                            generarPDF(clvSuplente, documento, TE_REPRESENTACION_PROPORCIONAL);

                        }
                    } else {

                        if (infoDiputaciones.supSeparacion == "NO") {

                            documento = "plantillasDiputaciones/copluri";
                            generarPDF(clvSuplente, documento, TE_REPRESENTACION_PROPORCIONAL);
                            documento = "plantillasDiputaciones/RSCARGOPLURI";
                            generarPDF(clvSuplente, documento, TE_REPRESENTACION_PROPORCIONAL);

                        } else {

                            documento = "plantillasDiputaciones/copluri";
                            generarPDF(clvSuplente, documento, TE_REPRESENTACION_PROPORCIONAL);

                        }
                    }
                } else {
                    console.error("Ocurrio un error");
                }
                $("#registroSuplente")[0].reset();
                $("#docSuplente")[0].reset();
                swal({
                    title: "Se ha registrado con éxito",
                    text: 'Candidatura a diputación ha sido añadida',
                    icon: "success",
                    button: "Ok",
                }).then((value) => {

                    data = { 'tipoEleccion': tipoCandidatura, 'distrito': distritoCandidatura, 'partido': partidoCandidatura, prelacion, 'tipoCand': 1 };

                    var selected = $(':selected', $("#reg-partidos-politicos"));
                    candIndependiente = selected.parent().attr('value');

                    if (candIndependiente != 4) {
                        sltPost('servicios/diputaciones/validarSexo.php', data).then((respuesta) => {
                            if (respuesta.status_code == 201) {
                                $("#rdContainer").addClass("d-none");
                                return swal("Información", 'Ya se han registrado el propietario y suplente', 'info');
                            }
                            esconderForm('rdContainer', respuesta);
                        }).catch(console.error);
                    }
                });
            }
        }).fail(function() {
            console.error("Algo salio mal");
        });
    }


    /***

     * 
     * agregar candidatos que sea diferentes de independientes
     * 
     * 
     * **/
    $.addPropietario = function(infoDiputaciones) {

        ({ partidoCandidatura, proSeparacion } = infoDiputaciones);
        $.ajax({
            url: "servicios/addCandidatura.php",
            type: "POST",
            data: {
                "nombre": infoDiputaciones.nombrePropietario,
                "apellidoPaterno": infoDiputaciones.appPropietario,
                "apellidoMaterno": infoDiputaciones.apmPropietario,
                "fechaNacimiento": infoDiputaciones.fecnPropietario,
                "genero": infoDiputaciones.genPropietario,
                "partidoPolitico": infoDiputaciones.partidoCandidatura,
                "candidatura": infoDiputaciones.tipoCandidatura,
                "claveElector": infoDiputaciones.clvPropietario,
                "curp": infoDiputaciones.curpPropietario,
                "reg_pro_num_emision": infoDiputaciones.reg_pro_num_emision,
                "reg_pro_ocr": infoDiputaciones.reg_pro_ocr,
                "reg_pro_CIC": infoDiputaciones.reg_pro_CIC,
                "reg_pro_seccion": infoDiputaciones.reg_pro_seccion,
                "distrito": infoDiputaciones.distritoCandidatura,
                "fecha": infoDiputaciones.fecnPropietario,
                "sitePropietario": infoDiputaciones.sitePropietario,
                "tiempoResidencia": infoDiputaciones.timePropietario,
                "sobrenombre": infoDiputaciones.aliasPropietario,
                "estado": infoDiputaciones.proEstado,
                "prelacion": infoDiputaciones.prelacion,
                "capturista": infoDiputaciones.usuarioActual,
                "prosup": infoDiputaciones.prosup,


                "propCarta3D3": infoDiputaciones.propCarta3D3,
                "propCartaEleccion": infoDiputaciones.propCartaEleccion,
                "propConstAutOrganoPartidista": infoDiputaciones.propConstAutOrganoPartidista,
                "propManifestacionIndigena": infoDiputaciones.propManifestacionIndigena,
                "propConsVinculoComuni": infoDiputaciones.propConsVinculoComuni,

                "docsnr": infoDiputaciones.proSNR,
                "regcandidatura": infoDiputaciones.proReg,
                "acta": infoDiputaciones.proAct,
                "copiaacta": infoDiputaciones.proCopia,
                "credencial": infoDiputaciones.preCred,
                "aceptacion": infoDiputaciones.proAceptacion,
                "supSeparacion": infoDiputaciones.proSeparacion,
                "radicacion": infoDiputaciones.proRad,
                "nopenales": infoDiputaciones.proNP,
                "noinahbilitado": infoDiputaciones.proInahbilitado,
                "manifiesto": infoDiputaciones.proME,
                "capacidad": infoDiputaciones.proCE,
                "cedularfc": infoDiputaciones.proCP,
                "politicaP": infoDiputaciones.politicaP,
                "email": infoDiputaciones.email
            }
        }).done(function(respuesta) {

            try {
                console.log(respuesta);
                var respuesta = JSON.parse(respuesta);
                console.log(respuesta);
                if (!respuesta.status) {
                    swal("Error", respuesta.mensaje, "error");
                } else {

                    if (infoDiputaciones.proEstado == "Completo") {
                        var documento = "plantillasDiputaciones/cv";
                        usuarioActual = $.buscarCookie("usuario");
                        generarCV(clvPropietario, usuarioActual, documento, TE_MAYORIA_RELATIVA);

                    } else if (infoDiputaciones.proEstado == "Incompleto") {

                        if (partidoCandidatura == "Candidatura Independiente") {
                            documento = "coind";
                            if (proSeparacion == "NO") {
                                console.error("Entro aqui aunque si debe de entrar");
                                generarPDF(clvPropietario, documento, TE_MAYORIA_RELATIVA);
                                generarPDF(clvPropietario, "RSCARGO");
                            } else {
                                generarPDF(clvPropietario, documento, TE_MAYORIA_RELATIVA);
                            }
                        } else {

                            if (proSeparacion == "NO") {
                                documento = "plantillasDiputaciones/copp";
                                generarPDF(clvPropietario, documento, TE_MAYORIA_RELATIVA);
                                documento = "plantillasDiputaciones/RSCARGOPP";
                                generarPDF(clvPropietario, documento, TE_MAYORIA_RELATIVA);
                            } else {
                                documento = "plantillasDiputaciones/copp";
                                generarPDF(clvPropietario, documento, TE_MAYORIA_RELATIVA);
                            }

                        }

                    } else {
                        console.error("Ocurrio un error");
                    }

                    $("#registroPropietario")[0].reset();
                    $("#docPropietario")[0].reset();

                    swal({
                        title: "Se ha registrado con éxito",
                        text: 'Candidatura a diputación ha sido añadida',
                        icon: "success",
                        button: "Ok",
                    }).then((value) => {

                        data = { 'tipoEleccion': tipoCandidatura, 'distrito': distritoCandidatura, 'partido': partidoCandidatura, prelacion, 'tipoCand': 1 };


                        var selected = $(':selected', $("#reg-partidos-politicos"));
                        candIndependiente = selected.parent().attr('value');
                        if (candIndependiente != 4) {

                            sltPost('servicios/diputaciones/validarSexo.php', data).then((respuesta) => {
                                if (respuesta.status_code == 201) {
                                    $("#rdContainer").addClass("d-none");
                                    return swal("Información", 'Ya se han registrado el propietario y suplente', 'info');
                                }
                                esconderForm('rdContainer', respuesta);
                            }).catch(console.error);
                        }




                    });
                    // Acaba el if si es exitoso
                }
            } catch (e) {
                console.error(e);
                console.error(respuesta);
            }
        }).fail(function() {
            console.error("Algo salio mal");
        });
    }



    //AddIndependiente
    $.addPropietarioIndependiente = function(nombrePropietario, appPropietario, apmPropietario,
        genPropietario, partidoCandidatura, tipoCandidatura,
        clvPropietario, curpPropietario,
        reg_pro_num_emision,
        reg_pro_ocr,
        reg_pro_CIC,
        reg_pro_seccion,
        distritoCandidatura,
        fecnPropietario, sitePropietario, timePropietario, aliasPropietario,
        estado, prelacion, usuarioActual,
        prosupproSNR,
        proReg,
        proAct,
        proCopia,
        preCred,
        proAceptacion,
        proSeparacion,
        proRad,
        proNP,
        proInahbilitado,
        proME,
        proCE,
        proCP, politicaP) {
        $.ajax({
            url: "servicios/addIndependiente.php",
            type: "POST",
            data: {
                "nombre": nombrePropietario,
                "apellidoPaterno": appPropietario,
                "apellidoMaterno": apmPropietario,
                "fechaNacimiento": fecnPropietario,
                "genero": genPropietario,
                "partidoPolitico": partidoCandidatura,
                "candidatura": tipoCandidatura,
                "claveElector": clvPropietario,
                "curp": curpPropietario,
                "reg_pro_num_emision": reg_pro_num_emision,
                "reg_pro_ocr": reg_pro_ocr,
                "reg_pro_CIC": reg_pro_CIC,
                "reg_pro_seccion": reg_pro_seccion,
                "distrito": distritoCandidatura,
                "fecha": fecnPropietario,
                "sitePropietario": sitePropietario,
                "tiempoResidencia": timePropietario,
                "sobrenombre": aliasPropietario,
                "estado": estado,
                "prelacion": prelacion,
                "capturista": usuarioActual,
                "prosup": prosup,
                "docsnr": proSNR,
                "regcandidatura": proReg,
                "acta": proAct,
                "copiaacta": proCopia,
                "credencial": preCred,
                "aceptacion": proAceptacion,
                "supSeparacion": proSeparacion,
                "radicacion": proRad,
                "nopenales": proNP,
                "noinahbilitado": proInahbilitado,
                "manifiesto": proME,
                "capacidad": proCE,
                "cedularfc": proCP,
                "politicaP": politicaP,
                "email": email
            }
        }).done(function(respuesta) {

            var respuesta = JSON.parse(respuesta);
            if (respuesta.datos == 0) {
                swal("Error", "Ya existe un registro con esta clave de usuario", "error");
            } else if (respuesta.datos == 1) {
                swal("Error", "Ya existe un registro con este curp", "error");
            } else if (respuesta.datos == 3) {
                if (proEstado == "Completo") {
                    var documento = "plantillasDiputaciones/cv";
                    usuarioActual = $.buscarCookie("usuario");
                    generarCV(clvPropietario, usuarioActual, documento, TE_MAYORIA_RELATIVA);

                } else if (proEstado == "Incompleto") {
                    if (partidoCandidatura == "Candidatura Independiente") {

                        documento = "plantillasDiputaciones/coind";

                        if (proSeparacion == "NO") {

                            generarPDF(clvPropietario, documento, TE_MAYORIA_RELATIVA);
                            generarPDF(clvPropietario, "plantillasDiputaciones/RSCARGO", TE_MAYORIA_RELATIVA);
                        } else {
                            generarPDF(clvPropietario, documento);
                        }
                    } else {

                        if (proSeparacion == "NO") {

                            //documento = "plantillasDiputaciones/copp";
                           // generarPDF(clvPropietario, documento, TE_MAYORIA_RELATIVA);
                            //documento = "plantillasDiputaciones/RSCARGOPP";
                            //generarPDF(clvPropietario, documento, TE_MAYORIA_RELATIVA);
                        } else {

                            //documento = "plantillasDiputaciones/copp";
                           // generarPDF(clvPropietario, documento, TE_MAYORIA_RELATIVA);
                        }

                    }


                }
                $("#registroPropietario")[0].reset();
                $("#docPropietario")[0].reset();
                swal("Candidatura añadida", "El registro se almaceno correctamente", "success");
                limpiarPropietario();
                // Acaba el if si es exitoso
            } else {
                console.error("Algo salio mal");
            }
        }).fail(function() {
            console.error("Algo salio mal");
        });
    }




    /********
     * 
     * 
     * 
     * 
     * AGREGA CANDIDATURA
     * 
     * 
     * 
     * 
     * **/

    $("#addCandidatura").on("click", function() {

        infoDiputaciones = {
            tipoCandidatura: $("#reg-tipoEleccion").val(),
            distritoCandidatura: $("#reg-distritos").val(),
            partidoCandidatura: $("#reg-partidos-politicos").val(),
            nombreSuplente: $("#reg-sup-nombre").val(),
            appSuplente: $("#reg-sup-ap").val(),
            apmSuplente: $("#reg-sup-am").val(),
            fecnSuplente: $("#reg-sup-fecn").val(),
            genSuplente: $("#reg-sup-gen").val(),
            siteSuplente: $("#reg-sup-sitenac").val(),
            clvSuplente: $("#reg-sup-claveElector").val(),
            curpSuplente: $("#reg-sup-curp").val(),
            reg_pro_num_emision: $("#reg-sup-num_emision").val(),
            reg_pro_ocr: $("#reg-sup-ocr").val(),
            reg_pro_CIC: $("#reg-sup-CIC").val(),
            reg_pro_seccion: $("#reg-sup-seccion").val(),
            timeSuplente: $("#reg-sup-timeres").val(),
            aliasSuplente: $("#reg-sup-sobrenombre").val(),


            // cambios de ultima hora
            supCarta3D3: $("#doc-carta-3-ds").prop("checked"),
            supCartaEleccion: $('input[name=cartaEleccion-ds]:checked').val(),
            supConstAutOrganoPartidista: $('input[name=constAutOrganoPartidista-ds]:checked').val(),
            supManifestacionIndigena: $('input[name=manifestacionIndigena-ds]:checked').val(),
            supConsVinculoComuni: $('input[name=consVinculoComuni-ds]:checked').val(),
            //fin cambios de ultima hora

            supSNR: $("#doc-snr-sup").prop("checked"),
            supReg: $("#doc-regcan-sup").prop("checked"),
            supAct: $("#doc-actnac-sup").prop("checked"),
            supCopia: $('input[name=copiaMPTsup]:checked').val(),
            supCred: $("#doc-cred-sup").prop("checked"),
            supAceptacion: $("#doc-aceptacion-sup").prop("checked"),
            supSeparacion: $('input[name=separacionCargoSup]:checked').val(),
            supRad: $("#doc-radicacion-sup").prop("checked"),
            supNP: $("#doc-antpen-sup").prop("checked"),
            supInahbilitado: $("#doc-inhabilitado-sup").prop("checked"),
            supME: $("#doc-me-sup").prop("checked"),
            supCE: $("#doc-ce-sup").prop("checked"),
            supCP: $("#doc-cp-sup").prop("checked"),
            proEstado: "",
            usuarioActual: "",
            prelacion: "",
            prosup: "",
            politicaP: $("#cboPoliticaDS").prop("checked"),
            email: $("#IemailDipMAS").val()
        }



        if ($("#reg-tipoEleccion").val() == "") {
            return swal("Error", "Seleccione un tipo de elección", "error");
        }

        if ($("#reg-distritos").val() == "") {
            return swal("Error", "Seleccione un distrito", "error");
        }

        if ($("#reg-partidos-politicos").val() == "") {
            return swal("Error", "Seleccione un partido politico", "error");
        }

        if (infoDiputaciones.tipoCandidatura == 2) {
            if ($("#reg-prelacion").val() == "") {
                return swal("Error", "Seleccione una orden de prelación", "error");
            }
        }


        validarCampos('registroSuplente').then(exito => {
            if(infoDiputaciones.reg_pro_CIC !== ''){
            if (!validarCIC(infoDiputaciones.reg_pro_CIC)) {
                return swal("Error", "El CIC no tiene el formato correcto", "error");
            }
        }


            var expreg = new RegExp("[A-Z]{6}[0-9]{8}[A-Z]{1}[0-9]{3}");
            if (!expreg.test(infoDiputaciones.clvSuplente)) {
                return swal("Error", "La clave elector no tiene el formato correcto", "error");
            }

            var curp = $("#reg-sup-curp").val().toUpperCase();
            if (curpValida(curp)) { // ⬅️ Acá se comprueba

                if (!infoDiputaciones.politicaP) {
                    return swal("Error", "No ha aceptado la Política de Privacidad", "error");
                }
                estadoRegistro = documentacionValidacion(

                    infoDiputaciones.supCarta3D3,
                    infoDiputaciones.supCartaEleccion,
                    infoDiputaciones.supConstAutOrganoPartidista,
                    infoDiputaciones.supManifestacionIndigena,
                    infoDiputaciones.supConsVinculoComuni,

                    infoDiputaciones.supSNR,
                    infoDiputaciones.supReg,
                    infoDiputaciones.supCred,
                    infoDiputaciones.supAct,
                    infoDiputaciones.supCopia,
                    infoDiputaciones.supRad,
                    infoDiputaciones.supAceptacion,
                    infoDiputaciones.supSeparacion,
                    infoDiputaciones.supInahbilitado,
                    infoDiputaciones.supNP,
                    infoDiputaciones.supME,
                    infoDiputaciones.supCE,
                    infoDiputaciones.supCP);

                if (estadoRegistro) {
                    infoDiputaciones.proEstado = "Completo";
                    $("#sureFinish").trigger('click');
                  //  $("#form-prueba")[0].reset();

                } else if (!estadoRegistro) {
                    infoDiputaciones.proEstado = "Incompleto";
                    var imprimir = "";
                    for (var i = 0; i < documentosFaltantes.length; i++) {
                        imprimir += "<br>" + documentosFaltantes[i];
                        $(".listasFaltantes").html(imprimir);
                    }
                    $('#modalFaltantesSup').modal('show');
                   // $("#form-prueba")[0].reset();

                } else {
                    console.log("No hay nada");
                }
            } else {
                return swal("Error", "El curp ingresado no tiene el formato correcto", "error");
            }

        });
    });

    //////////////Obtener datos del formulario Propietario///////////////////////////
    $("#addAndContinue").on("click", function() {
        infoDiputaciones = {

            tipoCandidatura: $("#reg-tipoEleccion").val(),
            distritoCandidatura: $("#reg-distritos").val(),
            partidoCandidatura: $("#reg-partidos-politicos").val(),
            prelacion: $("#reg-prelacion").val(),
            nombrePropietario: $("#reg-pro-nombre").val(),
            appPropietario: $("#reg-pro-ap").val(),
            apmPropietario: $("#reg-pro-am").val(),
            fecnPropietario: $("#reg-pro-fecn").val(),
            genPropietario: $("#reg-pro-genDip").val(),
            sitePropietario: $("#reg-pro-sitenac").val(),
            clvPropietario: $("#reg-pro-claveElector").val(),
            curpPropietario: $("#reg-pro-curp").val(),
            reg_pro_num_emision: $("#reg-pro-num_emision").val(),
            reg_pro_ocr: $("#reg-pro-ocr").val(),
            reg_pro_CIC: $("#reg-pro-CIC").val(),
            reg_pro_seccion: $("#reg-pro-seccion").val(),
            timePropietario: $("#reg-pro-timeres").val(),
            aliasPropietario: $("#reg-pro-sobrenombre").val(),


            // cambios de ultima hora
            propCarta3D3: $("#doc-carta-3-dp").prop("checked"),
            propCartaEleccion: $('input[name=cartaEleccion-dp]:checked').val(),
            propConstAutOrganoPartidista: $('input[name=constAutOrganoPartidista-dp]:checked').val(),
            propManifestacionIndigena: $('input[name=manifestacionIndigena-dp]:checked').val(),
            propConsVinculoComuni: $('input[name=consVinculoComuni-dp]:checked').val(),
            //fin cambios de ultima hora

            proSNR: $("#pro-snr").prop("checked"),
            proReg: $("#pro-regcan").prop("checked"),
            proAct: $("#pro-actnac").prop("checked"),
            proCopia: $('input[name=proCopiaMPT]:checked').val(),
            preCred: $("#pro-cred").prop("checked"),
            proAceptacion: $("#pro-aceptacion").prop("checked"),
            proSeparacion: $('input[name=proSeparacionCargo]:checked').val(),
            proRad: $("#pro-radicacion").prop("checked"),
            proNP: $("#pro-antpen").prop("checked"),
            proInahbilitado: $("#pro-inhabilitado").prop("checked"),
            proME: $("#pro-me").prop("checked"),
            proCE: $("#pro-ce").prop("checked"),
            proCP: $("#pro-cp").prop("checked"),
            proEstado: "",
            prosup: "",
            usuarioActual: "",
            politicaP: $("#cboPoliticaDP").prop("checked"),
            email: $("#IemailDipMA").val()
        }


        if ($("#reg-tipoEleccion").val() == "") {
            return swal("Error", "Seleccione un tipo de elección", "error");
        }

        if ($("#reg-distritos").val() == "") {
            return swal("Error", "Seleccione un distrito", "error");
        }

        if ($("#reg-partidos-politicos").val() == "") {
            return swal("Error", "Seleccione un partido politico", "error");
        }

        if (infoDiputaciones.tipoCandidatura == 2) {
            if ($("#reg-prelacion").val() == "") {
                return swal("Error", "Seleccione una orden de prelación", "error");
            }
        }

        validarCampos('registroPropietario').then(exito => {

            if(infoDiputaciones.reg_pro_CIC !== ''){
            if (!validarCIC(infoDiputaciones.reg_pro_CIC)) {
                return swal("Error", "El CIC no tiene el formato correcto", "error");
            }
        }

            var expreg = new RegExp("[A-Z]{6}[0-9]{8}[A-Z]{1}[0-9]{3}");
            if (!expreg.test(infoDiputaciones.clvPropietario)) {
                return swal("Error", "La clave elector no tiene el formato correcto", "error");
            }

            var curp = $("#reg-pro-curp").val().toUpperCase();
            if (curpValida(curp)) { // ⬅️ Acá se comprueba

                if (!infoDiputaciones.politicaP) {
                    return swal("Error", "No ha aceptado la Política de Privacidad", "error");
                }

                $.ajax({
                    url: 'servicios/validaciones.php',
                    type: "POST",
                    data: { tipo: 'existsOtraCandi', clave_elector: infoDiputaciones.clvPropietario, curp: infoDiputaciones.curpPropietario },
                    success: async function(respuesta) {
                        console.log(respuesta);
                        respuesta = JSON.parse(respuesta);
                            console.log(respuesta);
                        if (respuesta.status === -1) {

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
                        } /*else if (respuesta.status === 0) {

                            return swal("Error", respuesta.mensaje, "error");
                        }*/

                        estadoRegistro = documentacionValidacion(
                            infoDiputaciones.propCarta3D3,
                            infoDiputaciones.propCartaEleccion,
                            infoDiputaciones.propConstAutOrganoPartidista,
                            infoDiputaciones.propManifestacionIndigena,
                            infoDiputaciones.propConsVinculoComuni,

                            infoDiputaciones.proSNR,
                            infoDiputaciones.proReg,
                            infoDiputaciones.preCred,
                            infoDiputaciones.proAct,
                            infoDiputaciones.proCopia,
                            infoDiputaciones.proRad,
                            infoDiputaciones.proAceptacion,
                            infoDiputaciones.proSeparacion,
                            infoDiputaciones.proInahbilitado,
                            infoDiputaciones.proNP,
                            infoDiputaciones.proME,
                            infoDiputaciones.proCE,
                            infoDiputaciones.proCP);

                        if (estadoRegistro) {
                            infoDiputaciones.proEstado = "Completo";
                            $('#modal-documentos').val("agregar-diputacion");
                            $("#agregarModal").trigger('click');
                        } else {
                            var imprimir = "";
                            for (var i = 0; i < documentosFaltantes.length; i++) {
                                imprimir += "<br>" + documentosFaltantes[i];
                                $(".listasFaltantes").html(imprimir);
                            }
                            infoDiputaciones.proEstado = "Incompleto";
                            $("#modalFaltantesG").modal("show");
                            $('#modal-documentos').val("agregar-diputacion");
                        }
                    },
                    error: function() { console.log("Hubo un error al comprobar si existe"); }
                });
            } else {
                return swal("Error", "El curp ingresado no tiene el formato correcto", "error");
            }
        });
    });

    ///////////////////Obtener datos del formulario suplente////////////////////////////////
    $("#agregarModal").click(function() {

        if ($('#modal-documentos').val() === "agregar-diputacion") {

            infoDiputaciones.usuarioActual = $.buscarCookie("usuario");
            $('#modalFaltantesG').modal('hide');

            tipoCandidatura = $("#reg-tipoEleccion").val();
            distritoCandidatura = $("#reg-distritos").val();
            partidoCandidatura = $("#reg-partidos-politicos").val();
            prelacion = $("#reg-prelacion").val();

            nombrePropietario = $("#reg-pro-nombre").val();
            appPropietario = $("#reg-pro-ap").val();
            apmPropietario = $("#reg-pro-am").val();
            fecnPropietario = $("#reg-pro-fecn").val();
            genPropietario = $("#reg-pro-gen").val();
            sitePropietario = $("#reg-pro-sitenac").val();
            clvPropietario = $("#reg-pro-claveElector").val();
            curpPropietario = $("#reg-pro-curp").val();
            timePropietario = $("#reg-pro-timeres").val();
            aliasPropietario = $("#reg-pro-sobrenombre").val();


            if (tipoCandidatura == TE_MAYORIA_RELATIVA) {
                infoDiputaciones.prosup = "Propietario";
                infoDiputaciones.prelacion = "00";

                if (partidoCandidatura == "Candidatura Independiente") {

                    $.addPropietarioIndependiente(
                        infoDiputaciones.nombrePropietario, infoDiputaciones.appPropietario, infoDiputaciones.apmPropietario, infoDiputaciones.genPropietario,
                        infoDiputaciones.partidoCandidatura, infoDiputaciones.tipoCandidatura, infoDiputaciones.clvPropietario, infoDiputaciones.curpPropietario,
                        infoDiputaciones.reg_pro_num_emision, infoDiputaciones.reg_pro_ocr, infoDiputaciones.reg_pro_CIC, infoDiputaciones.reg_pro_seccion,
                        infoDiputaciones.distritoCandidatura, infoDiputaciones.fecnPropietario, infoDiputaciones.sitePropietario, infoDiputaciones.timePropietario, infoDiputaciones.aliasPropietario,
                        infoDiputaciones.proEstado, infoDiputaciones.prelacion, infoDiputaciones.usuarioActual, infoDiputaciones.prosup, "NO", infoDiputaciones.proSNR, infoDiputaciones.proReg,
                        infoDiputaciones.proAct, infoDiputaciones.proCopia, infoDiputaciones.preCred, infoDiputaciones.proAceptacion, infoDiputaciones.proSeparacion,
                        infoDiputaciones.proRad, infoDiputaciones.proNP, proInahbilitado, infoDiputaciones.proME, infoDiputaciones.proCE, infoDiputaciones.proCP, infoDiputaciones.politicaP, infoDiputaciones.email);
                } else {
                    $.addPropietario(infoDiputaciones);
                }
            } else if (tipoCandidatura == TE_REPRESENTACION_PROPORCIONAL) {

                infoDiputaciones.prosup = "Propietario";
                infoDiputaciones.prelacion = $("#reg-prelacion").val();

                if (distritoCandidatura != PLURINOMINAL) {
                    swal("Alto", "Debes seleccionar plurinominal en el campo de distrito en caso de Representación Proporcional", "warning");
                } else {
                    console.log(infoDiputaciones);
                    $.addPropietarioPrelacion(infoDiputaciones);
                }
            } else {
                console.log("Si hay datos");
            }


        }
    });


    $("#sureFinish").on("click", function() {
        infoDiputaciones.usuarioActual = $.buscarCookie("usuario");
        $('#modalFaltantesSup').modal('hide');

        tipoCandidatura = $("#reg-tipoEleccion").val();
        distritoCandidatura = $("#reg-distritos").val();
        partidoCandidatura = $("#reg-partidos-politicos").val();

        infoDiputaciones.idTipoPartidoCandidatura = 1;

        $("#reg-partidos-politicos").each(function() {
            idTipoPartidoCandidatura = $(this.options[this.selectedIndex]).closest('optgroup').attr('value')
        });

        prelacion = $("#reg-prelacion").val();

        nombreSuplente = $("#reg-sup-nombre").val();
        appSuplente = $("#reg-sup-ap").val();
        apmSuplente = $("#reg-sup-am").val();
        fecnSuplente = $("#reg-sup-fecn").val();
        genSuplente = $("#reg-sup-gen").val();
        siteSuplente = $("#reg-sup-sitenac").val();
        clvSuplente = $("#reg-sup-claveElector").val();
        curpSuplente = $("#reg-sup-curp").val();
        timeSuplente = $("#reg-sup-timeres").val();
        aliasSuplente = $("#reg-sup-sobrenombre").val();


        supCarta3D3 = $("#doc-carta-3-ds").prop("checked");
        supCartaEleccion = $('input[name=cartaEleccion-ds]:checked').val();
        supConstAutOrganoPartidista = $('input[name=constAutOrganoPartidista-ds]:checked').val();
        supManifestacionIndigena = $('input[name=manifestacionIndigena-ds]:checked').val();
        supConsVinculoComuni = $('input[name=consVinculoComuni-ds]:checked').val();

        supSNR = $("#doc-snr-sup").prop("checked");
        supReg = $("#doc-regcan-sup").prop("checked");
        supAct = $("#doc-actnac-sup").prop("checked");
        supCopia = $('input[name=copiaMPTsup]:checked').val();
        supCred = $("#doc-cred-sup").prop("checked");
        supAceptacion = $("#doc-aceptacion-sup").prop("checked");
        supSeparacion = $('input[name=separacionCargoSup]:checked').val();
        supRad = $("#doc-radicacion-sup").prop("checked");
        supNP = $("#doc-antpen-sup").prop("checked");
        supInahbilitado = $("#doc-inhabilitado-sup").prop("checked");
        supME = $("#doc-me-sup").prop("checked");
        supCE = $("#doc-ce-sup").prop("checked");
        supCP = $("#doc-cp-sup").prop("checked");

        if (tipoCandidatura == TE_MAYORIA_RELATIVA) {

            infoDiputaciones.prosup = "Suplente";
            infoDiputaciones.prelacion = '00';

            if (idTipoPartidoCandidatura == CANDIDATURA_INDEPENDIENTE) {
                $.addCandidaturaIndependiente(infoDiputaciones);
            } else {

                $.addCandidatura(
                    infoDiputaciones.nombreSuplente,
                    infoDiputaciones.appSuplente,
                    infoDiputaciones.apmSuplente,
                    infoDiputaciones.genSuplente,
                    infoDiputaciones.partidoCandidatura,
                    infoDiputaciones.tipoCandidatura,
                    infoDiputaciones.clvSuplente,
                    infoDiputaciones.curpSuplente,
                    infoDiputaciones.reg_pro_num_emision,
                    infoDiputaciones.reg_pro_ocr,
                    infoDiputaciones.reg_pro_CIC,
                    infoDiputaciones.reg_pro_seccion,
                    infoDiputaciones.distritoCandidatura,
                    infoDiputaciones.fecnSuplente,
                    infoDiputaciones.siteSuplente,
                    infoDiputaciones.timeSuplente,
                    infoDiputaciones.aliasSuplente,
                    infoDiputaciones.proEstado, infoDiputaciones.prelacion,
                    infoDiputaciones.usuarioActual, infoDiputaciones.prosup,


                    infoDiputaciones.supCarta3D3,
                    infoDiputaciones.supCartaEleccion,
                    infoDiputaciones.supConstAutOrganoPartidista,
                    infoDiputaciones.supManifestacionIndigena,
                    infoDiputaciones.supConsVinculoComuni,


                    infoDiputaciones.supSNR,
                    infoDiputaciones.supReg,
                    infoDiputaciones.supAct,
                    infoDiputaciones.supCopia,
                    infoDiputaciones.supCred,
                    infoDiputaciones.supAceptacion,
                    infoDiputaciones.supSeparacion,
                    infoDiputaciones.supRad,
                    infoDiputaciones.supNP,
                    infoDiputaciones.supInahbilitado,
                    infoDiputaciones.supME,
                    infoDiputaciones.supCE,
                    infoDiputaciones.supCP,
                    infoDiputaciones.politicaP,
                    infoDiputaciones.politicaP);
            }


        } else if (tipoCandidatura == TE_REPRESENTACION_PROPORCIONAL) {
            infoDiputaciones.prosup = "Suplente";
            infoDiputaciones.prelacion = $("#reg-prelacion").val();

            if (distritoCandidatura != PLURINOMINAL) {
                swal("Alto", "Debes seleccionar plurinominal en el campo de distrito en caso de Representación Proporcional", "warning");
            } else {
                $.addCandidaturaPrelacion(
                    infoDiputaciones.nombreSuplente, infoDiputaciones.appSuplente, infoDiputaciones.apmSuplente, infoDiputaciones.genSuplente, infoDiputaciones.partidoCandidatura,
                    infoDiputaciones.tipoCandidatura, infoDiputaciones.clvSuplente, infoDiputaciones.curpSuplente,
                    infoDiputaciones.reg_pro_num_emision, infoDiputaciones.reg_pro_ocr, infoDiputaciones.reg_pro_CIC, infoDiputaciones.reg_pro_seccion,
                    infoDiputaciones.distritoCandidatura, infoDiputaciones.fecnSuplente,
                    infoDiputaciones.siteSuplente, infoDiputaciones.timeSuplente, infoDiputaciones.aliasSuplente, infoDiputaciones.proEstado, infoDiputaciones.prelacion,
                    infoDiputaciones.usuarioActual, infoDiputaciones.prosup,


                    infoDiputaciones.supCarta3D3,
                    infoDiputaciones.supCartaEleccion,
                    infoDiputaciones.supConstAutOrganoPartidista,
                    infoDiputaciones.supManifestacionIndigena,
                    infoDiputaciones.supConsVinculoComuni,

                    infoDiputaciones.supSNR,
                    infoDiputaciones.supReg,
                    infoDiputaciones.supAct,
                    infoDiputaciones.supCopia,
                    infoDiputaciones.supCred,
                    infoDiputaciones.supAceptacion,
                    infoDiputaciones.supSeparacion,
                    infoDiputaciones.supRad,
                    infoDiputaciones.supNP,
                    infoDiputaciones.supInahbilitado,
                    infoDiputaciones.supME,
                    infoDiputaciones.supCE,
                    infoDiputaciones.supCP,
                    infoDiputaciones.politicaP,
                    infoDiputaciones.email);
            }
        } else {
            console.log("Selecciona cualquiera de las dos opciones en tipo de elección");
        }
    });

    /* funcion para saber si ya exite registro para este partido en este distrito  */
    /* $("#reg-partidos-politicos").change(function() {
        var distrito = $("#reg-distritos").val();
        var partidopolitico = $("#reg-partidos-politicos").val();

        $.checarBD(distrito, partidopolitico);
    }); */

    $("#eraseCandidatura").on("click", function() {
        document.getElementById("registroSuplente").reset();
        document.getElementById("docSuplente").reset();
    });


});