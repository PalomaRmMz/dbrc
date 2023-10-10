$("#menucomunidad").on("click", () => {
    $("#rpcContainer").addClass("d-none");
});

var sexoActual;

//Funcion de validaciond de sexo actual con boton 
function validarSexo(boton) {
    let municipio = $("#reg-c-municipios").val();
    let comunidad = $("#reg-m-comunidad").val();
    let partidoP = $("#reg-c-partidos-politicos").val();
    let data = {
        'distrito': municipio,
        comunidad,
        'partido': partidoP,
        'tipoCand': 5
    }

    sltPost('servicios/diputaciones/validarSexo.php', data).then((respuesta) => {
        console.log(respuesta);
        if (respuesta.status_code === 404) {
            console.log("esta disponible");
        } else if (respuesta.sexo === 'FEMENINO' && sexoActual != 'FEMENINO') {
            console.log("Combinacion no valida");

        } else if (respuesta.sexo === 'MASCULINO') {
            console.log("esta disponible");
        } else if (respuesta.sexo === 'FEMENINO') {
            console.log("esta disponible");
        }
    }).catch(console.error);
}


//VALIDACION DE SEXO
$(document).ready(function () {


    $("#reg-c-pro-gen").change(function (event) {
        sexoActual = $("#reg-c-pro-gen").val();
        if (sexoActual != "") {
            $("#validarPC").removeAttr("disabled");
        } else {
            $("#validarPC").prop("disabled", "disabled");
        }
    });

    $("#reg-c-sup-gen").change(function (event) {
        sexoActual = $("#reg-c-sup-gen").val();
        if (sexoActual != "") {
            $("#validarSC").removeAttr("disabled");
        } else {
            $("#validarSC").prop("disabled", "disabled");
        }
    });

    formularioComunidad = {};


    (async function cargarMunicipiosC() {
        data = {
            tipo: 'municipiosParticipantes'
        };
        await sltPost("servicios/selects.php", data).then((resolve) => {
            // console.log(resolve);
            if (resolve.ok) {
                sltGenerico(resolve[0], $("#reg-c-municipios"));
            } else {
                swal("Error", "No se encontraron registros", "error");
            }
        }, (reject) => console.error);
    })();



    $("#reg-c-municipios").change(async function () {

        id_municipio = $("#reg-c-municipios").val();
        data = {
            tipo: 'comunidades',
            id_municipio
        };
        $("#rpcContainer").addClass("d-none");

        await sltPost("servicios/selects.php", data).then((resolve) => {
            //console.log(resolve);
            if (resolve.ok) {
                $("#reg-m-comunidad").attr('disabled', false);
                sltGenerico(resolve[0], $("#reg-m-comunidad"));
            } else {
                swal("Error", "No se encontraron registros", "error");
            }
        }, (reject) => console.error);

    });

    $("#reg-m-comunidad").change(async function () {
        idComunidad = $("#reg-m-comunidad").val();
        //console.log(idComunidad);

        //data = { tipo: 'partidos', id_distrito: idComunidad, id_tipo_candidatura: TE_COMUNIDAD };
        if (idComunidad == 0) {
            $("#rpcContainer").addClass("d-none");
            return;
        }
        if (idComunidad == 32 || idComunidad == 5 || idComunidad == 14 || idComunidad == 17 || idComunidad == 18 ||
            idComunidad == 71 || idComunidad == 72 || idComunidad == 74 || idComunidad == 131 ||
            idComunidad == 132 || idComunidad == 133 || idComunidad == 134 || idComunidad == 178 ||
            idComunidad == 201 || idComunidad == 202 || idComunidad == 203 || idComunidad == 204 ||
            idComunidad == 205 || idComunidad == 207 || idComunidad == 208 || idComunidad == 209 ||
            idComunidad == 210 || idComunidad == 211 || idComunidad == 212 || idComunidad == 252 ||
            idComunidad == 230 || idComunidad == 232 || idComunidad == 255 || idComunidad == 266 ||
            idComunidad == 267 || idComunidad == 292 || idComunidad == 294 ||
            idComunidad == 295 || idComunidad == 296 || idComunidad == 293) {
            $("#reg-c-partidos-politicos").removeAttr("disabled");
            contenido = `<option value='' >Selecciona una opción</option><optgroup value="1" label="Partidos políticos"><option value="1">Partido Acción Nacional</option><option value="2">Partido Revolucionario Institucional</option><option value="3">Partido de la Revolución Democrática</option><option value="4">Partido Verde Ecologista de México</option><option value="5">Partido del Trabajo</option><option value="6">Movimiento Ciudadano</option><option value="7">Morena</option><option value="8">Partido Encuentro Solidario</option><option value="9">Redes Sociales Progresistas</option><option value="10">Fuerza Social por México</option><option value="11">Partido Alianza Ciudadana</option><option value="12">Partido Socialista</option><option value="13">Nueva Alianza Tlaxcala</option><option value="14">Encuentro Social Tlaxcala</option><option value="15">Impacto Social SI</option><optgroup value="4" label="Candidaturas independientes"><option value="20">Candidatura Independiente</option></optgroup>`
            $("#reg-c-partidos-politicos").html(contenido);
        } else {
            $("#reg-c-partidos-politicos").removeAttr("disabled");
            contenido = `<option value='' >Selecciona una opción</option><optgroup value="1" label="Partidos políticos"><option value="1">Partido Acción Nacional</option><option value="2">Partido Revolucionario Institucional</option><option value="3">Partido de la Revolución Democrática</option><option value="4">Partido Verde Ecologista de México</option><option value="5">Partido del Trabajo</option><option value="6">Movimiento Ciudadano</option><option value="7">Morena</option><option value="8">Partido Encuentro Solidario</option><option value="9">Redes Sociales Progresistas</option><option value="10">Fuerza Social por México</option><option value="11">Partido Alianza Ciudadana</option><option value="12">Partido Socialista</option><option value="13">Nueva Alianza Tlaxcala</option><option value="14">Encuentro Social Tlaxcala</option><option value="15">Impacto Social SI</option>`

            $("#reg-c-partidos-politicos").html(contenido);
        }

        // await sltPost("servicios/selects.php", data).then((resolve) => {
        //     console.log(resolve);
        //     if (resolve.ok) {
        //         $("#reg-c-partidos-politicos").removeAttr("disabled");
        //         sltGenericoLabel(resolve[0], $("#reg-c-partidos-politicos"));
        //     } else {
        //         $("#reg-c-partidos-politicos").attr("disabled", true);
        //         $("#reg-c-partidos-politicos").html("<option value=''>Selecciona una opción</option>");
        //         swal("Error", "No se encontraron registros", "error");
        //     }

        // }, (reject) => console.error);

    });


    $("#reg-c-partidos-politicos").on('change', () => {
        let municipio = $("#reg-c-municipios").val();
        let comunidad = $("#reg-m-comunidad").val();
        let partido = $("#reg-c-partidos-politicos").val();

        if (partido == '') {          
            $("#rpcContainer").addClass("d-none");  

        } else {
            //debugger;  

           /****Bloque para regresar la seleccion a Propietario */
            let contenedor = document.querySelector("#rpcContainer");
            let btnPro = contenedor.querySelectorAll('li>a.btnPro');
            let btnSup = contenedor.querySelectorAll('li>a.btnSup');

            $(btnSup).removeClass("active");
            $(btnSup).removeClass("show");
            $(btnPro).addClass("active");
            $(btnPro).addClass("show");

            $("#pills-suplente-comunidad").removeClass("active");
            $("#pills-suplente-comunidad").removeClass("show");
            $("#pills-propietario-comunidad").addClass("active");
            $("#pills-propietario-comunidad").addClass("show");

           /*************************************************** */
           
            var selected = $(':selected', $("#reg-c-partidos-politicos"));
            candIndependiente = selected.parent().attr('value');

            if (candIndependiente == '4') {
                $("#rpcContainer").removeClass("d-none");
                esconderForm('rpcContainer', '', true);
                return;
            }

            let data = {
                'distrito': municipio,
                comunidad,
                partido,
                'tipoCand': 5
            }
            sltPost('servicios/diputaciones/validarSexo.php', data).then((respuesta) => {

                if (respuesta.status_code == 201) {
                    $("#rpcContainer").addClass("d-none");
                    return swal("Información", 'Ya se han registrado el propietario y suplente', 'info');
                }



                $("#rpcContainer").removeClass("d-none");
                console.log(respuesta);
                esconderForm('rpcContainer', respuesta);
            }).catch(console.error);
        }

    });
    /*************************************************************************+ */


    // SUPLENTE 
    $("#reg-comunidad-sup").click(function () {
        // Datos personales
        formularioComunidad = {
            municipio: $("#reg-c-municipios").val(),
            comunidad: $("#reg-m-comunidad").val(),
            partidoP: $("#reg-c-partidos-politicos").val(),

            nombre: $("#reg-c-sup-nombre").val(),
            apellidop: $("#reg-c-sup-ap").val(),
            apellidom: $("#reg-c-sup-am").val(),
            fechaNacimiento: $("#reg-c-sup-fecn").val(),
            genero: $("#reg-c-sup-gen").val(),
            lugarNacimiento: $("#reg-c-sup-sitenac").val(),
            clv: $("#reg-c-sup-claveElector").val(),
            curp: $("#reg-c-sup-curp").val(),
            emailCom: $("#IemailComuSup").val(),

            //nuevos campos
            num_emision: $("#reg-c-sup-num_emision").val(),
            ocr: $("#reg-c-sup-ocr").val(),
            cic: $("#reg-c-sup-CIC").val(),
            seccion: $("#reg-c-sup-seccion").val(),
            //fin de los nuevos campos

            tiempoRes: $("#reg-c-sup-timeres").val(),
            sobrenombre: $("#reg-c-sup-sobrenombre").val(),
            propietario_suplente: "Suplente",
            partidoCandidatura: $("#reg-m-partidos-politicos option:selected").text(),

            //NUEVOS CAMPOS
            carta3D3: $("#doc-carta-3-cs").prop("checked"),
            cartaEleccion: 'NO APLICA',
            constAutOrganoPartidista: 'NO APLICA',
            manifestacionIndigena: 'NO APLICA',
            consVinculoComuni: 'NO APLICA',
            //FIN NUEVOS CAMPOS

            documentSNR: $("#doc-c-snr-sup").prop("checked"),
            solicitudRC: $("#doc-c-regcan-sup").prop("checked"),
            credencialINE: $("#doc-c-cred-sup").prop("checked"),
            actaNacimentio: $("#doc-c-actnac-sup").prop("checked"),
            copiaActa: 'NO APLICA',
            contanciaResidencia: $("#doc-c-radicacion-sup").prop("checked"),
            contanciaPostulacion: $("#doc-c-aceptacion-sup").prop("checked"),
            constanciaSeparacion: $('input[name=cSeparacionCargoSup]:checked').val(),
            proInahbilitado: $("#doc-c-inhabilitado-sup").prop("checked"),
            antecedentesNP: $("#doc-c-antpen-sup").prop("checked"),
            documentManifestacion: $("#doc-c-me-sup").prop("checked"),
            informeCE: $("#doc-c-ce-sup").prop("checked"),
            cedulaIF: $("#doc-c-cp-sup").prop("checked"),
            estado: "",
            capturista: $.buscarCookie("usuario"),
            politicaP: $("#cboPoliticaCS").prop("checked")
        }

        if ($("#reg-c-municipios").val() == "0") {
            return swal("Error", "Seleccione un Municipio", "error");
        }


        if ($("#reg-m-comunidad").val() == "0") {
            return swal("Error", "Seleccione una comunidad", "error");
        }


        if ($("#reg-c-partidos-politicos").val() == "") {
            return swal("Error", "Seleccione un partido político", "error");
        }


        validarCampos('registroSuplenteComunidad').then(exito => {
            if (formularioComunidad.cic !== '') {
                if (!validarCIC(formularioComunidad.cic)) {
                    return swal("Error", "El CIC no tiene el formato correcto", "error");
                }
            }

            var expreg = new RegExp("[A-Z]{6}[0-9]{8}[A-Z]{1}[0-9]{3}");
            if (!expreg.test(formularioComunidad.clv)) {
                return swal("Error", "La clave elector no tiene el formato correcto", "error");
            }

            var curp = $("#reg-c-sup-curp").val().toUpperCase();
            if (curpValida(curp)) { // ⬅️ Acá se comprueba

                if (!formularioComunidad.politicaP) {
                    return swal("Error", "No ha aceptado la Política de Privacidad", "error");
                }

                validar();
            } else {
                return swal("Error", "El curp ingresado no tiene el formato correcto", "error");
            }
        }).catch(fail => {
            console.error(fail);
        });
    }); // fin de suplente


    // propietario
    $("#reg-comunidad-pro").click(function () {

        // Datos personales
        formularioComunidad = {
            municipio: $("#reg-c-municipios").val(),
            comunidad: $("#reg-m-comunidad").val(),
            partidoP: $("#reg-c-partidos-politicos").val(),
            nombre: $("#reg-c-nombre").val(),
            apellidop: $("#reg-c-ap").val(),
            apellidom: $("#reg-c-pro-am").val(),
            fechaNacimiento: $("#reg-c-pro-fecn").val(),
            genero: $("#reg-c-pro-gen").val(),
            lugarNacimiento: $("#reg-c-pro-sitenac").val(),
            clv: $("#reg-c-pro-claveElector").val(),
            curp: $("#reg-c-pro-curp").val(),
            emailCom: $("#IemailComP").val(),

            //nuevos campos
            num_emision: $("#reg-c-pro-num_emision").val(),
            ocr: $("#reg-c-pro-ocr").val(),
            cic: $("#reg-c-pro-CIC").val(),
            seccion: $("#reg-c-pro-seccion").val(),
            //fin de los nuevos campos

            tiempoRes: $("#reg-c-pro-timeres").val(),
            sobrenombre: $("#reg-c-pro-sobrenombre").val(),
            propietario_suplente: "Propietario",
            partidoCandidatura: $("#reg-c-partidos-politicos option:selected").text(),


            //NUEVOS CAMPOS
            carta3D3: $("#doc-carta-3-cp").prop("checked"),
            cartaEleccion: 'NO APLICA',
            constAutOrganoPartidista: 'NO APLICA',
            manifestacionIndigena: 'NO APLICA',
            consVinculoComuni: 'NO APLICA',
            //FIN NUEVOS CAMPOS

            documentSNR: $("#pro-c-snr").prop("checked"),
            solicitudRC: $("#pro-c-regcan").prop("checked"),
            credencialINE: $("#pro-c-cred").prop("checked"),
            actaNacimentio: $("#pro-c-actnac").prop("checked"),
            copiaActa: 'NO APLICA',
            contanciaResidencia: $("#pro-c-radicacion").prop("checked"),
            contanciaPostulacion: $("#pro-c-aceptacion").prop("checked"),
            constanciaSeparacion: $('input[name=cProSeparacionCargo]:checked').val(),
            proInahbilitado: $("#pro-c-inhabilitado").prop("checked"),
            antecedentesNP: $("#pro-c-antpen").prop("checked"),
            documentManifestacion: $("#pro-c-me").prop("checked"),
            informeCE: $("#pro-c-ce").prop("checked"),
            cedulaIF: $("#pro-c-cp").prop("checked"),
            estado: "",
            capturista: $.buscarCookie("usuario"),
            politicaP: $("#cboPoliticaCP").prop("checked")
        }
        //marca error faltan cosas

        if ($("#reg-c-municipios").val() == "0") {
            return swal("Error", "Seleccione un Municipio", "error");
        }


        if ($("#reg-m-comunidad").val() == "0") {
            return swal("Error", "Seleccione una comunidad", "error");
        }


        if ($("#reg-c-partidos-politicos").val() == "") {
            return swal("Error", "Seleccione un partido político", "error");
        }


        validarCampos('registroPropietarioComunidad').then(exito => {

            if (formularioComunidad.cic !== '') {
                if (!validarCIC(formularioComunidad.cic)) {
                    return swal("Error", "El CIC no tiene el formato correcto", "error");
                }
            }

            var expreg = new RegExp("[A-Z]{6}[0-9]{8}[A-Z]{1}[0-9]{3}");
            if (!expreg.test(formularioComunidad.clv)) {
                return swal("Error", "La clave elector no tiene el formato correcto", "error");
            }

            var curp = $("#reg-c-pro-curp").val().toUpperCase();
            if (curpValida(curp)) { // ⬅️ Acá se comprueba

                if (!formularioComunidad.politicaP) {
                    return swal("Error", "No ha aceptado la Política de Privacidad", "error");
                }

                validar();
            } else {
                return swal("Error", "El curp ingresado no tiene el formato correcto", "error");
            }
        }).catch(fail => {
            console.error(fail);
        });;

    }); //fin de propietario

    function validar() {
        EstadoRegistro = documentacionValidacion(
            formularioComunidad.carta3D3,
            formularioComunidad.cartaEleccion,
            formularioComunidad.constAutOrganoPartidista,
            formularioComunidad.manifestacionIndigena,
            formularioComunidad.consVinculoComuni,

            formularioComunidad.documentSNR,
            formularioComunidad.solicitudRC,
            formularioComunidad.credencialINE,
            formularioComunidad.actaNacimentio,
            formularioComunidad.copiaActa,
            formularioComunidad.contanciaResidencia,
            formularioComunidad.contanciaPostulacion,
            formularioComunidad.constanciaSeparacion,
            formularioComunidad.proInahbilitado,
            formularioComunidad.antecedentesNP,
            formularioComunidad.documentManifestacion,
            formularioComunidad.informeCE,
            formularioComunidad.cedulaIF);
        // si la documentacion esta completa
        if (EstadoRegistro) {
            formularioComunidad.estado = "Completo";

            $('#modal-documentos').val("agregar-comunidad");
            $("#agregarModal").trigger('click');
        } else {

            var imprimir = "";
            for (var i = 0; i < documentosFaltantes.length; i++) {
                imprimir += "<br>" + documentosFaltantes[i];
                $(".listasFaltantes").html(imprimir);
            }
            $("#modalFaltantesG").modal("show");
            formularioComunidad.estado = "Incompleto";
            $('#modal-documentos').val("agregar-comunidad");
        }
    }


    $('#modalFaltantesG').on('hide.bs.modal', function (e) {
        $("#modal-documentos").val("");
    });

});


