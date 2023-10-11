$("#menuayuntamiento").on('click', () => {
    $("#raContainer").addClass("d-none");
});


// cambio de municipio
$("#reg-m-municipio").change(/*async*/ function() {

    $("#reg-m-TEleccion option[value=0]").prop("selected", "selected");
    $("#reg-m-TEleccion").prop('disabled', true);

    let idMunicipio = $("#reg-m-municipio").val();
    console.log(idMunicipio);
    if (idMunicipio == 0) {
        $("#raContainer").addClass('d-none');
        return;
    } if (idMunicipio == 59 || idMunicipio == 50 || idMunicipio== 48 || idMunicipio == 27 || idMunicipio == 9 || idMunicipio == 20 || idMunicipio == 5 || idMunicipio == 16 || idMunicipio == 14 || idMunicipio == 11|| idMunicipio == 31 || idMunicipio == 3 || idMunicipio == 56 || idMunicipio == 21 || idMunicipio == 22 || idMunicipio == 12 || idMunicipio == 52 || idMunicipio == 55){
       
        $("#reg-m-partidos-politicos").removeAttr("disabled");    
            contenido = `<option value='' >Selecciona una opción</option><optgroup value="1" label="Partidos políticos"><option value="1">Partido Acción Nacional</option><option value="2">Partido Revolucionario Institucional</option><option value="3">Partido de la Revolución Democrática</option><option value="4">Partido Verde Ecologista de México</option><option value="5">Partido del Trabajo</option><option value="6">Movimiento Ciudadano</option><option value="7">Morena</option><option value="8">Partido Encuentro Solidario</option><option value="9">Redes Sociales Progresistas</option><option value="10">Fuerza Social por México</option><option value="11">Partido Alianza Ciudadana</option><option value="12">Partido Socialista</option><option value="13">Nueva Alianza Tlaxcala</option><option value="14">Encuentro Social Tlaxcala</option><option value="15">Impacto Social SI</option><optgroup value="4" label="Candidaturas independientes"><option value="20">Candidatura Independiente</option></optgroup>`   
                $("#reg-m-partidos-politicos").html(contenido); 
    }
    else {
        $("#reg-m-partidos-politicos").removeAttr("disabled");    
        contenido = `<option value='' >Selecciona una opción</option><optgroup value="1" label="Partidos políticos"><option value="1">Partido Acción Nacional</option><option value="2">Partido Revolucionario Institucional</option><option value="3">Partido de la Revolución Democrática</option><option value="4">Partido Verde Ecologista de México</option><option value="5">Partido del Trabajo</option><option value="6">Movimiento Ciudadano</option><option value="7">Morena</option><option value="8">Partido Encuentro Solidario</option><option value="9">Redes Sociales Progresistas</option><option value="10">Fuerza Social por México</option><option value="11">Partido Alianza Ciudadana</option><option value="12">Partido Socialista</option><option value="13">Nueva Alianza Tlaxcala</option><option value="14">Encuentro Social Tlaxcala</option><option value="15">Impacto Social SI</option>`
                
                $("#reg-m-partidos-politicos").html(contenido); 
        /*let idMunicipio = $("#reg-m-municipio").val();

        data = { "tipo": 'cargarRegidor', idMunicipio };
        sltPost('servicios/municipal/checkReg.php', data).then((result) => {

            if (!result.status_code) {
                console.error(result.mensaje);
            } else {
                data = { tipo: 'partidos', id_distrito: idMunicipio, id_tipo_candidatura: TE_MUNICIPAL };

                $("#raContainer").addClass('d-none');

                // partidos
                sltPost("servicios/selects.php", data).then((resolve) => {
                    if (resolve.ok) {
                        $("#reg-m-partidos-politicos").removeAttr("disabled");
                        sltGenericoLabel(resolve[0], $("#reg-m-partidos-politicos"));
                    } else {
                        $("#reg-m-partidos-politicos").attr("disabled", true);
                        $("#reg-m-partidos-politicos").html("<option value=''>Selecciona una opción</option>");
                        swal("Error", "No se encontraron registros", "error");
                    }
                }, (reject) => console.error);
            }
        }).catch();*/
    }
});

$("#reg-m-partidos-politicos").on('change', () => {
    $("#reg-m-TEleccion option[value=0]").prop("selected", "selected");
    $("#reg-m-TEleccion").prop('disabled', false);
    $("#raContainer").addClass("d-none");
});


