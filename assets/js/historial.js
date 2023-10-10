//Ejecuto mi funcion para imprimir el historial cuando se preciona el boton  con el id 'menuHiatorial'
$("#menuHistorial").on('click', function() {
    $.printHistorial();
});

$("#search-form-nule").submit(function() {
    return false
});

function convertDate(inputFormat) {
    function pad(s) { return (s < 10) ? '0' + s : s; }
    var d = new Date(inputFormat);
    return [pad(d.getDate() + 1), pad(d.getMonth() + 1), d.getFullYear()].join('.');
}

$("#busqueda-historial").on('click', function() {
    var dia = $("#historial-date").val();
    dia = convertDate(dia);
    var usuario = $("#historial-usuario").val();
    var estado = $("#historial-estado").val();

    $.busquedaHistorial(dia, usuario, estado);
    return false;
});

$.busquedaHistorial = function(dia, usuario, estado) {
        $.ajax({
            url: "servicios/buscarHistorial.php",
            type: "POST",
            data: { "dia": dia, "usuario": usuario, "estado": estado }
        }).done(function(respuesta) {
            var respuesta = JSON.parse(respuesta);
            if (respuesta[0].datos == 0) {
                var fila = "";
                fila = "<p class='user-action'><i class='fa fa-remove'></i> <b> Aún no se registra actividad por hoy. </b></p>";
                swal("Error", "Aún no se registra actividad por hoy.", "warning");
            } else if (respuesta[0].datos == 1) {
                console.error("Ocurrio un error");
            } else {
                var fila = "";
                for (var i = 0; i < respuesta.length; i++) {
                    switch (respuesta[i].tipo) {
                        case "Registro":
                            {
                                fila += `
             <div class="tarjeta">
               <span class="hora-tarjeta"><i class="fa fa-calendar"></i> ` + respuesta[i].dia + ` - <i class="fa fa-clock-o"></i> ` + respuesta[i].hora + `</span>
               <h5><i class="fa fa-user-plus"></i> Registro</h5>
               <br />
               <div class="row col-12">
                 <div class="col">
                   <label class="accion">` + respuesta[i].usuario + `</label>
                   <label> registró a</label>
                   <label class="accion">` + respuesta[i].nombre_clv + `</label>
                 </div>
               </div>
             </div>
             `;
                            }
                            break;
                        case "Subsanacion":
                            {
                                fila += `
             <div class="tarjeta">
               <span class="hora-tarjeta"><i class="fa fa-calendar"></i> ` + respuesta[i].dia + ` - <i class="fa fa-clock-o"></i> ` + respuesta[i].hora + `</span>
               <h5><i class="fa fa-edit"></i> Subsanación</h5>
               <br />
               <div class="row col-12">
                 <div class="col">
                   <label class="accion">` + respuesta[i].usuario + `</label>
                   <label> subsanó la información de </label>
                   <label class="accion">` + respuesta[i].nombre_clv + `</label>
                 </div>
               </div>
             </div>
             `;
                            }
                            break;
                        case "Sustitucion":
                            {
                                fila += `
             <div class="tarjeta">
               <span class="hora-tarjeta"><i class="fa fa-calendar"></i> ` + respuesta[i].dia + ` - <i class="fa fa-clock-o"></i> ` + respuesta[i].hora + `</span>
               <h5><i class="fa fa-refresh"></i> Sustitución</h5>
               <br />
               <div class="row col-12">
                 <div class="col">
                   <label class="accion"> ` + respuesta[i].usuario + ` </label>
                   <label> sustituyó</label>
                   <label class="accion"> ` + respuesta[i].nombre_clv + `</label>
                   <label> por</label>
                   <label class="accion"> ` + respuesta[i].nombre_clv_nuevo + `</label>
                 </div>
               </div>
             </div>
             `;
                            }
                            break;
                        case "Renuncia":
                            {
                                fila += `
             <div class="tarjeta">
               <span class="hora-tarjeta"><i class="fa fa-calendar"></i> ` + respuesta[i].dia + ` - <i class="fa fa-clock-o"></i> ` + respuesta[i].hora + `</span>
               <h5><i class="fa fa-times-circle-o"></i> Renuncia</h5>
               <br />
               <div class="row col-12">
                 <div class="col">
                   <label class="accion"> ` + respuesta[i].usuario + ` </label>
                   <label> registro la renuncia de </label>
                   <label class="accion">` + respuesta[i].nombre_clv + `</label>
                 </div>
               </div>
             </div>
             `;
                            }
                            break;
                        case "Inicio de Sesion":
                            {
                                fila += "<p class='user-action'><i class='fa fa-circle online'></i><label class='accion'> " + respuesta[i].usuario + " </label> se conectó.<br><span class='small'> " + respuesta[i].hora + " </span></p>";
                            }
                            break;
                        case "Cerro Sesion":
                            {
                                fila += "<p class='user-action'><i class='fa fa-circle shutdown'></i><label class='accion'> " + respuesta[i].usuario + " </label> se desconectó.<br><span class='small'> " + respuesta[i].hora + " </span></p>";
                            }
                            break;
                        default:
                            { console.error(respuesta[i].tipo + " inexistente") }
                            break;
                    }
                }
            }
            $("#tarjetas-historial").html(fila);
        }).fail(function() {
            console.error("Error al listar historial");
        });
    }
    //Muestra los registros del historial
