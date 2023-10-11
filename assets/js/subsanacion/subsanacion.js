//OnClick dal botón "Buscar"
var infoSubsanacion = {};
$("#search_subsanacion").click(function () {
  let clave_elector = $("#busqueda-subsanar").val();
  limpiarModalsubsanacion();
  $.printInfoCandidato(clave_elector);

  return false;
});

//Mostrar información de candidato
$.printInfoCandidato = function (clave_elector) {
  var expreg = new RegExp("[A-Z]{6}[0-9]{8}[A-Z]{1}[0-9]{3}");
  if (clave_elector == "") {
    return swal("Error", "Ingrese una clave de elector", "error");
  }

  if (!expreg.test(clave_elector)) {
    return swal(
      "Error",
      "La clave elector no tiene el formato correcto",
      "error"
    );
  }

  $.ajax({
    url: "servicios/subsanacion/obtenerInfoSubsanacion.php",
    type: "POST",
    data: { clave_elector: clave_elector },
  })
    .done(function (respuesta) {
      console.log(respuesta);
      try {
        var respuesta = JSON.parse(respuesta);
        if (respuesta.status_code == 404) {
          console.error(respuesta.mensaje);
        } else {
          if (respuesta[0].status_code == 0) {
            swal("ALERTA", "No se encontro al candidato", "warning");
            console.error("No se encontro al candidato en la base de datos");
            resetInputs();
          } else if (respuesta[0].status_code == 1) {
            registrosSubsanacion = respuesta;
            $("#modal-subsanacion").val(clave_elector);

            contenido = "<option value=''>Selecciona una opción</option>";

            respuesta.map((item, index) => {
              if (index == 0) return;
              contenido += `<option value="${item.id_candidatura}">${item.candidatura}</option>`;
            });

            $("#search-tipo-sub").html(contenido);
            $("#subsanacionDosclaves").removeClass("d-none");
            $("#dosclavesSubsanacion").modal("show");
          } else if (respuesta[0].datos == 2) {
            llenarSubsanacion(respuesta);
          }
        }
      } catch (e) {
        console.error(respuesta);
        console.error(e);
      }
    })
    .fail(function () {
      console.error("No se pudo obtener los datos del usuario");
      swal("ALERTA", "No se pudo obtener los datos del usuario", "warning");
    });
};

// llena la informacion de la candidatura en subsanacion
function llenarSubsanacion(respuesta) {
  // agregar los campos en la consulta
  infoSubsanacion.id_distrito = respuesta[0].id_distrito;
  infoSubsanacion.id_municipio = respuesta[0].id_municipio;
  infoSubsanacion.id_comunidad = respuesta[0].id_comunidad;
  infoSubsanacion.id_partido = respuesta[0].id_partido;
  infoSubsanacion.propietario_suplente = respuesta[0].propietario_suplente;

  $("#candidato_nombre-rp").val(respuesta[0].nombre);
  $("#candidato_ap_paterno-rp").val(respuesta[0].apellido_paterno);
  $("#candidato_ap_materno-rp").val(respuesta[0].apellido_materno);
  $(".subsanacionTipoCandidatura").text(respuesta[0].candidatura);
  $("#sub-pp-rp").text(respuesta[0].partido_politico);
  $("#candidato_fec_nacimiento-rp").val(respuesta[0].fec_nacimiento);
  $("#candidato_genero-rp").val(respuesta[0].genero);
  $("#candidato_genero-rp").prop("disabled", "disabled");
  $("#candidato_clave_elector-rp").val(respuesta[0].clave_elector);
  $("#candidato_curp-rp").val(respuesta[0].curp);
  // nuevos cambios
  $("#candidato_num_emision-rp").val(respuesta[0].num_emision);
  $("#candidato_ocr-rp").val(respuesta[0].ocr);
  $("#candidato_cic-rp").val(respuesta[0].cic);
  $("#candidato_seccion-rp").val(respuesta[0].seccion);
  // fin nuevos cambios
  $("#candidato_tiempo_residencia-rp").val(respuesta[0].tiempo_residencia);
  $("#candidato_sobrenombre-rp").val(respuesta[0].sobrenombre);
  $("#sub-tc-rp ").text(respuesta[0].propietario_suplente);
  $("#emailrp").val(respuesta[0].email);

  if (respuesta[0].genero == "MASCULINO") {
    $(".email_rp").hide();
    $("#emailrp").hide();
  }

  if (respuesta[0].candidatura == "REPRESENTACION PROPORCIONAL") {
    // MR
    $(".candidato_distrito-rp").hide();
    // RP
    $(".prelacion,.sub-tc-rp").show();
    $("#prelacion").val(respuesta[0].prelacion);
    $("#sub-tc-rp ").text(respuesta[0].propietario_suplente);
  } else if (
    respuesta[0].candidatura == "GUBERNATURA" ||
    respuesta[0].candidatura == "COMUNIDAD"
  ) {
    $(".candidato_distrito-rp,.prelacion").hide();
  } else if (respuesta[0].candidatura == "MUNICIPAL") {
    $(".candidato_distrito-rp,.prelacion").hide();
    $(".sub-tc-rp").show();
    $("#sub-tc-rp ").text(respuesta[0].propietario_suplente);
  } else if (
    respuesta[0].id_candidatura == TE_SINDICATURA ||
    respuesta[0].id_candidatura == TE_REGIDURIA
  ) {
    $(".candidato_distrito-rp").hide();
    $(".prelacion").hide();
  } else {
    $(".candidato_distrito-rp").show();
    $("#candidato_distrito-rp").text(respuesta[0].distrito);
    // RP
    $(".prelacion,.sub-tc-rp").hide();
  }

  $.printSubDocs(respuesta[0].clave_elector, respuesta[0].id_documento);
  $.printInfoUserSub(respuesta[0].clave_elector, respuesta[0].id_candidatura);

  $("#id_reg").val(respuesta[0].id_reg);
  $("#id_doc").val(respuesta[0].id_documento);
  $("#id_tipo_candidatura").val(respuesta[0].id_candidatura);
  $(".inforp-subsanacion").show();
} // END llenarSubsanacion