$("#agregarModal").click(function () {
    if ($('#modal-documentos').val() === "agregar-comunidad") {
        ({
            municipio,
            partidoP,
            comunidad,
            estado,
            clv,
            capturista,
            partidoCandidatura,
            constanciaSeparacion
        } = formularioComunidad)

        $.ajax({
            url: 'servicios/comunidad/agregarCanComunidad.php',
            type: "POST",
            data: formularioComunidad,

            success: function (respuesta) {

                var respuesta = JSON.parse(respuesta);
                //console.log(respuesta);
                if (respuesta.status) {

                    if (estado !== "Completo") {

                         if (partidoCandidatura == "Candidatura Independiente") {

                            if (constanciaSeparacion == "NO") {
                                 generarPDF(clv, 'plantillasComunidad/RComuDocFal', TE_COMUNIDAD);
                                 generarPDF(clv, "plantillasComunidad/RSCARGOPPC", TE_COMUNIDAD);

                             } else {

                                 generarPDF(clv, 'plantillasComunidad/RComuDocFal', TE_COMUNIDAD);
                             }

                         } else {

                             if (constanciaSeparacion == "NO") {
                                 documento = "plantillasComunidad/coppC";
                                 generarPDF(clv, documento, TE_COMUNIDAD);
                                 documento = "plantillasComunidad/RSCARGOPPC";
                                 generarPDF(clv, documento, TE_COMUNIDAD);
                             } else {
                                 documento = "plantillasComunidad/coppC";
                                 generarPDF(clv, documento, TE_COMUNIDAD);
                             }

                         }

                    } else {

                        generarCV(clv, capturista, 'plantillasComunidad/cvC', TE_COMUNIDAD);
                    }

                    $('#modalFaltantesG').modal('hide');
                    $("#registroPropietarioComunidad")[0].reset();
                    $("#boxComP").hide();
                    $("#IemailComP").hide();
                    $("#docPropietarioComunidad")[0].reset();

                    $("#registroSuplenteComunidad")[0].reset();
                    $("#boxComS").hide();
                    $("#IemailComS").hide();
                    $("#docSuplenteComunidad")[0].reset();


                    formularioComunidad = {};

                    swal({
                        title: "Se ha registrado con éxito",
                        text: 'Candidatura a presidencia de comunidad añadida',
                        icon: "success",
                        button: "Ok",
                    }).then((value) => {


                        var selected = $(':selected', $("#reg-c-partidos-politicos"));
                        candIndependiente = selected.parent().attr('value');

                        if (candIndependiente != '4') {
                            let data = {
                                'distrito': municipio,
                                comunidad,
                                'partido': partidoP,
                                'tipoCand': 5
                            }
                            //console.log(data);
                            sltPost('servicios/diputaciones/validarSexo.php', data).then((respuesta) => {
                                if (respuesta.status_code == 201) {
                                    $("#rpcContainer").addClass("d-none");
                                    $("#reg-comunidad01")[0].reset();
                                    return swal("Información", 'Ya se han registrado el propietario y suplente', 'info');

                                }
                                // console.log(respuesta);
                                esconderForm('rpcContainer', respuesta);

                            }).catch(console.error);
                        }


                    });

                } else {
                    swal("Error", respuesta.mensaje, "error");
                }
            },
            error: function () {
                console.error("No se ha podido obtener la información");
            }
        });
    }

});