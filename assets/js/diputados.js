$("#reg-tipoEleccion").on('change', () => {
    $("#rdContainer").addClass("d-none");
});

$("#reg-distritos").on('change', () => {
    $("#rdContainer").addClass("d-none");
});

$("#reg-partidos-politicos").on('change', () => {
    let tipoEleccion = $("#reg-tipoEleccion option:selected ").val();
    let distrito = $("#reg-distritos option:selected").val();
    let partido = $("#reg-partidos-politicos option:selected").val();

    if (tipoEleccion == 1) {
        if (partido == '') {
            $("#rdContainer").addClass("d-none");
        } else {
            $("#rdContainer").removeClass("d-none");
            validarGeneroPartido(tipoEleccion, distrito, partido, '');
        }
    } else {
        let ORPRE = $("#reg-prelacion option:selected").val();
        if (partido == '') {
            $("#rdContainer").addClass("d-none");
        } else if (partido != '' && ORPRE != '') {
            $("#rdContainer").removeClass("d-none");
            validarGeneroPartido(tipoEleccion, distrito, partido, ORPRE);
        }
    }
});

$("#reg-prelacion").on("change", () => {
    let tipoEleccion = $("#reg-tipoEleccion option:selected ").val();
    let distrito = $("#reg-distritos option:selected").val();
    let partido = $("#reg-partidos-politicos option:selected").val();
    let ORPRE = $("#reg-prelacion option:selected").val();

    if (!partido == '' && !ORPRE == '') {
        $("#rdContainer").removeClass("d-none");
        validarGeneroPartido(tipoEleccion, distrito, partido, ORPRE);
    } else {
        $("#rdContainer").addClass("d-none");
    }
});


function validarGeneroPartido(tipoEleccion, distrito, partido, prelacion) {
    prelacion = prelacion == '' ? 0 : prelacion;
    tipoEleccion = tipoEleccion == '' ? 0 : tipoEleccion;


    var selected = $(':selected', $("#reg-partidos-politicos"));
    candIndependiente = selected.parent().attr('value');
    if (candIndependiente == '4') {
        $("#raContainer").removeClass("d-none");
        esconderForm('rdContainer', '', true);
        return;
    }

    $.ajax({
        type: "POST",
        url: 'servicios/diputaciones/validarSexo.php',
        data: { tipoEleccion, distrito, partido, prelacion, 'tipoCand': 1 }
    }).done(function(respuesta) {
        respuesta = JSON.parse(respuesta);
        if (respuesta.status_code == 201) {
            $("#rdContainer").addClass("d-none");
            return swal("Información", 'Ya se han registrado el propietario y suplente', 'info');
        }
        esconderForm('rdContainer', respuesta);

    }).fail(function() {
        console.error("No hace nada");
    });;
}



/*********************************************************************************************************** */


var subEstado;
let resetInputsSubsanacion = () => {
    $("#candidato_nombre-rp").val('');
    $("#candidato_ap_paterno-rp").val('');
    $("#candidato_ap_materno-rp").val('');
    $("#sub-tipocandidatura-rp").text('');
    $("#sub-pp-rp").text('');
    $("#prelacion").val('');
    $("#candidato_fec_nacimiento-rp").val('');
    $("#candidato_genero-rp").val('');
    $("#candidato_clave_elector-rp").val('');
    $("#candidato_curp-rp").val('');
    $("#candidato_tiempo_residencia-rp").val('');
    $("#candidato_sobrenombre-rp").val('');
    $(".inforp-subsanacion").hide();
}

let limpiarModalsubsanacion = () => {

    $("#doc-carta-3-modal").prop('checked', false);
    $("input[name=cartaEleccion-modal][value='NO APLICA']").prop('checked', true);
    $("input[name=constAutOrganoPartidista-modal][value='NO APLICA']").prop('checked', true);
    $("input[name=manifestacionIndigena-modal][value='NO APLICA']").prop('checked', true);
    $("input[name=consVinculoComuni-modal][value='NO APLICA']").prop('checked', true);


    $("input[name=actaSubsanacion][value='NO APLICA']").prop('checked', true);
    $("input[name=subsanacionSep][value='NO APLICA']").prop('checked', true);

    $("#doc-snr-modal").prop('checked', false);
    $("#doc-regcan-modal").prop('checked', false);
    $("#doc-cred-modal").prop('checked', false);
    $("#doc-actnac-modal").prop('checked', false);
    $("#doc-radicacion-modal").prop('checked', false);
    $("#doc-aceptacion-modal").prop('checked', false);
    $("#doc-inhabilitado-modal").prop('checked', false);
    $("#doc-antpen-modal").prop('checked', false);
    $("#doc-me-modal").prop('checked', false);
    $("#doc-ce-modal").prop('checked', false);
    $("#doc-rfc-modal").prop('checked', false);
}