$.printInfoCandidatoSubDoble = function (clave_elector, id_registro) {
  respuesta = registrosSubsanacion.filter(
    (item) =>
      item.id_candidatura == id_registro && item.clave_elector == clave_elector
  );
  llenarSubsanacion(respuesta);
};

$("#subsanacionDosclaves").on("click", function () {
  let clave_elector = $("#busqueda-subsanar").val();
  clave_elector = clave_elector.toUpperCase();
  let id_registro = $("#search-tipo-sub").val();

  if (id_registro == "") {
    swal("Alto", "Tienes que seleccionar un tipo de elección", "warning");
  } else {
    $("#subsanacionDosclaves").addClass("d-none");
    $("#dosclavesSubsanacion").modal("hide");

    limpiarModalsubsanacion();
    $.printInfoCandidatoSubDoble(clave_elector, id_registro);
  }
});

$.printInfoUserSub = function (clave_elector, idTipoEleccion) {
  $.ajax({
    url: "servicios/obtenerInfoUsuario.php",
    type: "POST",
    data: { search: clave_elector, idTipoEleccion: idTipoEleccion },
  })
    .done(function (respuesta) {
      try {
        var respuesta = JSON.parse(respuesta);
        if (respuesta.datos == 0) {
          console.error("No se pudo conectar a la base de datos");
        } else if (respuesta.datos == 1) {
          console.error("No se encontro al candidato en la base de datos");
          swal("ERROR", "Clave de elector invalida", "warning");
        } else if (respuesta.datos == 2) {
          $(".subsanacionPM").html(respuesta.usuario);
          $(".subsanacionUM").text(respuesta.dia);
        }
      } catch (e) {
        console.error(e);
        console.error(respuesta);
      }
    })
    .fail(function () {
      console.error("No se pudo obtener los datos del usuario");
    });
};