$.printHistorial = function() {
    $.ajax({
        url: "servicios/obtenerHistorial.php",
        type: "POST",
        data: {},
        dataType: "JSON"
    }).done(function(respuesta) {

        if (respuesta[0].datos == 0) {
            swal("Error", "No se pudo conectar a la base de datos de usuario", "error");
        } else if (respuesta[0].datos == 1) {
            swal("Error", "No hay registro en la base de datos de usuario", "error");
        } else {

            var fila = "";
            for (var i = 0; i < respuesta.length; i++) {
                switch (respuesta[i].tipo) {
                    case "Registro":
                        {
                            fila += `
            <div class="tarjeta">
              <span class="hora-tarjeta"><i class="fa fa-calendar"></i> ` + respuesta[i].dia + ` - <i class="fa fa-clock-o"></i> ` + respuesta[i].hora + `</span>
              <h5><i class="fa fa-user-plus"></i> Registro</h5>
              <br />
              <div class="row col-12">
                <div class="col">
                  <label class="accion">` + respuesta[i].usuario + `</label>
                  <label> registró a</label>
                  <label class="accion">` + respuesta[i].nombre_clv + `</label>
                </div>
              </div>
            </div>
            `;
                        }
                        break;
                    case "Subsanacion":
                        {
                            fila += `
            <div class="tarjeta">
              <span class="hora-tarjeta"><i class="fa fa-calendar"></i> ` + respuesta[i].dia + ` - <i class="fa fa-clock-o"></i> ` + respuesta[i].hora + `</span>
              <h5><i class="fa fa-edit"></i> Subsanación</h5>
              <br />
              <div class="row col-12">
                <div class="col">
                  <label class="accion">` + respuesta[i].usuario + `</label>
                  <label> subsanó la información de </label>
                  <label class="accion">` + respuesta[i].nombre_clv + `</label>
                </div>
              </div>
            </div>
            `;
                        }
                        break;
                    case "Sustitucion":
                        {
                            fila += `
            <div class="tarjeta">
              <span class="hora-tarjeta"><i class="fa fa-calendar"></i> ` + respuesta[i].dia + ` - <i class="fa fa-clock-o"></i> ` + respuesta[i].hora + `</span>
              <h5><i class="fa fa-refresh"></i> Sustitución</h5>
              <br />
              <div class="row col-12">
                <div class="col">
                  <label class="accion"> ` + respuesta[i].usuario + ` </label>
                  <label> sustituyó</label>
                  <label class="accion"> ` + respuesta[i].nombre_clv + `</label>
                  <label> por</label>
                  <label class="accion"> ` + respuesta[i].nombre_clv_nuevo + `</label>
                </div>
              </div>
            </div>
            `;
                        }
                        break;
                    case "Renuncia":
                        {
                            fila += `
            <div class="tarjeta">
              <span class="hora-tarjeta"><i class="fa fa-calendar"></i> ` + respuesta[i].dia + ` - <i class="fa fa-clock-o"></i> ` + respuesta[i].hora + `</span>
              <h5><i class="fa fa-times-circle-o"></i> Renuncia</h5>
              <br />
              <div class="row col-12">
                <div class="col">
                  <label class="accion"> ` + respuesta[i].usuario + ` </label>
                  <label> registro la renuncia de </label>
                  <label class="accion">` + respuesta[i].nombre_clv + `</label>
                </div>
              </div>
            </div>
            `;
                        }
                        break;
                    case "Inicio de Sesion":
                        {
                            fila += "<p class='user-action'><i class='fa fa-circle online'></i><label class='accion'> " + respuesta[i].usuario + " </label> se conectó.<br><span class='small'> " + respuesta[i].hora + " </span></p>";
                        }
                        break;
                    case "Cerro Sesion":
                        {
                            fila += "<p class='user-action'><i class='fa fa-circle shutdown'></i><label class='accion'> " + respuesta[i].usuario + " </label> se desconectó.<br><span class='small'> " + respuesta[i].hora + " </span></p>";
                        }
                        break;
                    default:
                        { console.error(respuesta[i].tipo + " inexistente") }
                        break;
                }
            }
        }

        $("#tarjetas-historial").html(fila);
    }).fail(function() {
        console.error("Error al listar historial");
    });
};