let resetInputs = () => {
    $("#candidato_nombre").val('')
    $("#candidato_ap_paterno").val('')
    $("#candidato_ap_materno").val('')
    $("#sub-tipocandidatura").text('')
    $("#sub-pp").text('')
    $("#candidato_distrito").val('')
    $("#candidato_fec_nacimiento").val('')
    $("#candidato_genero").val('')
    $("#candidato_clave_elector").val('')
    $("#candidato_curp").val('')
    $("#candidato_tiempo_residencia").val('')
    $("#candidato_sobrenombre").val('')
    $(".infoc-subsanacion").hide();
    $(".inforp-subsanacion").hide();
}



let resetInputsCandidatura = () => {
        $("#sus-nombre").text('')
        $("#sus-ap").text('')
        $("#sus-am").text('')
        $("#sus-candidatura").text('')
        $("#sus-curp").text('')
        $("#sus-comunidad").text('')
        $("#sus-distrito").text('')
        $("#sus-pp").text('')
        $("#sus-genero").text('')
        $(".infoc-sustitucion").hide();
        $(".candidato-plurinominal").hide();
        $(".prelacion-campo").hide();
        $(".candidato-mayoria").hide();
        $(".prelacion-campo").hide();
    }
    /* Finaliza sustitucion.js */


function documentacionValidacion(snr, reg, cred, act, copia, rad, aceptacion, separacion, noinah, np, me, ce, cp) {
    documentosFaltantes = [];
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
    }

    if (documentosFaltantes.length > 0) {
        subEstado = "Incompleto";
        return subEstado;
    } else {
        subEstado = "Completo";
        return subEstado;
    }
}


function limpiarSustitucion() {
    $("#docSustitucion")[0].reset();
    $("#infoSustitucion")[0].reset();
    $("#new-motivo").val();
    $("#busqueda-sustituir").val();
    $(".infoc-sustitucion").hide();
    $(".candidato-plurinominal").hide();
    $(".candidato-mayoria").hide();
    $(".prelacion-campo").hide();
    $(".inforp-subsanacion").hide();
}