$(".btn-subsanaciondocs").on("click", function () {
  $("#modal-docs").modal("show");
  // se guarda la configuracion que se obtiene de la base de datos

  //nuevo campos de ultima hora
  carta3D3_a = $("#doc-carta-3").prop("checked");
  //cartaEleccion_a = $('input[name=cartaEleccion]:checked').val();
  //constAutOrganoPartidista_a = $('input[name=constAutOrganoPartidista]:checked').val();
  //manifestacionIndigena_a = $('input[name=manifestacionIndigena]:checked').val();
  //consVinculoComuni_a = $('input[name=consVinculoComuni]:checked').val();

  //fin nuevos campos de ultima hora
  subSNR_a = $("#doc-snr-modal").prop("checked");
  subREG_a = $("#doc-regcan-modal").prop("checked");
  subCRED_a = $("#doc-cred-modal").prop("checked");
  subACTA_a = $("#doc-actnac-modal").prop("checked");
  subCOPIA_a = $("input[name=actaSubsanacion]:checked").val();
  subCONSTANCIA_a = $("#doc-radicacion-modal").prop("checked");
  subACEPTACION_a = $("#doc-aceptacion-modal").prop("checked");
  subSEPARACION_a = $("input[name=subsanacionSep]:checked").val();
  subESCRITO_a = $("#doc-inhabilitado-modal").prop("checked");
  subCARTA_a = $("#doc-antpen-modal").prop("checked");
  subMANIFESTACION_a = $("#doc-me-modal").prop("checked");
  subCAPACIDAD_a = $("#doc-ce-modal").prop("checked");
  subCEDULA_a = $("#doc-rfc-modal").prop("checked");
});

//Imprimir documentos para subsanacion
$.printSubDocs = function (clave_elector, id_documento) {
  $.ajax({
    url: "servicios/consultaRegistro/printdocs.php",
    type: "POST",
    data: { search: clave_elector, id_documento: id_documento },
  })
    .done(function (respuesta) {
      var respuesta = JSON.parse(respuesta);

      if (respuesta[0].datos == 0) {
        console.error("No se pudo conecta a la base de datos");
      } else if (respuesta[0].datos == 2) {
        $(
          "input[name=actaSubsanacion][value='" + respuesta[0].COPIA + "']"
        ).prop("checked", true);
        $(
          "input[name=subsanacionSep][value='" + respuesta[0].SEPARACION + "']"
        ).prop("checked", true);

        $("#doc-snr-modal").prop("checked", respuesta[0].SNR);
        $("#doc-regcan-modal").prop("checked", respuesta[0].REG);
        $("#doc-cred-modal").prop("checked", respuesta[0].CRED);
        $("#doc-actnac-modal").prop("checked", respuesta[0].ACT);
        $("#doc-radicacion-modal").prop("checked", respuesta[0].RESIDENCIA);
        $("#doc-aceptacion-modal").prop("checked", respuesta[0].ACEPTACION);
        $("#doc-inhabilitado-modal").prop("checked", respuesta[0].ESCRITO);
        $("#doc-antpen-modal").prop("checked", respuesta[0].NP);
        $("#doc-me-modal").prop("checked", respuesta[0].MANIFIESTO);
        $("#doc-ce-modal").prop("checked", respuesta[0].CAPACIDAD);
        $("#doc-rfc-modal").prop("checked", respuesta[0].RFC);

        $("#doc-carta-3-modal").prop("checked", respuesta[0].CARTA3);
        // $("input[name=cartaEleccion-modal][value='" + respuesta[0].CARTA_REELECCION + "']").prop('checked', true);
        // $("input[name=constAutOrganoPartidista-modal][value='" + respuesta[0].CONST_AUTORIZACION + "']").prop('checked', true);
        // $("input[name=manifestacionIndigena-modal][value='" + respuesta[0].MANIFES_AUTOADCRIPCION + "']").prop('checked', true);
        // $("input[name=consVinculoComuni-modal][value='" + respuesta[0].CONSTANCIA_VINCULO + "']").prop('checked', true);
      }
    })
    .fail(function () {
      console.error("No hace nada");
    });
};