//tipo de eleccion
$("#reg-m-TEleccion").on("change", () => {

    $("#raContainer").addClass("d-none");
    $("#groupOrden").addClass("d-none");

    let idMunicipio = $("#reg-m-municipio").val();
    let idPartido = $("#reg-m-partidos-politicos").val();
    let tipo_eleccion = $("#reg-m-TEleccion").val();

    var selected = $(':selected', $("#reg-m-partidos-politicos"));
    candIndependiente = selected.parent().attr('value');

    if (tipo_eleccion == 4) {

        let data = { 'distrito': idMunicipio, partido: idPartido, 'tipoCand': 4 }
        validacionSexo(data, 'raContainer', candIndependiente);

    } else if (tipo_eleccion == 6) {
        sexo = ["FEMENINO", "MASCULINO"];

        let data = { "tipo": 'validarTipoEleccion', idMunicipio, "tipoEleccion": tipo_eleccion, idPartido };
        sltPost('servicios/municipal/checkReg.php', data).then((result) => {

            if (result.status_code != 200) {
                return swal("Error", 'Debe registrar primero Propietaria/o y Suplente en candidatura', 'info');
            }

            if (result.num_sindicatos == 0) {
                sexo = sexo.filter(item => item != result[0].genero);

                esconderForm('raContainer', 0, true);

                $("#reg-m-pro-gen").prop("disabled", "disabled");
                $(`#reg-m-pro-gen option[value='${sexo[0] }']`).prop("selected", true);

                $("#reg-m-sup-gen").prop("disabled", "disabled");
                $(`#reg-m-sup-gen option[value='${sexo[0] }']`).prop("selected", true);
                $("#raContainer").removeClass("d-none");

            } else {
                let data = { 'distrito': idMunicipio, partido: idPartido, 'tipoCand': 6 }
                validacionSexo(data, 'raContainer', candIndependiente);
            }

        }).catch(console.error);

    } else if (tipo_eleccion == 7) {
        sexo = ["FEMENINO", "MASCULINO"];

        let data = { "tipo": 'validarTipoEleccion', idMunicipio, "tipoEleccion": tipo_eleccion, idPartido };
        sltPost('servicios/municipal/checkReg.php', data).then((result) => {

            if (result.status_code == 200) {

                let dataR = { "tipo": "cargarRegidor", idMunicipio };

                sltPost("servicios/municipal/checkReg.php", dataR).then(result => {

                    esconderForm('raContainer', 0, true);
                    contenido = "<option value='0' >Selecciona una opción</option>";

                    for (let i = 1; i <= result.num_regidores; i++) {
                        if (i < 10) {
                            contenido += `<option value = "${ i }" > ${ 'Regidor 0' + i }</option>`
                        } else {
                            contenido += `<option value = "${ i }" >${ 'Regidor 0' + i }</option>`
                        }
                    }


                    $("#reg-m-Osindicatura").html(contenido);
                    $("#groupOrden").removeClass("d-none");
                    $("#reg-m-Osindicatura").prop('disabled', false);

                }).catch(console.error());

            } else {
                swal("Error", 'Debe registrar primero Propietaria/o y Suplente en candidatura', 'info');
            }

        }).catch(console.error);
    }
});

///////////registro de regidurias///////////////////////////////////