function documentacionCambios(

    // inicio nuevos campos de ultima hora
    carta3D3_a,
    cartaEleccion_a,
    constAutOrganoPartidista_a,
    manifestacionIndigena_a,
    consVinculoComuni_a,
    //fin nuevos

    subSNR_a,
    subREG_a,
    subCRED_a,
    subACTA_a,
    subCOPIA_a,
    subCONSTANCIA_a,
    subACEPTACION_a,
    subSEPARACION_a,
    subESCRITO_a,
    subCARTA_a,
    subMANIFESTACION_a,
    subCAPACIDAD_a,
    subCEDULA_a,
    //Nuevas

    carta3D3_n,
    cartaEleccion_n,
    constAutOrganoPartidista_n,
    manifestacionIndigena_n,
    consVinculoComuni_n,

    subSNR_n,
    subREG_n,
    subCRED_n,
    subACTA_n,
    subCOPIA_n,
    subCONSTANCIA_n,
    subACEPTACION_n,
    subSEPARACION_n,
    subESCRITO_n,
    subCARTA_n,
    subMANIFESTACION_n,
    subCAPACIDAD_n,
    subCEDULA_n,

) {
    cambios = [];

    //inicio nuevos campos

    if ("" + carta3D3_a != "" + carta3D3_n) {
        cambios.push("CARTA 3 DE 3");
    }

    if ("" + cartaEleccion_a != "" + cartaEleccion_n) {
        cambios.push("CARTA REELECCIÓN");
    }

    if ("" + constAutOrganoPartidista_a != "" + constAutOrganoPartidista_n) {
        cambios.push("CONSTANCIA DE AUTORIZACIÓN DEL ÓRGANO PARTIDISTA EN CASO DE RELECCIÓN");
    }
    if ("" + manifestacionIndigena_a != "" + manifestacionIndigena_n) {
        cambios.push("MANIFESTACIÓN DE AUTOADSCRIPCIÓN INDÍGENA");
    }
    if ("" + consVinculoComuni_a != "" + consVinculoComuni_n) {
        cambios.push("Documento emitido por el SNR del INE");
    }
    // fin nuevos campos

    //comparacion para mostrar pdf o no
    if ("" + subSNR_a != "" + subSNR_n) {
        cambios.push("Documento emitido por el SNR del INE");
    }
    if ("" + subREG_a != "" + subREG_n) {
        cambios.push("Solicitud de Registro de Candidatura");
    }
    if ("" + subCRED_a != "" + subCRED_n) {
        cambios.push("Credencial para votar vigente");
    }
    if ("" + subACTA_a != "" + subACTA_n) {
        cambios.push("Copia certificada del Acta de Nacimiento (extracto)");
    }
    if ("" + subCOPIA_a != "" + subCOPIA_n) {
        cambios.push("Copia certificada del Acta de Nacimiento del padre o madre Tlaxcalteca");
    }
    if ("" + subCONSTANCIA_a != "" + subCONSTANCIA_n) {
        cambios.push("Constancia de radicación");
    }
    if ("" + subACEPTACION_a != "" + subACEPTACION_n) {
        cambios.push("Constancia de aceptación de la postulación");
    }
    if ("" + subSEPARACION_a != "" + subSEPARACION_n) {
        cambios.push("Constancia de separación del cargo de la función pública");
    }
    if ("" + subESCRITO_a != "" + subESCRITO_n) {
        cambios.push("Escrito bajo protesta de decir verdad, que no se encuentra inhabilitado para ocupar un cargo público y que no se cuenta con antecedentes penales");
    }
    if ("" + subCARTA_a != "" + subCARTA_n) {
        cambios.push("Carta de antecendentes no penales");
    }
    if ("" + subMANIFESTACION_a != "" + subMANIFESTACION_n) {
        cambios.push("Manifiesto de partido político");
    }
    if ("" + subCAPACIDAD_a != "" + subCAPACIDAD_n) {
        cambios.push("Informe de capacidad económica");
    }
    if ("" + subCEDULA_a != "" + subCEDULA_n) {
        cambios.push("Cédula de identificación fiscal");
    } else {

    }
}