$(".btn-update-modal").click(function () {
  /* Subsanacion */

  infoSubsanacion.candidato_pp = $("#sub-pp-rp").html();
  infoSubsanacion.candidato_nombre_rp = $("#candidato_nombre-rp").val();
  infoSubsanacion.candidato_ap_paterno_rp = $("#candidato_ap_paterno-rp").val();
  infoSubsanacion.candidato_ap_materno_rp = $("#candidato_ap_materno-rp").val();
  infoSubsanacion.candidato_fec_nacimiento_rp = $(
    "#candidato_fec_nacimiento-rp"
  ).val();
  infoSubsanacion.candidato_genero_rp = $("#candidato_genero-rp").val();
  infoSubsanacion.candidato_clave_elector_rp = $(
    "#candidato_clave_elector-rp"
  ).val();
  infoSubsanacion.candidato_curp_rp = $("#candidato_curp-rp").val();

  infoSubsanacion.candidato_num_emision_rp = $(
    "#candidato_num_emision-rp"
  ).val();
  infoSubsanacion.candidato_ocr_rp = $("#candidato_ocr-rp").val();
  infoSubsanacion.candidato_cic_rp = $("#candidato_cic-rp").val();
  infoSubsanacion.candidato_seccion_rp = $("#candidato_seccion-rp").val();

  infoSubsanacion.candidato_tiempo_residencia_rp = $(
    "#candidato_tiempo_residencia-rp"
  ).val();
  infoSubsanacion.candidato_sobrenombre_rp = $(
    "#candidato_sobrenombre-rp"
  ).val();
  infoSubsanacion.subEstado = subEstado;
  infoSubsanacion.usuarioActual = $.buscarCookie("usuario");
  infoSubsanacion.tipoAccion = "Subsanacion";
  infoSubsanacion.claveOriginal = $("#busqueda-subsanar").val();
  infoSubsanacion.claveNuevo = "";
  infoSubsanacion.motivoRenuncia = "";
  infoSubsanacion.candidato_partidopolitico = $("#sub-pp-rp").html();
  infoSubsanacion.candidato_preprelacion = $("#prelacion").val();
  infoSubsanacion.candidato_prosup = $("#sub-tc-rp").html();
  infoSubsanacion.subTipoCandidatura = $(".subsanacionTipoCandidatura").html();

  //NUEVOS CAMPOS ULTIMA HORA
  infoSubsanacion.carta3D3 = $("#doc-carta-3-modal").prop("checked");
  infoSubsanacion.cartaEleccion = "NO APLICA";
  infoSubsanacion.constAutOrganoPartidista = "NO APLICA";
  infoSubsanacion.manifestacionIndigena = "NO APLICA";
  infoSubsanacion.consVinculoComuni = "NO APLICA";
  //FIN NUEVOS CAMPOS ULTIMA HORA

  infoSubsanacion.subSNR = $("#doc-snr-modal").prop("checked");
  infoSubsanacion.subREG = $("#doc-regcan-modal").prop("checked");
  infoSubsanacion.subCRED = $("#doc-cred-modal").prop("checked");
  infoSubsanacion.subACTA = $("#doc-actnac-modal").prop("checked");
  infoSubsanacion.subCOPIA = "NO APLICA";
  infoSubsanacion.subCONSTANCIA = $("#doc-radicacion-modal").prop("checked");
  infoSubsanacion.subACEPTACION = $("#doc-aceptacion-modal").prop("checked");
  infoSubsanacion.subSEPARACION = $("input[name=subsanacionSep]:checked").val();
  infoSubsanacion.subESCRITO = $("#doc-inhabilitado-modal").prop("checked");
  infoSubsanacion.subCARTA = $("#doc-antpen-modal").prop("checked");
  infoSubsanacion.subMANIFESTACION = $("#doc-me-modal").prop("checked");
  infoSubsanacion.subCAPACIDAD = $("#doc-ce-modal").prop("checked");
  infoSubsanacion.subCEDULA = $("#doc-rfc-modal").prop("checked");
  infoSubsanacion.idReg = $("#id_reg").val();
  infoSubsanacion.idDoc = $("#id_doc").val();
  infoSubsanacion.idTipoCandidatura = $("#id_tipo_candidatura").val();
  infoSubsanacion.email = $("#emailrp").val();

  variable = documentacionValidacion(
    infoSubsanacion.carta3D3,
    infoSubsanacion.cartaEleccion,
    infoSubsanacion.constAutOrganoPartidista,
    infoSubsanacion.manifestacionIndigena,
    infoSubsanacion.consVinculoComuni,
    infoSubsanacion.subSNR,
    infoSubsanacion.subREG,
    infoSubsanacion.subCRED,
    infoSubsanacion.subACTA,
    infoSubsanacion.subCOPIA,
    infoSubsanacion.subCONSTANCIA,
    infoSubsanacion.subACEPTACION,
    infoSubsanacion.subSEPARACION,
    infoSubsanacion.subESCRITO,
    infoSubsanacion.subCARTA,
    infoSubsanacion.subMANIFESTACION,
    infoSubsanacion.subCAPACIDAD,
    infoSubsanacion.subCEDULA
  );

  documentacionCambios(
    infoSubsanacion.carta3D3_a,
    infoSubsanacion.cartaEleccion_a,
    infoSubsanacion.constAutOrganoPartidista_a,
    infoSubsanacion.manifestacionIndigena_a,
    infoSubsanacion.consVinculoComuni_a,
    infoSubsanacion.subSNR_a,
    infoSubsanacion.subREG_a,
    infoSubsanacion.subCRED_a,
    infoSubsanacion.subACTA_a,
    infoSubsanacion.subCOPIA_a,
    infoSubsanacion.subCONSTANCIA_a,
    infoSubsanacion.subACEPTACION_a,
    infoSubsanacion.subSEPARACION_a,
    infoSubsanacion.subESCRITO_a,
    infoSubsanacion.subCARTA_a,
    infoSubsanacion.subMANIFESTACION_a,
    infoSubsanacion.subCAPACIDAD_a,
    infoSubsanacion.subCEDULA_a,
    //Nuevas
    infoSubsanacion.carta3D3,
    infoSubsanacion.cartaEleccion,
    infoSubsanacion.constAutOrganoPartidista,
    infoSubsanacion.manifestacionIndigena,
    infoSubsanacion.consVinculoComuni,

    infoSubsanacion.subSNR,
    infoSubsanacion.subREG,
    infoSubsanacion.subCRED,
    infoSubsanacion.subACTA,
    infoSubsanacion.subCOPIA,
    infoSubsanacion.subCONSTANCIA,
    infoSubsanacion.subACEPTACION,
    infoSubsanacion.subSEPARACION,
    infoSubsanacion.subESCRITO,
    infoSubsanacion.subCARTA,
    infoSubsanacion.subMANIFESTACION,
    infoSubsanacion.subCAPACIDAD,
    infoSubsanacion.subCEDULA
  );
  infoSubsanacion.subEstado = variable ? "Completo" : "Incompleto";

  ({ idTipoCandidatura } = infoSubsanacion);

  if (idTipoCandidatura == TE_MAYORIA_RELATIVA) {
    $.actualizarInfoCandidato(infoSubsanacion);
  } else if (idTipoCandidatura == TE_REPRESENTACION_PROPORCIONAL) {
    if (infoSubsanacion.candidato_prelacion == "") {
      swal("Error", "Selecciona un numero de prelación válido", "warning");
    } else {
      $.actualizarPrelacion(infoSubsanacion);
    }
  } else if (idTipoCandidatura == TE_GUBERNATURA) {
    $.actualizarInfoGobernador(infoSubsanacion);
  } else if (
    idTipoCandidatura == TE_MUNICIPAL ||
    idTipoCandidatura == TE_SINDICATURA ||
    idTipoCandidatura == TE_REGIDURIA
  ) {
    let url = "servicios/subsanacion/subsanarMunicipio.php";
    let dataSubsanacion = infoSubsanacion;
    let documents = {
      docFaltantesCIndp: "plantillasMunicipal/RMuniDocFal",
      docRenuncia: "plantillasMunicipal/RSCARGOPPM",
      docFaltantesPP: "plantillasMunicipal/coppM",
      allDocument: "plantillasMunicipal/cvM",
    };
    postSubsanacion(url, dataSubsanacion, documents);
  } else if (idTipoCandidatura == TE_COMUNIDAD) {
    $.actualizarInfoComunidad(infoSubsanacion);
  }

  return false;
});