$("#reg-m-Osindicatura").on('change', () => {
    $("#raContainer").addClass("d-none");
    let ordenSindicatura = $("#reg-m-Osindicatura").val();
    let partido = $("#reg-m-partidos-politicos").val();
    let idMunicipio = $("#reg-m-municipio").val();


    if (ordenSindicatura == 0) {
        $("#raContainer").addClass("d-none");
        return;
    }
    sexo = ["FEMENINO", "MASCULINO"];

    let data = { "tipo": 'validarTipoEleccion', idMunicipio, idPartido: partido, "tipoEleccion": 7, ordenSindicatura };


    sltPost('servicios/municipal/checkReg.php', data).then((resultado) => {

        let data = { "tipo": 'checkRegidor', idMunicipio, idPartido: partido, "tipoEleccion": 7, ordenSindicatura };

        sltPost('servicios/municipal/checkReg.php', data).then((result) => {

            //console.log(data);
            //console.log(result);

            try {
                if (!result.REGAFULL && ordenSindicatura != 1) {

                    $("#raContainer").addClass("d-none");
                    return swal("Error", 'Debe registrar al regidor anterior', 'info');
                }

                if (result.REGACT) {
                    if (result.status_code == 404) {
                        sexo = sexo.filter(item => item != resultado[0].genero);

                    } else {
                        sexo = sexo.filter(item => item != result.generoAnt);

                    }

                    esconderForm('raContainer', 0, true);
                    $("#reg-m-pro-gen").prop("disabled", "disabled");
                    $(`#reg-m-pro-gen option[value='${sexo[0] }']`).prop("selected", true);

                    $("#reg-m-sup-gen").prop("disabled", "disabled");
                    $(`#reg-m-sup-gen option[value='${sexo[0] }']`).prop("selected", true);
                    $("#raContainer").removeClass("d-none");

                } else {
                    let data1 = { 'distrito': idMunicipio, partido, 'tipoCand': 7, 'ordenSindicatura': ordenSindicatura }
                    validacionSexo(data1, 'raContainer', candIndependiente);
                }
            } catch (e) {
                console.log(result);
            }

        }).catch(console.error());

    }).catch(console.error())
});



/////////fin de registro de regiduria////////////////////////////////

