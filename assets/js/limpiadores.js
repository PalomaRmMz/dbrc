 // esta funcion se encargara de limpiar los formularios durante la navegacion
 function limpiartodosFormularios() {

     // reportes
     $("#l_distrito_repo").html("Distrito <span class='tx-danger'>*</span>");
     $("#distrito_repo").attr("disabled", "disabled");
     $("#partido_repo").attr("disabled", "disabled");
     $("#partido_repo").html("<option value='Todos'>Todos</option>");

     $("#slt_report_municipio").addClass("d-none");
     $("#l_distrito_repo").html("Distrito <span class='tx-danger'>*</span>");


     $("#motivoRenuncia").val("");
     $("#busqueda-renuncia").val("");
     $(".infoc-cancelacion").hide();
     $("#registroPropietario")[0].reset();
     $("#docPropietario")[0].reset();
     $("#registroSuplente")[0].reset();
     $("#docSuplente")[0].reset();

     $("#reg-distritos").val("");
     $("#reg-tipoEleccion").val("");
     $("#reg-partidos-politicos").val("");
     $("#docSustitucion")[0].reset();
     $("#infoSustitucion")[0].reset();
     $("#new-motivo").val();
     $("#busqueda-sustituir").val();
     $(".infoc-sustitucion").hide();
     $("#busqueda-sustituir").val("");
     $("#docSustitucion").val("");
     $("#busqueda-subsanar").val("");
     $(".infoc-subsanacion").hide();
     $(".inforp-subsanacion").hide();
     $("#table_reportes").hide();
     $("#tipo_eleccion_repo").val("Todos");
     $("#distrito_repo").val("Todos");
     $("#partido_repo").val("Todos");
     $("#tipo_candidatura_repo").val("Todos");
     $("#estado_repo").val("Todos");
     $("#genero_repo").val("Todos");
 }

 let limpiarDocConsulta = () => {

     $("input[name=actaConsulta][value='NO APLICA']").prop('checked', true);
     $("input[name=consultaSep][value='NO APLICA']").prop('checked', true);

     $("#doc-1").prop('checked', false);
     $("#doc-2").prop('checked', false);
     $("#doc-5").prop('checked', false);
     $("#doc-3").prop('checked', false);
     $("#doc-6").prop('checked', false);
     $("#doc-4").prop('checked', false);
     $("#doc-8").prop('checked', false);
     $("#doc-9").prop('checked', false);
     $("#doc-10").prop('checked', false);
     $("#doc-11").prop('checked', false);
     $("#doc-12").prop('checked', false);
 }