function postSubsanacion(url, dataSubsanacion, documents) {
  ({
    subEstado,
    candidato_clave_elector_rp,
    usuarioActual,
    idTipoCandidatura,
    subSEPARACION,
    candidato_pp,
  } = dataSubsanacion);

  ({ docFaltantesCIndp, docRenuncia, docFaltantesPP, allDocument } = documents);

  var tipo_can = $("#id-new-type").val();

  $.ajax({
    url: url,
    type: "POST",
    data: dataSubsanacion,
  })
    .done(function (respuesta) {
      try {
        var respuesta = JSON.parse(respuesta);
        if (respuesta.status_code == 404) {
          swal("ERROR", respuesta.mensaje, "warning");
        } else if (respuesta.status_code == 200) {
          if (subEstado !== "Completo") {
            if (candidato_pp == "Candidatura Independiente") {
              if (subSEPARACION == "NO") {
                generarPDF(
                  candidato_clave_elector_rp,
                  docFaltantesCIndp,
                  idTipoCandidatura
                );
                generarPDF(
                  candidato_clave_elector_rp,
                  docRenuncia,
                  idTipoCandidatura
                );
              } else {
                generarPDF(
                  candidato_clave_elector_rp,
                  docFaltantesCIndp,
                  idTipoCandidatura
                );
              }
            } else {
              if (subSEPARACION == "NO") {
                generarPDF(
                  candidato_clave_elector_rp,
                  docFaltantesPP,
                  idTipoCandidatura
                );
                generarPDF(
                  candidato_clave_elector_rp,
                  docRenuncia,
                  idTipoCandidatura
                );
              } else {
                generarPDF(
                  candidato_clave_elector_rp,
                  docFaltantesPP,
                  idTipoCandidatura
                );
              }
            }
          } else {
            generarCV(
              candidato_clave_elector_rp,
              usuarioActual,
              allDocument,
              idTipoCandidatura
            );
          }

          swal("Éxito", "Registro actualizado", "success");
          $("#modal-docs").modal("hide");
          resetInputs();
          limpiarModalsubsanacion();
          $("#busqueda-subsanar").val("");
        }
      } catch (e) {
        console.error(respuesta);
        console.error(e);
      }
    })
    .fail(function () {
      swal("Éxito", "No se realizo ningun cambio", "success");
      resetInputs();
      $(".infoc-subsanacion").show();
    });
}