$(document).ready(function() {

    formularioMunicipal = {};

    (async function cargarMunicipios() {
        data = { tipo: 'municipios' };
        await sltPost("servicios/selects.php", data).then((resolve) => {
            if (resolve.ok) {
                sltGenerico(resolve[0], $("#reg-m-municipio"));
            } else {
                swal("Error", "No se encontraron registros", "error");
            }
        }, (reject) => console.error);
    })();


    // SUPLENTE
    $("#reg-municipio-sup").click(function() {

        usuarioActual = $.buscarCookie("usuario");

        // Datos personales
        formularioMunicipal = {
            municipio: $("#reg-m-municipio").val(),
            partidoP: $("#reg-m-partidos-politicos").val(),
            nombre: $("#reg-m-sup-nombre").val(),
            apellidop: $("#reg-m-sup-ap").val(),
            apellidom: $("#reg-m-sup-am").val(),
            fechaNacimiento: $("#reg-m-sup-fecn").val(),
            genero: $("#reg-m-sup-gen").val(),
            lugarNacimiento: $("#reg-m-sup-sitenac").val(),
            clv: $("#reg-m-sup-claveElector").val(),
            curp: $("#reg-m-sup-curp").val(),
            emailMuni: $("#IemailAyuS").val(),
            // nuevos parametros
            num_emision: $("#reg-m-sup-num_emision").val(),
            ocr: $("#reg-m-sup-ocr").val(),
            cic: $("#reg-m-sup-CIC").val(),
            seccion: $("#reg-m-sup-seccion").val(),
            // fin nuevos parametros
            tiempoRes: $("#reg-m-sup-timeres").val(),
            sobrenombre: $("#reg-m-sup-sobrenombre").val(),
            propietario_suplente: "Suplente",
            partidoCandidatura: $("#reg-m-partidos-politicos option:selected").text(),

            //NUEVOS CAMPOS
            carta3D3: $("#doc-carta-3-as").prop("checked"),
            cartaEleccion: $('input[name=cartaEleccion-as]:checked').val(),
            constAutOrganoPartidista: $('input[name=constAutOrganoPartidista-as]:checked').val(),
            manifestacionIndigena: $('input[name=manifestacionIndigena-as]:checked').val(),
            consVinculoComuni: $('input[name=consVinculoComuni-as]:checked').val(),
            //FIN NUEVOS CAMPOS

            documentSNR: $("#doc-m-snr-sup").prop("checked"),
            solicitudRC: $("#doc-m-regcan-sup").prop("checked"),
            credencialINE: $("#doc-m-cred-sup").prop("checked"),
            actaNacimentio: $("#doc-m-actnac-sup").prop("checked"),
            copiaActa: $('input[name=mCopiaMPTsup]:checked').val(),
            contanciaResidencia: $("#doc-m-radicacion-sup").prop("checked"),
            contanciaPostulacion: $("#doc-m-aceptacion-sup").prop("checked"),
            constanciaSeparacion: $('input[name=mSeparacionCargoSup]:checked').val(),
            proInahbilitado: $("#doc-m-inhabilitado-sup").prop("checked"),
            antecedentesNP: $("#doc-m-antpen-sup").prop("checked"),
            documentManifestacion: $("#doc-m-me-sup").prop("checked"),
            informeCE: $("#doc-m-ce-sup").prop("checked"),
            cedulaIF: $("#doc-m-cp-sup").prop("checked"),
            estado: "",
            capturista: $.buscarCookie("usuario"),
            politicaP: $("#cboPoliticaMS").prop("checked"),
            ordenSindicatura: $("#reg-m-Osindicatura").val(),
            tipoEleccion: $("#reg-m-TEleccion").val()
        }


        if ($("#reg-m-municipio").val() == "0") {
            return swal("Error", "Seleccione un Municipio", "error");
        }

        if ($("#reg-m-partidos-politicos").val() == "") {
            return swal("Error", "Seleccione un partido politico", "error");
        }

        validarCampos('registroSuplenteMunicipio').then(exito => {

            if(formularioMunicipal.cic !== ''){
            if (!validarCIC(formularioMunicipal.cic)) {
                return swal("Error", "El CIC no tiene el formato correcto", "error");
            }
        }

            var expreg = new RegExp("[A-Z]{6}[0-9]{8}[A-Z]{1}[0-9]{3}");
            if (!expreg.test(formularioMunicipal.clv)) {
                return swal("Error", "La clave elector no tiene el formato correcto", "error");
            }

            var curp = $("#reg-m-sup-curp").val().toUpperCase();
            if (curpValida(curp)) { // ⬅️ Acá se comprueba

                if (!formularioMunicipal.politicaP) {
                    return swal("Error", "No ha aceptado la Política de Privacidad", "error");
                }

                EstadoRegistro = documentacionValidacion(
                    // inicio cambios de ultima hora                    
                    formularioMunicipal.carta3D3,
                    formularioMunicipal.cartaEleccion,
                    formularioMunicipal.constAutOrganoPartidista,
                    formularioMunicipal.manifestacionIndigena,
                    formularioMunicipal.consVinculoComuni,
                    // inicio cambios de ultima hora
                    formularioMunicipal.documentSNR,
                    formularioMunicipal.solicitudRC,
                    formularioMunicipal.credencialINE,
                    formularioMunicipal.actaNacimentio,
                    formularioMunicipal.copiaActa,
                    formularioMunicipal.contanciaResidencia,
                    formularioMunicipal.contanciaPostulacion,
                    formularioMunicipal.constanciaSeparacion,
                    formularioMunicipal.proInahbilitado,
                    formularioMunicipal.antecedentesNP,
                    formularioMunicipal.documentManifestacion,
                    formularioMunicipal.informeCE,
                    formularioMunicipal.cedulaIF);

                // si la documentacion esta completa
                if (EstadoRegistro) {
                    formularioMunicipal.estado = "Completo";

                    $('#modal-documentos').val("agregar-municipal");
                    $("#agregarModal").trigger('click');
                } else {

                    var imprimir = "";
                    for (var i = 0; i < documentosFaltantes.length; i++) {
                        imprimir += "<br>" + documentosFaltantes[i];
                        $(".listasFaltantes").html(imprimir);
                    }
                    $("#modalFaltantesG").modal("show");
                    formularioMunicipal.estado = "Incompleto";
                    $('#modal-documentos').val("agregar-municipal");
                }
            } else {
                return swal("Error", "El curp ingresado no tiene el formato correcto", "error");
            }
        }).catch(fail => {
            console.error(fail);
        });;
    });



    // Propieratio
    $("#reg-municipio").click(function() {

        usuarioActual = $.buscarCookie("usuario");
        // Datos personales
        formularioMunicipal = {
            municipio: $("#reg-m-municipio").val(),
            partidoP: $("#reg-m-partidos-politicos").val(),
            nombre: $("#reg-m-nombre").val(),
            apellidop: $("#reg-m-ap").val(),
            apellidom: $("#reg-m-pro-am").val(),
            fechaNacimiento: $("#reg-m-pro-fecn").val(),
            //genero: document.getElementById("ocultado2").value,
            genero: $("#reg-m-pro-gen").val(),
            lugarNacimiento: $("#reg-m-pro-sitenac").val(),
            clv: $("#reg-m-pro-claveElector").val(),
            curp: $("#reg-m-pro-curp").val(),
            emailMuni: $("#IemailAyuP").val(),
            // nuevos parametros
            num_emision: $("#reg-m-pro-num_emision").val(),
            ocr: $("#reg-m-pro-ocr").val(),
            cic: $("#reg-m-pro-CIC").val(),
            seccion: $("#reg-m-pro-seccion").val(),
            // fin nuevos parametros
            tiempoRes: $("#reg-m-pro-timeres").val(),
            sobrenombre: $("#reg-m-pro-sobrenombre").val(),
            propietario_suplente: "Propietario",
            partidoCandidatura: $("#reg-m-partidos-politicos option:selected").text(),


            //NUEVOS CAMPOS
            carta3D3: $("#doc-carta-3-ap").prop("checked"),
            cartaEleccion: $('input[name=cartaEleccion-ap]:checked').val(),
            constAutOrganoPartidista: $('input[name=constAutOrganoPartidista-ap]:checked').val(),
            manifestacionIndigena: $('input[name=manifestacionIndigena-ap]:checked').val(),
            consVinculoComuni: $('input[name=consVinculoComuni-ap]:checked').val(),
            //FIN NUEVOS CAMPOS


            documentSNR: $("#pro-m-snr").prop("checked"),
            solicitudRC: $("#pro-m-regcan").prop("checked"),
            credencialINE: $("#pro-m-cred").prop("checked"),
            actaNacimentio: $("#pro-m-actnac").prop("checked"),
            copiaActa: $('input[name=mProCopiaMPT]:checked').val(),
            contanciaResidencia: $("#pro-m-radicacion").prop("checked"),
            contanciaPostulacion: $("#pro-m-aceptacion").prop("checked"),
            constanciaSeparacion: $('input[name=mProSeparacionCargo]:checked').val(),
            proInahbilitado: $("#pro-m-inhabilitado").prop("checked"),
            antecedentesNP: $("#pro-m-antpen").prop("checked"),
            documentManifestacion: $("#pro-m-me").prop("checked"),
            informeCE: $("#pro-m-ce").prop("checked"),
            cedulaIF: $("#pro-m-cp").prop("checked"),
            estado: "",
            capturista: $.buscarCookie("usuario"),
            politicaP: $("#cboPoliticaMP").prop("checked"),
            ordenSindicatura: $("#reg-m-Osindicatura").val(),
            tipoEleccion: $("#reg-m-TEleccion").val()
        }

        if ($("#reg-m-municipio").val() == "0") {
            return swal("Error", "Seleccione un Municipio", "error");
        }

        if ($("#reg-m-partidos-politicos").val() == "") {
            return swal("Error", "Seleccione un partido político", "error");
        }

        validarCampos('registroPropietarioMunicipio').then(exito => {

            if(formularioMunicipal.cic !== ''){
            if (!validarCIC(formularioMunicipal.cic)) {
                return swal("Error", "El CIC no tiene el formato correcto", "error");
            }
        }

            var expreg = new RegExp("[A-Z]{6}[0-9]{8}[A-Z]{1}[0-9]{3}");
            if (!expreg.test(formularioMunicipal.clv)) {
                return swal("Error", "La clave elector no tiene el formato correcto", "error");
            }

            var curp = $("#reg-m-pro-curp").val().toUpperCase();
            if (curpValida(curp)) { // ⬅️ Acá se comprueba

                if (!formularioMunicipal.politicaP) {
                    return swal("Error", "No ha aceptado la Política de Privacidad", "error");
                }

                EstadoRegistro = documentacionValidacion(
                    // campos de ultima hora 
                    formularioMunicipal.carta3D3,
                    formularioMunicipal.cartaEleccion,
                    formularioMunicipal.constAutOrganoPartidista,
                    formularioMunicipal.manifestacionIndigena,
                    formularioMunicipal.consVinculoComuni,
                    // campos de ultima hora 

                    formularioMunicipal.documentSNR,
                    formularioMunicipal.solicitudRC,
                    formularioMunicipal.credencialINE,
                    formularioMunicipal.actaNacimentio,
                    formularioMunicipal.copiaActa,
                    formularioMunicipal.contanciaResidencia,
                    formularioMunicipal.contanciaPostulacion,
                    formularioMunicipal.constanciaSeparacion,
                    formularioMunicipal.proInahbilitado,
                    formularioMunicipal.antecedentesNP,
                    formularioMunicipal.documentManifestacion,
                    formularioMunicipal.informeCE,
                    formularioMunicipal.cedulaIF);

                // si la documentacion esta completa
                if (EstadoRegistro) {

                    formularioMunicipal.estado = "Completo";

                    $('#modal-documentos').val("agregar-municipal");
                    $("#agregarModal").trigger('click');

                } else {

                    var imprimir = "";
                    for (var i = 0; i < documentosFaltantes.length; i++) {
                        imprimir += "<br>" + documentosFaltantes[i];
                        $(".listasFaltantes").html(imprimir);
                    }
                    $("#modalFaltantesG").modal("show");
                    formularioMunicipal.estado = "Incompleto";
                    $('#modal-documentos').val("agregar-municipal");
                }
            } else {
                return swal("Error", "El curp ingresado no tiene el formato correcto", "error");
            }
        }).catch(fail => {
            console.error(fail);
        });;
    });

    $('#modalFaltantesG').on('hide.bs.modal', function(e) {

        $("#modal-documentos").val("");
    });

    $("#agregarModal").click(function() {

        if ($('#modal-documentos').val() === "agregar-municipal") {

            let url = "";
            let tipo_eleccionM = $("#reg-m-TEleccion").val();
            ({
                ordenSindicatura,
                municipio,
                partidoP,
                estado,
                clv,
                capturista,
                partidoCandidatura,
                constanciaSeparacion
            } = formularioMunicipal)

            url = 'servicios/municipal/agregarMunicipal.php';

            $.ajax({
                url: url,
                type: "POST",
                data: formularioMunicipal,
                success: function(respuesta) {
                    var respuesta = JSON.parse(respuesta);
                  
                    if (respuesta.status) {
                        if (estado !== "Completo") {
                             if (partidoCandidatura == "Candidatura Independiente") {
                                 if (constanciaSeparacion == "NO") {
                                     generarPDF(clv, 'plantillasMunicipal/RMuniDocFal', tipo_eleccionM);
                                     generarPDF(clv, "plantillasMunicipal/RSCARGOPPM", tipo_eleccionM);
                                 } else {
                                     generarPDF(clv, 'plantillasMunicipal/RMuniDocFal', tipo_eleccionM);
                                 }
                             } else {

                                 if (constanciaSeparacion == "NO") {
                                     documento = "plantillasMunicipal/coppM";
                                     generarPDF(clv, documento, tipo_eleccionM);
                                     documento = "plantillasMunicipal/RSCARGOPPM";
                                     generarPDF(clv, documento, tipo_eleccionM);
                                 } else {

                                     documento = "plantillasMunicipal/coppM";
                                     generarPDF(clv, documento, tipo_eleccionM);
                                 }
                            }
                        } else {
                            generarCV(clv, capturista, 'plantillasMunicipal/cvM', tipo_eleccionM);
                        }

                        $('#modalFaltantesG').modal('hide');
                        $("#registroPropietarioMunicipio")[0].reset();
                        $("#boxAyuP").hide();
                        $("#IemailAyuP").hide();
                        $("#eti").hide();
                        $("#registroSuplenteMunicipio")[0].reset();
                        $("#boxAyuS").hide();
                        $("#IemailAyuS").hide();
                        $("#eti").hide();

                        $("#docPropietarioMunicipio")[0].reset();
                        $("#docSuplenteMunicipio")[0].reset();

                        formularioMunicipal = {};
                        swal({
                            title: "Se ha registrado con éxito",
                            text: "Candidatura ayuntamiento añadida",
                            icon: "success",
                            button: "Ok",
                        }).then((value) => {

                            var selected = $(':selected', $("#reg-m-partidos-politicos"));
                            candIndependiente = selected.parent().attr('value');
                            if (candIndependiente == 4) return;

                            let data = { 'distrito': municipio, 'partido': partidoP, 'tipoCand': tipo_eleccionM, 'ordenSindicatura': ordenSindicatura }
                            validacionSexo(data, 'raContainer', candIndependiente);
                        });

                    } else {

                        swal("Error", respuesta.mensaje, "error");
                    }
                },
                error: function(error) {
                    console.error(error);
                    console.error("No se ha podido obtener la información");
                }
            });
        }
    });
});