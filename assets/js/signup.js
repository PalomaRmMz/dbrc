$(document).ready(function () {
  $.auth0Cookie = function (usuario) {
    document.cookie = "usuario = " + usuario + "; path=/";
  };

  $.eliminarCookie = function () {
    document.cookie = "usuario =; path=/";
  };

  $.buscarCookie = function (nombreCookie) {
    var nombre = nombreCookie + "=";
    var cookieArray = document.cookie.split(";");
    for (var i = 0; i < cookieArray.length; i++) {
      var c = cookieArray[i];
      while (c.charAt(0) == " ") {
        c = c.substring(1);
      }
      if (c.indexOf(nombre) == 0) {
        return c.substring(nombre.length, c.length);
      }
    }
    return "";
  };

  /* Funciones de los roles  */
  function usuarioCapturista() {
    //$("#busqueda").css("display", "inline-flex");
    //$("#menuRegistro").addClass("menuactivo");
    //$("#menuGobernador").addClass("menuactivo");
    // $("#menuayuntamiento").addClass("menuactivo");
    //$("#menucomunidad").addClass("menuactivo");
    //$("#menuSubsanacion").addClass("menuactivo");
    //$("#menuSustitucion").addClass("menuactivo");
    //$("#menuCancelacion").addClass("menuactivo");
    $("#exit-btn").addClass("menuactivo");
  }

  function usuarioSubsanador() {
    $("#busqueda").css("display", "none");
    $("#menuSubsanacion").addClass("menuactivo");
    $("#menuSustitucion").addClass("menuactivo");
    $("#menuCancelacion").addClass("menuactivo");
    $("#menuReportes").addClass("menuactivo");
    $("#exit-btn").addClass("menuactivo");
  }

  function usuarioSupervisor() {
    $("#menuReportes").addClass("menuactivo");
    //$("#menuHistorial").addClass("menuactivo");
    $("#busqueda").css("display", "inline-flex");
    $("#exit-btn").addClass("menuactivo");
  }

  function usuarioAdministrador() {
    $("#menuRegistro").addClass("menuactivo");
    $("#menuSubsanacion").addClass("menuactivo");
    $("#menuSustitucion").addClass("menuactivo");
    $("#menuCancelacion").addClass("menuactivo");
    $("#menuGobernatura").addClass("menuactivo");
    $("#menuReportes").addClass("menuactivo");
    $("#menuGobernador").addClass("menuactivo");
    // $("#menuHistorial").addClass("menuactivo");
    $("#menuUsuarios").addClass("menuactivo");
    $("#busqueda").css("display", "inline-flex");
    $("#exit-btn").addClass("menuactivo");
    $("#menuayuntamiento").addClass("menuactivo");
    $("#menucomunidad").addClass("menuactivo");
  }
  /* Funcion para identificar los roles de los usuarios */
  function usuarioRoles(rolUser) {
    switch (rolUser) {
      case "Capturista":
        usuarioCapturista();
        break;
      case "Subsanacion":
        usuarioSubsanador();
        break;
      case "Supervisor":
        usuarioSupervisor();
        break;
      case "Administrador":
        usuarioAdministrador();
        break;
      default:
        console.error("El usuario no tiene rol");
    }
  }
  /***************************************ACTIVAR INTERVALO******************************************** */
  function activarIntervalo() {
    intervalo = setInterval(() => {
      $.get("servicios/login/usuarioActivo.php", function (data) {
        try {
          data = JSON.parse(data);
          // console.log(data);
          if (data.status_code == 502) {
            swal("ERROR DE CONEXIÓN", "Intentelo más tarde", "error");
            return desactivarIntervalo();
          }

          if (data.exito == 2) {
            document.cookie = "usuario =; path=/";
            alert("Se ha iniciado sesión en otro dispositivo");
            desactivarIntervalo();
            location.reload();
          } else if (data.exito == 4) {
            alert("No se encontro el usuario");
            document.cookie = "usuario =; path=/";
            location.reload();
          }
        } catch (e) {
          console.error(e);
        }
      });
    }, 2000);
  }

  /************************************DESACTIVAR INTERVALO********************************************** */
  function desactivarIntervalo() {
    clearInterval(intervalo);
    document.cookie = "usuario =; path=/";
    location.reload();
  }

  $.verificarSesion = function () {
    var usuarioActual = $.buscarCookie("usuario");
    $.obtenerUsuario(usuarioActual);
    if (usuarioActual != "") {
      swal("Previo inicio de sesión", "Tu usuario ya estaba activo", "info");
      activarIntervalo();
    } else {
      //console.log("No estabas logueado '");
    }
  };
  /*********************************************************************************************************** */

  $.obtenerUsuario = function (usuarioActual) {
    $.ajax({
      url: "servicios/usuarios/obtenerUsuario.php",
      type: "POST",
      data: { usuarioActual: usuarioActual },
    })
      .done(function (respuesta) {
        var respuesta = JSON.parse(respuesta);
        if (respuesta.datos == 0) {
          console.error("No se pudo conectar a la base de datos");
        } else if (respuesta.datos == 1) {
          // console.error("No se encontro al usuario en la base de datos");
        } else if (respuesta.datos == 2) {
          var fila = "";
          $(".login").hide();
          $(".dashboard").show();
          fila = " " + respuesta.nombre_act + " " + respuesta.app_act + " ";
          var rolUser = respuesta.rol;
          usuarioRoles(rolUser);
          $("#nombreCapturista").html(fila);
        }
      })
      .fail(function () {
        console.error("No se puede obtener el nombre de usuario");
      });
  };

  $.modificarEstado = function (uname, estado) {
    $.ajax({
      url: "servicios/modificarEstado.php",
      type: "POST",
      data: { username: uname, uestado: estado },
    })
      .done(function (respuesta) {
        var respuesta = JSON.parse(respuesta);
        if (respuesta.datos == 0) {
          // console.error("No se pudo conectar a la base de datos de usuario");
        } else if (respuesta.datos == 1) {
          //console.error("Éxito, el registro se modifico exitosamente");
        }
      })
      .fail(function () {
        console.error("No se realizo ningun cambio");
      });
  };

  $.salvarHistorial = function (usuario, claveOriginal, claveNuevo, motivo) {
    $.ajax({
      url: "servicios/salvarHistorial.php",
      type: "POST",
      data: {
        usuario: usuario,
        "claveO riginal": claveOriginal,
        claveNuevo: claveNuevo,
        motivo: motivo,
      },
    })
      .done(function (respuesta) {
        var respuesta = JSON.parse(respuesta);
        if (respuesta.datos == 0) {
          console.error("No se pudo conectar a la base de datos de usuario");
        } else if (respuesta.datos == 1) {
          console.error("Se ha guardado éxitosamente");
        }
      })
      .fail(function () {
        console.error("No se realizo ningún cambio");
      });
  };

  /****************************************** funcion que inicia sesion ***************************************/

  $.auth0 = function (usuario, password) {
    $.ajax({
      url: "servicios/auth0.php",
      type: "POST",
      data: { logUsuario: usuario, logPassword: password },
    })
      .done(function (respuesta) {
        try {
          var respuesta = JSON.parse(respuesta);
          if (respuesta.status_code == 502) {
            return swal("ERROR DE CONEXIÓN", "Intentelo más tarde", "error");
          }

          if (respuesta.exito == 1) {
            $.modificarEstado(usuario, "Activo");
            $(".login").hide();
            $(".dashboard").show();
            $("#username").val("");
            $("#pass").val("");
            var rolUser = respuesta.rol;
            usuarioRoles(rolUser);
            $.auth0Cookie(usuario);
            fila = " " + respuesta.nombre + " " + respuesta.app + " ";
            $("#nombreCapturista").html(fila);
            activarIntervalo();
          } else if (respuesta.exito == 0) {
            swal(
              "Error",
              "Nombre de usuario o contraseña son incorrectos",
              "error"
            );
          } else if (respuesta.exito == 2) {
            console.error("No se pudo conectar a la base de datos");
          }
        } catch (e) {
          console.error(respuesta);
          console.error(e);
        }
      })
      .fail(function () {
        console.error("Error al inciar sesión");
      });
  };
  /************************************************************************************************************* */

  /********************************INICIO*********************************************************************** */
  $("#init").click(function () {
    var usuario = $("#username").val();
    var password = $("#pass").val();
    $.auth0(usuario, password);
    return false;
  });
  /************************************************************************************************************** */

  /*************************************SALIR******************************************************************** */
  $(document).on("click", "#exit-btn", function (event) {
    var claveOriginal = "";
    var claveNuevo = "";
    var motivo = "";

    var UserA = $.buscarCookie("usuario");
    $.modificarEstado(UserA, "Inactivo");
    $.salvarHistorial(UserA, claveOriginal, claveNuevo, motivo);
    $.eliminarCookie();
    //Ocultamos toda la informacion
    $(".ite-link").removeClass("menuactivo");
    $(".menu-item").removeClass("menuactivo");
    $("#busqueda").css("display", "none");
    $(".contenido-pagina").hide();
    //ocultar/desocultar
    $(".dashboard").hide();
    $(".login").show();
  });

  /************************************************************************************************************** */

  /*******************************SUSPENDER SESION*************************************************************** */
  $(document).on("click", "#suspenderSesion", function (event) {
    var claveOriginal = "";
    var claveNuevo = "";
    var motivo = $("#it").val();

    var UserA = $.buscarCookie("usuario");

    $.modificarEstado(UserA, "Inactivo");
    $.salvarHistorial(UserA, claveOriginal, claveNuevo, motivo);
    $.eliminarCookie();
    //Ocultamos toda la informacion
    $(".ite-link").removeClass("menuactivo");
    $(".menu-item").removeClass("menuactivo");
    $("#busqueda").css("display", "none");
    $(".contenido-pagina").hide();
    $("#modal-suspender").modal("hide");
    //ocultar/desocultar
    $(".dashboard").hide();
    $(".login").show();
  });
  /**************************************************************************************************************** */

  $.verificarSesion();

  var today = new Date();
  var dd = today.getDate();
  var mm = today.getMonth() + 1; //January is 0!
  var yyyy = today.getFullYear();
  if (dd < 10) {
    dd = "0" + dd;
  }
  if (mm < 10) {
    mm = "0" + mm;
  }

  today = dd + "/" + mm + "/" + yyyy;

  $("#fechaRenuncia").html(today);
  $("#fechaSustitucion").html(today);
});