$.actualizarInfoComunidad = function (infoSubsanacion) {
  ({
    candidato_clave_elector_rp,
    usuarioActual,
    subEstado,
    candidato_pp,
    idTipoCandidatura,
    subSEPARACION,
  } = infoSubsanacion);

  $.ajax({
    url: "servicios/subsanacion/subsanarComunidad.php",
    type: "POST",
    data: infoSubsanacion,
  })
    .done(function (respuesta) {
      try {
        var respuesta = JSON.parse(respuesta);
        if (respuesta.datos == 0) {
          swal(
            "ERROR",
            "No se pudo conectar a la base de datos de candidatos",
            "warning"
          );
          resetInputs();
        } else if (respuesta.datos == 1) {
          if (cambios.length > 0) {
            //////PDF
            if (subEstado == "Completo") {
              documento = "plantillasComunidad/cvC";
              generarCV(
                candidato_clave_elector_rp,
                usuarioActual,
                documento,
                idTipoCandidatura
              );
            } else if (subEstado == "Incompleto") {
              if (candidato_pp == "Candidatura Independiente") {
                if (subSEPARACION == "NO") {
                  documento = "plantillasComunidad/RComuDocFal";
                  generarPDF(
                    candidato_clave_elector_rp,
                    documento,
                    idTipoCandidatura
                  );
                  documento = "plantillasComunidad/RSCARGOPPC";
                  generarPDF(
                    candidato_clave_elector_rp,
                    documento,
                    idTipoCandidatura
                  );
                } else {
                  documento = "plantillasComunidad/RComuDocFal";
                  generarPDF(
                    candidato_clave_elector_rp,
                    documento,
                    idTipoCandidatura
                  );
                }
              } else {
                if (subSEPARACION == "NO") {
                  documento = "plantillasComunidad/coppC";
                  generarPDF(
                    candidato_clave_elector_rp,
                    documento,
                    idTipoCandidatura
                  );

                  documento = "plantillasComunidad/RSCARGOPPC";
                  generarPDF(
                    candidato_clave_elector_rp,
                    documento,
                    idTipoCandidatura
                  );
                } else {
                  documento = "plantillasComunidad/coppC";
                  generarPDF(
                    candidato_clave_elector_rp,
                    documento,
                    idTipoCandidatura
                  );
                }
              }
            } else {
              console.error("Ocurrio un error");
            }
          } else {
            console.error("NO: " + cambios.length + "");
          }

          swal("Éxito", "Registro actualizado", "success");
          $("#modal-docs").modal("hide");
          resetInputs();
          limpiarModalsubsanacion();
          $("#busqueda-subsanar").val("");
        }
      } catch (e) {
        console.error(respuesta);
        console.error(e);
      }
    })
    .fail(function () {
      console.error("No se realizo ningun cambio");
      swal("Éxito", "No se realizo ningun cambio", "success");
      resetInputs();
      $(".infoc-subsanacion").show();
    });
};