$(document).ready(function() {


    // variables para subsanacion
    var registrosSubsanacion;

    var usuarioActual = $.buscarCookie("usuario");
    // usuario actual
    var documentosFaltantes = [];
    let subEstado = "";
    //variables globales para detectar cambios
    //formato: NOMBREVARIABLE_a - (a de anterior)
    var cambios = [];

    let carta3D3_a;
    let cartaEleccion_a;
    let constAutOrganoPartidista_a;
    let manifestacionIndigena_a;
    let consVinculoComuni_a;

    let subSNR_a;
    let subREG_a;
    let subCRED_a;
    let subACTA_a;
    let subCOPIA_a;
    let subCONSTANCIA_a;
    let subACEPTACION_a;
    let subSEPARACION_a;
    let subESCRITO_a;
    let subCARTA_a;
    let subMANIFESTACION_a;
    let subCAPACIDAD_a;
    let subCEDULA_a;

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
    var proCred = "";
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
    var nombreSustitucion = "";
    var appSustitucion = "";
    var apmSustitucion = "";
    var generoSustitucion = "";
    var partidoCandidatura = "";
    var tipoCandidatura = "";
    var clvSustitucion = "";
    var curpSustitucion = "";
    var distritoCandidatura = "";
    var timeSustitucion = "";
    var aliasSustitucion = "";
    var fecnacnew = "";
    var newestado = "";
    var newprelacion = "";
    var newUsuarioActual = "";

    var newsup = "";
    var newSNR = "";
    var newReg = "";
    var newAct = "";
    var newCopia = "";
    var newCred = "";
    var newAceptacion = "";
    var newSeparacion = "";
    var newRad = "";
    var newNP = "";
    var newInahbilitado = "";
    var newME = "";
    var newCE = "";
    var newCP = "";


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
    var proCred = "";
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
    var nombreSustitucion = "";
    var appSustitucion = "";
    var apmSustitucion = "";
    var generoSustitucion = "";
    var partidoCandidatura = "";
    var tipoCandidatura = "";
    var clvSustitucion = "";
    var curpSustitucion = "";
    var distritoCandidatura = "";
    var timeSustitucion = "";
    var aliasSustitucion = "";
    var fecnacnew = "";
    var newestado = "";
    var newprelacion = "";
    var newUsuarioActual = "";

    var newsup = "";
    var newSNR = "";
    var newReg = "";
    var newAct = "";
    var newCopia = "";
    var newCred = "";
    var newAceptacion = "";
    var newSeparacion = "";
    var newRad = "";
    var newNP = "";
    var newInahbilitado = "";
    var newME = "";
    var newCE = "";
    var newCP = "";


    $("#menucomunidad").on('click', () => {
        sltTIpoElecionR();
        sltTIpoElecion();
        estados();
    });

    $("#menuayuntamiento").on("click", () => {
        sltTIpoElecionR();
        sltTIpoElecion();
        estados();
    });

    $("#menuSubsanacion").on("click", function() {
        limpiartodosFormularios();
        sltTIpoElecionR();
        sltTIpoElecion();
        estados();

    });

    $("#menuSustitucion").on("click", function() {
        limpiartodosFormularios();
        sltTIpoElecionR();
        sltTIpoElecion();
        estados();

    });

    $("#menuCancelacion").on("click", function() {
        limpiartodosFormularios();
        sltTIpoElecionR();
        sltTIpoElecion();
        estados();

    });

    $("#menuRegistro").on("click", function() {
        $("#rdContainer").addClass("d-none");

        $("#reg-distritos").attr("disabled", true);
        $("#reg-distritos").html("<option value='Todos'>Seleccione una una opción</option>");
        $("#reg-partidos-politicos").attr("disabled", true);
        $("#reg-partidos-politicos").html("<option value='Todos'>Seleccione una opción</option>");

        $("#area-prelacion").css("display", "none");

        sltTIpoElecionR();
        sltTIpoElecion();
        estados();

    });



    $("#menuGobernador").on("click", function() {
        sltTIpoElecionR();
        sltTIpoElecion();
        estados();
    });

    $("#menuReportes").on("click", function() {
        limpiartodosFormularios();
        sltTIpoElecionR();
        sltTIpoElecion();
        estados();

    });

    function limpiarRegistro() {
        $("#registroPropietario")[0].reset();
        $("#docPropietario")[0].reset();
        $("#registroSuplente")[0].reset();
        $("#docSuplente")[0].reset();
        $("#reg-distritos").val("");
        $("#reg-tipoEleccion").val("");
        $("#reg-partidos-politicos").val("");
    }



    // limpia la sustiticion con el boton de cancelar
    function limpiarForSustitucion() {
        $("#busqueda-sustituir").val("");
        $("#docSustitucion").val("");
    }
    // limpia la subsanacion con el botn de cancelar
    function limpiarForSubsanacion() {
        $("#busqueda-subsanar").val("");
        $(".infoc-subsanacion").hide();
        $(".inforp-subsanacion").hide();
    }

    $(window).bind('beforeunload', function() {
        limpiartodosFormularios();
    });

    /* Aqui se agrega la informacion de subsanacion.js */

    /*
     * 
     * subsanacion
     *
     */

    //Imprimir documentos para subsanacion
    $.printSubDocsDoble = function(clave_elector, id) {
            $.ajax({
                url: "servicios/printdocsdouble.php",
                type: "POST",
                data: { "search": clave_elector, "id": id }
            }).done(function(respuesta) {
                var respuesta = JSON.parse(respuesta);
                if (respuesta.datos == 0) {
                    console.error("No se pudo conecta a la base de datos");
                } else if (respuesta.datos == 2) {

                    //$('#consultaActaNacimiento').html(respuesta.COPIA);
                    //$('#consultaSeparacion').html(respuesta.SEPARACION);
                    $("input[name=actaSubsanacion][value='" + respuesta.COPIA + "']").prop('checked', true);
                    $("input[name=subsanacionSep][value='" + respuesta.SEPARACION + "']").prop('checked', true);

                    if (respuesta.SNR == "true") {
                        $("#doc-snr-modal").prop('checked', "true");
                    } else {}

                    if (respuesta.REG == "true") {
                        $("#doc-regcan-modal").prop('checked', "true");
                    } else {}
                    if (respuesta.CRED == "true") {
                        $("#doc-cred-modal").prop('checked', "true");
                    } else {}
                    if (respuesta.ACT == "true") {
                        $("#doc-actnac-modal").prop('checked', "true");
                    } else {}
                    if (respuesta.RESIDENCIA == "true") {
                        $("#doc-radicacion-modal").prop('checked', "true");
                    } else {}
                    if (respuesta.ACEPTACION == "true") {
                        $("#doc-aceptacion-modal").prop('checked', "true");
                    } else {}
                    if (respuesta.ESCRITO == "true") {
                        $("#doc-inhabilitado-modal").prop('checked', "true");
                    } else {}
                    if (respuesta.NP == "true") {
                        $("#doc-antpen-modal").prop('checked', "true");
                    } else {}
                    if (respuesta.MANIFIESTO == "true") {
                        $("#doc-me-modal").prop('checked', "true");
                    } else {}
                    if (respuesta.CAPACIDAD == "true") {
                        $("#doc-ce-modal").prop('checked', "true");
                    } else {}
                    if (respuesta.RFC == "true") {
                        $("#doc-rfc-modal").prop('checked', "true");
                    } else {}

                }
            }).fail(function() {
                console.error("No hace nada");
            });
        }
        /*****************************
         * 
         * 
         * //OnClick botón del modal "finalizar"
         * 
         * 
         * **********************************/



    $("#imprimir-reporte").on("click", function() {

        console.log("entra");
        var documentacion = $("#cand_estado").text();
        var separacion_Doc = $('input[name=consultaSep]:checked').val();
        var part_pol = $("#cand_partido_politico").text();
        var tipo_can = $("#cand_prop").text();
        var clave_ele = $("#cand_clave_elector").text();
        let capturista = $(".name-captura").text();

        console.log(tipo_can, documentacion, separacion_Doc, part_pol, clave_ele, capturista);

        /////////////////////////////////////////////////////////////
        if (tipo_can == 'GUBERNATURA') {

            if (documentacion !== "Completo") {

                generarPDF(clave_ele, 'plantillasGobernatura/RGobDocFal', TE_GUBERNATURA);

                if (separacion_Doc == "NO") {
                    documento = "plantillasGobernatura/RSCARGOG";
                    generarPDF(clave_ele, documento, TE_GUBERNATURA);
                }
            } else {

                var documento = "plantillasGobernatura/cvRegGob";
                generarCV(clave_ele, capturista, documento, TE_GUBERNATURA);
            }
            ///////////////////////////////////////////////////////////    
        } else if (tipo_can == "MAYORÍA RELATIVA" || tipo_can == "REPRESENTACIÓN PROPORCIONAL") {

            let candi = 0;
            //////////////////////////////////////////////////////
            if (tipo_can == 'MAYORÍA RELATIVA') {

                candi = TE_MAYORIA_RELATIVA;
            } else {

                candi = TE_REPRESENTACION_PROPORCIONAL;
            }


            var documento = "";
            if (documentacion == "Completo") {

                if (tipo_can == "MAYORÍA RELATIVA") { //se agregaron las siguientes lineas para que diferenciara
                    documento = "plantillasDiputaciones/cv";
                    usuarioActual = $.buscarCookie("usuario");

                    generarCV(clave_ele, usuarioActual, documento, candi);


                } else {
                    documento = "plantillasDiputaciones/cvpluri"; //entre los tipos de carta de verificacion
                    usuarioActual = $.buscarCookie("usuario"); //aqui
                    generarCV(clave_ele, usuarioActual, documento, candi); //aqui tambienb


                }
            } else if (documentacion == "Incompleto") {

                if (part_pol == "Candidatura Independiente") {

                    if (separacion_Doc == "NO") {

                        documento = "plantillasDiputaciones/copp";
                        generarPDF(clave_ele, documento, candi);
                        documento = "plantillasDiputaciones/RSCARGOPP";
                        generarPDF(clave_ele, documento, candi);

                    } else {

                        documento = "plantillasDiputaciones/coind";
                        generarPDF(clave_ele, documento, candi);
                    }

                } else {
                    if (separacion_Doc == "NO") {
                        ///////////////////////////////////////////////////////////
                        if (tipo_can == "REPRESENTACIÓN PROPORCIONAL") {

                            documento = "plantillasDiputaciones/copluri";
                            generarPDF(clave_ele, documento, candi);
                            documento = "plantillasDiputaciones/RSCARGOPLURI";
                            generarPDF(clvSustitucion, documento, candi);

                        } else {

                            documento = "plantillasDiputaciones/copp";
                            generarPDF(clave_ele, documento, candi);
                            documento = "plantillasDiputaciones/RSCARGOPP";
                            generarPDF(clave_ele, documento, candi);

                        }

                        documento = "plantillasDiputaciones/copp";
                        generarPDF(clave_ele, documento, TE_MAYORIA_RELATIVA);
                        documento = "plantillasDiputaciones/RSCARGOPP";
                        generarPDF(clave_ele, documento, TE_MAYORIA_RELATIVA);

                    } else {

                        documento = "plantillasDiputaciones/copp";
                        generarPDF(clave_ele, documento, candi);
                    }
                }
            }


        }
        ///////////////////////////////////////////////////////////////////////////
        else if (tipo_can == 'MUNICIPAL' || tipo_can == 'SINDICATURA' || tipo_can == 'REGIDURIA') {
            console.log(tipo_can);
            let candi = -1;
            switch (tipo_can) {
                case 'MUNICIPAL':
                    candi = 4;
                    break;
                case 'REGIDURIA':
                    candi = 7;
                    break;
                case 'SINDICATURA':
                    candi = 6;


            }
            console.log(candi);
            if (documentacion !== "Completo") {

                if (part_pol == "Candidatura Independiente") {

                    if (separacion_Doc == "NO") {

                        generarPDF(clave_ele, 'plantillasMunicipal/RMuniDocFal', candi);
                        generarPDF(clave_ele, "plantillasMunicipal/RSCARGOPPM", candi);

                    } else {

                        generarPDF(clave_ele, 'plantillasMunicipal/RMuniDocFal', candi);
                    }

                } else {

                    if (separacion_Doc == "NO") {
                        documento = "plantillasMunicipal/coppM";
                        generarPDF(clave_ele, documento, candi);
                        documento = "plantillasMunicipal/RSCARGOPPM";
                        generarPDF(clave_ele, documento, candi);
                    } else {
                        documento = "plantillasMunicipal/coppM";
                        generarPDF(clave_ele, documento, candi);
                    }

                }

            } else {
                console.log(candi, clave_ele, capturista);
                generarCV(clave_ele, capturista, 'plantillasMunicipal/cvM', candi);
            }


        }
        ////////////////////////////////////////////////////////////////////
        else if (tipo_can == 'COMUNIDAD') {

            if (documentacion !== "Completo") {

                if (part_pol == "Candidatura Independiente") {

                    if (separacion_Doc == "NO") {
                        generarPDF(clave_ele, 'plantillasComunidad/RComuDocFal', TE_COMUNIDAD);
                        generarPDF(clave_ele, "plantillasComunidad/RSCARGOPPC", TE_COMUNIDAD);

                    } else {

                        generarPDF(clv, 'plantillasComunidad/RComuDocFal', TE_COMUNIDAD);
                    }

                } else {

                    if (separacion_Doc == "NO") {
                        documento = "plantillasComunidad/coppC";
                        generarPDF(clave_ele, documento, TE_COMUNIDAD);
                        documento = "plantillasComunidad/RSCARGOPPC";
                        generarPDF(clave_ele, documento, TE_COMUNIDAD);
                    } else {
                        documento = "plantillasComunidad/coppC";
                        generarPDF(clave_ele, documento, TE_COMUNIDAD);
                    }

                }

            } else {

                generarCV(clave_ele, capturista, 'plantillasComunidad/cvC', TE_COMUNIDAD);
            }
        }


        /*   */
    });



    $("#sustitucion-cancelar").on("click", function() {
        limpiarSustitucion();
    });

    // mandamos a llamar la funcion para limpiar la subsanacion al darle click al boton
    $("#subsanacion-cancelar").on("click", function() {
        limpiarForSubsanacion();
    });


    let resetInputsRenuncia = () => {
            $("#sus-nombre").text('')
            $("#sus-ap").text('')
            $("#sus-am").text('')
            $("#sus-candidatura").text('')
            $("#sus-curp").text('')
            $("#sus-comunidad").text('')
            $("#sus-distrito").text('')
            $("#sus-pp").text('')
            $("#sus-genero").text('')
            $(".infoc-cancelacion").hide()
        }
        /* Finaliza renuncia.js */

    $("#cancelCandidatura").on("click", function() {
        limpiarRegistro();
    });

    $("#cancelar-renuncia").on("click", function() {
        limpiarRenuncia();
    });


    $('#modal-candidatura').on('hidden.bs.modal', function(e) {
        limpiarDocConsulta();
    });

});