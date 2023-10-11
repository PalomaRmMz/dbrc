$(document).ready(function() {

    var regitrosInfoBusqueda;

    $(".form-search").submit(function() {

        /* limpiartodosFormularios();
        limpiarDocConsulta(); */

        let search = $("#busqueda").val();
    

        $.printInfoSearch(search);

        return false
    });


    //Mostrar informacion segun la busqueda
    $.printInfoSearch = function(search) {
        $.ajax({
            url: "servicios/consultaRegistro/obtenerInfoBusqueda.php",
            type: "POST",
            data: { "search": search }
        }).done(function(respuesta) {


            try {

                var respuesta = JSON.parse(respuesta);
                regitrosInfoBusqueda = respuesta;
                if (respuesta[0].datos == 0) {
                    console.error("No se pudo conectar a la base de datos");

                } else if (respuesta[0].datos == 1) {
                    console.error("No se encontro al candidato en la base de datos")
                    swal("ERROR", "Clave de elector inválida", "warning")

                } else if (respuesta[0].datos == 2) {

                    llenarBusquedaRegistro(respuesta[0]);

                } else if (respuesta[0].datos == 4) {

                    contenido = "<option value=''>Selecciona una opción</option>";
                    respuesta.map((item, index) => {
                        if (index === 0) return;
                        contenido += `<option value="${item.id_reg}">${item.candidatura}</option>`;
                    });

                    $("#seleccionar-dosclaves").removeClass("d-none");
                    $("#search-tipo-sub").html(contenido);
                    $("#dosclavesSubsanacion").modal('show');

                } else {
                    console.error("Algo salio mal");
                }

            } catch (e) {
                console.error(respuesta)
                console.error(e);
            }




        }).fail(function() {
            console.error("No se pudo obtener los datos del usuario");
        })
    }


    function llenarBusquedaRegistro(respuesta) {
        console.log(respuesta);
        $("#cand_prop").text(respuesta.candidatura);
        $("#cand_nombre").text(respuesta.nombre);
        $("#cand_ap_paterno").text(respuesta.apellido_paterno);
        $("#cand_ap_materno").text(respuesta.apellido_materno);
        $("#cand_distrito").text(respuesta.distrito);
        $("#cand_partido_politico").text(respuesta.partido_politico);
        $("#cand_estado").text(respuesta.estado);
        $("#cand_curp").text(respuesta.curp);
        $("#tip_candidatura").text(respuesta.propietario_suplente);
        $("#cand_clave_elector").text(respuesta.clave_elector);
        $('#modal-candidatura').modal('show');
        $('#busqueda').val('');

        if (respuesta.id_candidatura == TE_GUBERNATURA || respuesta.id_candidatura == TE_MUNICIPAL || respuesta.id_candidatura == TE_COMUNIDAD || respuesta.id_candidatura == TE_SINDICATURA) {
            $(".cand_distrito,.tip_candidatura").hide();

        } else if (respuesta.id_candidatura == TE_REPRESENTACION_PROPORCIONAL || respuesta.id_candidatura == TE_MAYORIA_RELATIVA) {

            $(".cand_distrito,.tip_candidatura").show();
        } else if (respuesta.id_candidatura == TE_REGIDURIA) {
            $(".cand_distrito").hide();
        }

        //para buscar documentos
        $.printDocs(respuesta.clave_elector, respuesta.idDocumento);
        $.printHistory(respuesta.clave_elector, respuesta.id_candidatura);
        $.printInfoUser(respuesta.clave_elector, respuesta.id_candidatura);
    }

    //Imprimir documentos para subsanacion
    $.printDocs = function(clave_elector, idDocumento) {
        $.ajax({
            url: "servicios/consultaRegistro/printdocs.php",
            type: "POST",
            data: { "search": clave_elector, "id_documento": idDocumento }
        }).done(function(respuesta) {

            var respuesta = JSON.parse(respuesta);


            if (respuesta[0].datos == 0) {
                console.error("No se pudo conecta a la base de datos");
            } else if (respuesta[0].datos == 2) {

                $("input[name=actaConsulta][value='" + respuesta[0].COPIA + "']").prop('checked', true);
                $("input[name=consultaSep][value='" + respuesta[0].SEPARACION + "']").prop('checked', true);

                $("#doc-1").prop('checked', respuesta[0].SNR);
                $("#doc-2").prop('checked', respuesta[0].REG);
                $("#doc-3").prop('checked', respuesta[0].ACT);
                $("#doc-4").prop('checked', respuesta[0].ACEPTACION);
                $("#doc-5").prop('checked', respuesta[0].CRED);
                $("#doc-6").prop('checked', respuesta[0].RESIDENCIA);
                $("#doc-8").prop('checked', respuesta[0].ESCRITO);
                $("#doc-9").prop('checked', respuesta[0].NP);
                $("#doc-10").prop('checked', respuesta[0].MANIFIESTO);
                $("#doc-11").prop('checked', respuesta[0].CAPACIDAD);
                $("#doc-12").prop('checked', respuesta[0].RFC);


                $("#doc-carta-3-info").prop('checked', respuesta[0].CARTA3);
                $("input[name=cartaEleccion-info][value='" + respuesta[0].CARTA_REELECCION + "']").prop('checked', true);
                $("input[name=constAutOrganoPartidista-info][value='" + respuesta[0].CONST_AUTORIZACION + "']").prop('checked', true);
                $("input[name=manifestacionIndigena-info][value='" + respuesta[0].MANIFES_AUTOADCRIPCION + "']").prop('checked', true);
                $("input[name=consVinculoComuni-info][value='" + respuesta[0].CONSTANCIA_VINCULO + "']").prop('checked', true);
            }
        }).fail(function() {
            console.error("No hace nada");
        });
    }


    $.printHistory = function(clave_elector, id_candidatura) {
        $.ajax({
            url: "servicios/consultaRegistro/obtenerHistory.php",
            type: "POST",
            data: { "clave_elector": clave_elector, "id_candidatura": id_candidatura }
        }).done(function(respuesta) {
            var respuesta = JSON.parse(respuesta);
            if (respuesta.datos == 0) {
                console.error("No se pudo conectar a la base de datos")
            } else if (respuesta.datos == 1) {
                console.error("No se encontro al candidato en la base de datos")
            } else {
                var fila = "";
                for (var i = 0; i < respuesta.length; i++) {
                    fila += "<div class='fecha-actividad'> <span>" + respuesta[i].dia + "</span> </div> <div class='card-body'> <div class='actividad-descripcion'><h5>" + respuesta[i].usuario + " <span> " + respuesta[i].hora + "</span></h5><h6 class='text-muted'>" + respuesta[i].tipo + "</h6></div></div>";
                }
            }
            $("#actividad-box").html(fila);
        }).fail(function() {
            console.error("No se pudo obtener los datos del usuario");
        })
    }

    $.printInfoUser = function(search, idTipoEleccion) {

        $.ajax({
            url: "servicios/obtenerInfoUsuario.php",
            type: "POST",
            data: { "search": search, "idTipoEleccion": idTipoEleccion }
        }).done(function(respuesta) {
            var respuesta = JSON.parse(respuesta);

            if (respuesta.datos == 0) {
                console.error("No se pudo conectar a la base de datos")
            } else if (respuesta.datos == 1) {
                console.error("No se encontro al candidato en la base de datos")
                swal("ERROR", "Clave de elector invalida", "warning")
            } else if (respuesta.datos == 2) {

                $(".name-captura").text(respuesta.usuario);
                $(".type-captura").text(respuesta.tipo);
                $(".date-sub").text(respuesta.dia);
            }
        }).fail(function() {
            console.error("No se pudo obtener los datos del usuario");
        })
    }

    $("#seleccionar-dosclaves").on("click", function() {

        $("#seleccionar-dosclaves").addClass("d-none");
        let clave_elector = $("#busqueda").val();
        let id_slt = $("#search-tipo-sub").val();
        if (id_slt == "") {
            swal("Alto", "Tienes que seleccionar un tipo de elección", "warning");
        } else {
            $("#dosclavesSubsanacion").modal('hide');
            registro = regitrosInfoBusqueda.filter(item => item.id_reg == id_slt);
            llenarBusquedaRegistro(registro[0]);
        }
    });
});