$.actualizarInfoGobernador = function (actualizarInfoGobernador) {
  ({
    candidato_clave_elector_rp,
    usuarioActual,
    subEstado,
    idTipoCandidatura,
    subSEPARACION,
    candidato_pp,
  } = infoSubsanacion);

  $.ajax({
    url: "servicios/subsanacion/subsanarGubernatura.php",
    type: "POST",
    data: actualizarInfoGobernador,
  })
    .done(function (respuesta) {
      try {
        var respuesta = JSON.parse(respuesta);
        if (respuesta.datos == 0) {
          swal(
            "ERROR",
            "No se pudo conectar a la base de datos de candidatos",
            "warning"
          );
          resetInputs();
        } else if (respuesta.datos == 1) {
          if (cambios.length > 0) {
            //////PDF
            if (subEstado == "Completo") {
              documento = "plantillasGobernatura/cvRegGob";
              generarCV(
                candidato_clave_elector_rp,
                usuarioActual,
                documento,
                idTipoCandidatura
              );
            } else if (subEstado == "Incompleto") {
              if (candidato_pp == "Candidatura Independiente") {
                if (subSEPARACION == "NO") {
                  // documento = "plantillasGobernatura/RGobDocFal";
                  // generarPDF(candidato_clave_elector_rp, documento, idTipoCandidatura);
                  // documento = "plantillasGobernatura/RSCARGOG";
                  //generarPDF(candidato_clave_elector_rp, documento, idTipoCandidatura);
                } else {
                  // documento = "plantillasGobernatura/RGobDocFal";
                  // generarPDF(candidato_clave_elector_rp, documento, idTipoCandidatura);
                }
              } else {
                if (subSEPARACION == "NO") {
                  //documento = "plantillasGobernatura/RGobDocFal";
                  //  generarPDF(candidato_clave_elector_rp, documento, idTipoCandidatura);
                  // documento = "plantillasGobernatura/RSCARGOG";
                  //generarPDF(candidato_clave_elector_rp, documento, idTipoCandidatura);
                } else {
                  //documento = "plantillasGobernatura/RGobDocFal";
                  //generarPDF(candidato_clave_elector_rp, documento, idTipoCandidatura);
                }
              }
            } else {
              console.error("Ocurrio un error");
            }
          } else {
            console.error("NO: " + cambios.length + "");
          }
          swal("Éxito", "Registro actualizado", "success");
          $("#modal-docs").modal("hide");
          resetInputs();
          limpiarModalsubsanacion();
          $("#busqueda-subsanar").val("");
        }
      } catch (e) {
        console.error(actualizarInfoGobernador);
        console.error(e);
      }
    })
    .fail(function () {
      console.error("No se realizo ningun cambio");
      swal("Éxito", "No se realizo ningun cambio", "success");
      resetInputs();
      $(".infoc-subsanacion").show();
    });
};

