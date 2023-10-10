$(document).ready(function() {
    /*
       Funciones correpondientes a los cambios del campo de usuario
    */
    var uname = "";
    /* listar usarios */
    $.listarUsuarios = function() {
            $.ajax({
                url: "servicios/listarUsuarios.php",
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
                        fila += "<tr> <td>" + respuesta[i].nombre + " " + respuesta[i].app + " " + respuesta[i].apm + "</td> <td>" + respuesta[i].usuario + "</td>  <td>******</td>  <td> <span class='badge badge-" + respuesta[i].estado + "'>" + respuesta[i].estado + "</span> </td> <td> " + respuesta[i].rol + " </td> <td> <button type='button' class='btn btn-primary btn-sm edit-user' data-user='" + respuesta[i].usuario + "'> <i class='fa fa-pencil-square-o' aria-hidden='true'></i></button> <button type='button' class='btn btn-secondary btn-sm eliminar-usuario' data-user='" + respuesta[i].usuario + "'> <i class='fa fa-trash' ></i></button> </td> </tr>";
                        // <button type='button' class='btn btn-dark btn-sm reset-user' data-user='" + respuesta[i].usuario + "'> Reset</button>
                    }
                }
                $("#tablaUsuarios").html(fila);
            }).fail(function() {
                console.error("Error al listar usuarios");
            });
        }
        /* añadir nuevo usuario */
    $.nuevoUsuario = function(username, userapp, userapm, userusername, userpassword, userrol) {
            $.ajax({
                url: "servicios/nuevoUsuario.php",
                type: "POST",
                data: { "nombre": username, "apellidoPaterno": userapp, "apellidoMaterno": userapm, "nombreDUsuario": userusername, "userpassword": userpassword, "userrol": userrol }
            }).done(function(respuesta) {
                var respuesta = JSON.parse(respuesta);
                if (respuesta.datos == 0) {
                    console.error("Nos se pudo conectar a la base de datos");
                } else if (respuesta.datos == 1) {
                    $("#add-user")[0].reset();
                    $("#modal-adminuser").modal("hide");
                    swal("Usuario agregado", "El registro se almaceno exitosamente", "success");
                    $.listarUsuarios();
                }
            }).fail(function(jqXHR, textStatus, errorThrown) {
                if (console && console.log) {
                    console.error("La solicitud a fallado: " + textStatus);
                }
            });
        } //finaliza editar usuario

    /** usuario editar **/
    $.editarUsuario = function(uname) {
        $.ajax({
            url: "servicios/editarUsuario.php",
            type: "POST",
            data: { "username": uname }
        }).done(function(respuesta) {
            var respuesta = JSON.parse(respuesta);

            if (respuesta.datos == 0) {
                console.error("No se pudo conectar a la base de datos");
            } else if (respuesta.datos == 1) {
                console.error("No se encontro al usuario en la base de datos");
            } else if (respuesta.datos == 2) {

                $("#user-name").val(respuesta.nombre);
                $("#user-app").val(respuesta.app);
                $("#user-apm").val(respuesta.apm);
                $("#user-username").val(respuesta.usuario);
                $("#user-rol").val(respuesta.rol);

                /* aparecer ventana modal */
                $("#cboContraseña").removeClass("d-none");
                $("#passCambio").addClass("d-none");


                $('.titulo-adminuser').html("Editar Usuario");
                $('#btns-save').html('<button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button> <button type="button" class="btn btn-primary" id="btn_editUsuario">Editar Usuario</button>');
                $('#modal-adminuser').modal('show');
            }
        }).fail(function() {
            console.error("No se pudo obtener los datos del usuario");
        });
    }

    $.reset = function(uname) {
            $.ajax({
                url: "servicios/reset.php",
                type: "POST",
                data: { "username": uname }
            }).done(function(respuestaReset) {
                var respuestaReset = JSON.parse(respuestaReset);
                if (respuestaReset.datos == 0) {
                    console.error("No lo hizo");
                } else if (respuestaReset.datos == 1) {
                    $.listarUsuarios();
                }
            }).fail(function() {
                console.error("No se pudo obtener los datos del usuario");
            });
        }
        /** modificar usuario **/

    $.modificarUsuario = function(uname, username, userapp, userapm, userusername, userpassword, userrol) {
            $.ajax({
                url: "servicios/modificarUsuario.php",
                type: "POST",
                data: { "username": uname, "nombre": username, "apellidoPaterno": userapp, "apellidoMaterno": userapm, "nombreDUsuario": userusername, "userpassword": userpassword, "userrol": userrol }
            }).done(function(respuesta) {

                try {
                    var respuesta = JSON.parse(respuesta);

                    if (respuesta.status_code == 404) {
                        swal("", respuesta.mensaje, 'info');
                        $("#modal-adminuser").modal("hide");
                    } else if (respuesta.status_code == 400) {
                        console.error(respuesta.mensaje);
                    } else {
                        $("#add-user")[0].reset();
                        $("#modal-adminuser").modal("hide");
                        swal("Modificación éxitosa", "El registro se modificó éxitosamente", "success");
                        $.listarUsuarios();
                    }

                } catch (e) {
                    console.error(respuesta);
                }

            }).fail(function() {
                console.log("No se realizo ningun cambio");
            });
        }
        /** Eliminar usuario **/
    $.eliminarUsuario = function(uname) {
            $.ajax({
                url: "servicios/eliminarUsuario.php",
                type: "POST",
                data: { "username": uname }
            }).done(function(respuesta) {
                var respuesta = JSON.parse(respuesta);
                if (respuesta.datos == 0) {
                    console.error("No se pudo conectar a la base da datos");
                } else if (respuesta.datos == 1) {
                    //swal("Eliminación exitosa", "El usuario se elimino exitosamente", "error");
                    $.listarUsuarios();
                }
            }).fail(function() {
                console.error("No se pudo eliminar al usuario");
            });
        }
        /* */

    $(document).on("click", "#btn_nuevoUsuario", function() {
        var username = $("#user-name").val();
        var userapp = $("#user-app").val();
        var userapm = $("#user-apm").val();
        var userusername = $("#user-username").val();
        var userpassword = $("#user-password").val();
        var userrol = $("#user-rol").val();
        if (username == "" || userapp == "" || userapm == "" || userusername == "" || userpassword == "" || userrol == "") {
            swal("Error de Registro", "Llena toda la información para ingresar un nuevo usuario", "error");
        } else {
            console.log("dentro de nuevo");
            $.nuevoUsuario(username, userapp, userapm, userusername, userpassword, userrol);
        }
    });

    $(document).on("click", ".edit-user", function() {
        $("#cbxCampioPass").prop("checked", false);
        uname = $(this).attr('data-user');
        $.editarUsuario(uname);
    });

    $(document).on("click", ".reset-user", function() {
        uname = $(this).attr('data-user');
        $.reset(uname);
    });

    $(document).on("click", "#btn_editUsuario", function() {
        let username = $("#user-name").val();
        let userapp = $("#user-app").val();
        let userapm = $("#user-apm").val();
        let userusername = $("#user-username").val();
        let userpassword = $("#user-password").val();
        let userrol = $("#user-rol").val();

        //let regExp = /^(?=.*[a-z])(?=.*\d)(?=.*[$@$!%*?&])([A-Za-z\d$@$!%*?&]|[^ ]){6,15}$/;

        if (userpassword.length < 6 && $("#cbxCampioPass").is(':checked')) {
            return swal("Error", "La contraseña debe tener almenos 6 caracteres", "error");
        }

        $.modificarUsuario(uname, username, userapp, userapm, userusername, userpassword, userrol);
    });

    $(document).on("click", ".eliminar-usuario", function() {
        uname = $(this).attr('data-user');
        //$.eliminarUsuario(uname);
        swal({
            title: "¿Estas seguro de eliminar al usuario?",
            text: "Una vez eliminado no se podra recuperar la información",
            icon: "warning",
            buttons: true,
            dangerMode: true,
        }).then((willDelete) => {
            if (willDelete) {
                $.eliminarUsuario(uname);
                swal("Se ha eliminado el registro", {
                    icon: "success",
                });
            } else {
                swal("No se ha eliminado nada");
            }
        });
    });

}); //fin de editar usuario