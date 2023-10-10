$(document).ready(function(){
  var clave = "";
  var tipo = "";

  $("#deleteBuscar").on("click", function(){
    clave = $("#deleteClave").val();
    tipo = $("#deleteTipo").val();
    $.buscarCandidato(clave, tipo);
  });

  $("#delete").on("click", function(){
    var capturista = $("#capturista").html();
    swal({
      title: "Alto",
      text: "¿Estás seguro de eliminar este registro?",
      icon: "warning",
      buttons: true,
      dangerMode: true,
    })
    .then((willDelete) => {
      if (willDelete) {
        swal("El registro se ha eliminado", {
          icon: "success",
        });
        $.eliminarCandidato(clave, tipo, capturista);
        $(".informacionCandidato").hide();
      } else {
        $(".informacionCandidato").hide();
        swal("No se ha eliminado ningun registro");
      }
    });
  });

  $.buscarCandidato = function(clave, tipo){
    $.ajax({
      url: "assets/buscar.php",
      type: "POST",
      data: {"clave" : clave, "tipo" : tipo}
    }).done(function(respuesta){
      var respuesta = JSON.parse(respuesta);
      if (respuesta.exito == 1) {
         $("#nombre").html(respuesta.nombre);
         $("#app").html(respuesta.apellido_paterno);
         $("#apm").html(respuesta.apellido_materno);
         $("#tipo").html(respuesta.candidatura);
         $("#distrito").html(respuesta.distrito);
         $("#pp").html(respuesta.partido_politico);
         $("#curp").html(respuesta.curp);
         $("#capturista").html(respuesta.user_capturista);
         $(".informacionCandidato").show();
      }else {
        alert("No hay registros con esta clave de elector");
      }
    }).fail(function(){
        alert("Algo salio horriblemente mal");
    });
  }

  $.eliminarCandidato = function(clave, tipo, capturista){
    $.ajax({
      url: "assets/eliminar.php",
      type: "POST",
      data: { "clave" : clave, "tipo" : tipo, "capturista" : capturista }
    }).done(function(respuesta){
        var respuesta = JSON.parse(respuesta);
        if (respuesta.datos == 0) {
          console.error("No se pudo conectar a la base da datos");
        } else if(respuesta.datos == 1){
          $(".informacionCandidato").hide();
          $("#deleteClave").val("");
        }
    }).fail(function(){
      console.error("Algo salio terriblemente mal");
    });
  }

});