//Actualizar información de candidato
$.actualizarInfoCandidato = function (infoSubsanacion) {
  ({
    candidato_clave_elector_rp,
    usuarioActual,
    subEstado,
    candidato_pp,
    idTipoCandidatura,
    subSEPARACION,
  } = infoSubsanacion);

  $.ajax({
    url: "servicios/subsanacion/modificarCandidatoSubsanacion.php",
    type: "POST",
    data: infoSubsanacion,
  })
    .done(function (respuesta) {
      try {
        var respuesta = JSON.parse(respuesta);
        if (respuesta.datos == 0) {
          swal(
            "ERROR",
            "No se pudo conectar a la base de datos de candidatos",
            "warning"
          );
          resetInputs();
        } else if (respuesta.datos == 1) {
          if (cambios.length > 0) {
            //////PDF
            if (subEstado == "Completo") {
              documento = "plantillasDiputaciones/cv";
              generarCV(
                candidato_clave_elector_rp,
                usuarioActual,
                documento,
                idTipoCandidatura
              );
            } else if (subEstado == "Incompleto") {
              if (candidato_pp == "Candidatura Independiente") {
                if (subSEPARACION == "NO") {
                  documento = "plantillasDiputaciones/coind";
                  generarPDF(
                    candidato_clave_elector_rp,
                    documento,
                    idTipoCandidatura
                  );
                  documento = "plantillasDiputaciones/RSCARGOPP";
                  generarPDF(
                    candidato_clave_elector_rp,
                    documento,
                    idTipoCandidatura
                  );
                } else {
                  documento = "plantillasDiputaciones/coind";
                  generarPDF(
                    candidato_clave_elector_rp,
                    documento,
                    idTipoCandidatura
                  );
                }
              } else {
                if (subSEPARACION == "NO") {
                  //documento = "plantillasDiputaciones/copp";
                  //generarPDF(candidato_clave_elector_rp, documento, idTipoCandidatura);
                  //documento = "plantillasDiputaciones/RSCARGOPP";
                  // generarPDF(candidato_clave_elector_rp, documento, idTipoCandidatura);
                } else {
                  // documento = "plantillasDiputaciones/copp";
                  // generarPDF(candidato_clave_elector_rp, documento, idTipoCandidatura);
                }
              }
            } else {
              console.error("Ocurrio un error");
            }
          } else {
            console.error("NO: " + cambios.length + "");
          }

          swal("Éxito", "Registro actualizado", "success");
          $("#modal-docs").modal("hide");
          resetInputs();
          limpiarModalsubsanacion();
          $("#busqueda-subsanar").val("");
        }
      } catch (e) {
        console.error(respuesta);
        console.error(e);
      }
    })
    .fail(function () {
      console.error("No se realizo ningun cambio");
      swal("Éxito", "No se realizo ningun cambio", "success");
      resetInputs();
      $(".infoc-subsanacion").show();
    });
};

/* Representacion Proporcional  */
$.actualizarPrelacion = function (infoSubsanacion) {
  ({
    candidato_clave_elector_rp,
    usuarioActual,
    subEstado,
    candidato_pp,
    idTipoCandidatura,
    subSEPARACION,
  } = infoSubsanacion);

  $.ajax({
    url: "servicios/subsanacion/modificarPrelacion.php",
    type: "POST",
    data: infoSubsanacion,
  })
    .done(function (respuesta) {
      try {
        var respuesta = JSON.parse(respuesta);
        if (respuesta.datos == 0) {
          swal(
            "ERROR",
            "No se pudo conectar a la base de datos de candidatos",
            "warning"
          );
          resetInputs();
        } else if (respuesta.datos === 1) {
          if (subEstado == "Completo") {
            documento = "plantillasDiputaciones/cvpluri";
            usuarioActual = $.buscarCookie("usuario");
            generarCV(
              candidato_clave_elector_rp,
              usuarioActual,
              documento,
              idTipoCandidatura
            );
          } else if (subEstado == "Incompleto") {
            if (candidato_pp == "Candidatura Independiente") {
              if (subSEPARACION == "NO") {
                documento = "plantillasDiputaciones/coind";
                generarPDF(
                  candidato_clave_elector_rp,
                  documento,
                  idTipoCandidatura
                );
                documento = "plantillasDiputaciones/RSCARGOPLURI";
                generarPDF(
                  candidato_clave_elector_rp,
                  documento,
                  idTipoCandidatura
                );
              } else {
                documento = "plantillasDiputaciones/coind";
                generarPDF(
                  candidato_clave_elector_rp,
                  documento,
                  idTipoCandidatura
                );
              }
            } else {
              if (subSEPARACION == "NO") {
                //documento = "plantillasDiputaciones/copluri";
                //generarPDF(candidato_clave_elector_rp, documento, idTipoCandidatura);
                // documento = "plantillasDiputaciones/RSCARGOPLURI";
                // generarPDF(candidato_clave_elector_rp, documento, idTipoCandidatura);
              } else {
                //documento = "plantillasDiputaciones/copluri";
                //generarPDF(candidato_clave_elector_rp, documento, idTipoCandidatura);
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
        } else {
          console.error("NO: " + cambios.length + "");
        }

        swal("Éxito", "Registro actualizado", "success");
        $("#modal-docs").modal("hide");
        resetInputs();
        limpiarModalsubsanacion();
        $("#busqueda-subsanar").val("");
      } catch (e) {
        console.error(respuesta);
        console.error(e);
      }
    })
    .fail(function () {
      console.error("No se realizo ningun cambio");
      swal("Éxito", "No se realizo ningun cambio", "success");
      resetInputs();
      $(".infoc-subsanacion").show();
    });
};
/* Aqui termina la informacion de subsanacion.js */
