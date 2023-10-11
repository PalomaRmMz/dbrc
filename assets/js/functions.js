function validarFecha(input) {}

function validacionSexo(data, contenedor) {
  if (candIndependiente == 4) {
    data = {};
    esconderForm(contenedor, data, true);
    $(`#${contenedor}`).removeClass("d-none");
    return;
  }
  sltPost("servicios/diputaciones/validarSexo.php", data)
    .then((respuesta) => {
      if (respuesta.status_code == 201) {
        $(`#${contenedor}`).addClass("d-none");
        swal(
          "Información",
          "Ya se han registrado el propietario y suplente",
          "info"
        );
        return respuesta;
      }
      $(`#${contenedor}`).removeClass("d-none");
      esconderForm(contenedor, respuesta);
    })
    .catch(console.error);
}

//validacion del CIC
function validarCIC(cic) {
  var expreg = new RegExp("[A-Z]{5}[0-9]{10}");
  if (!expreg.test(cic)) {
    return false;
  }
  return true;
}

// solo deja ingresar puros numero
function soloNumeros(e) {
  var key = window.event ? e.which : e.keyCode;
  if (key < 48 || key > 57) {
    e.preventDefault();
  }
}

/************************************************** */

function esconderForm(container, data, limpiar) {
  let contenedor = document.querySelector(`#${container}`);

  let btnPro = contenedor.querySelectorAll("li>a.btnPro");
  let btnSup = contenedor.querySelectorAll("li>a.btnSup");

  let sltGeneroP = contenedor.querySelectorAll("div>select.rdGeneroP");
  let sltGeneroS = contenedor.querySelectorAll("div>select.rdGeneroS");

  $(btnPro).prop("disabled", false);
  $(btnSup).prop("disabled", false);

  sltGeneroP[0].disabled = false;
  sltGeneroP[0].selectedIndex = 0;
  btnPro[0].style.pointerEvents = "";

  sltGeneroS[0].disabled = false;
  sltGeneroS[0].selectedIndex = 0;
  btnSup[0].style.pointerEvents = "";

  if (limpiar) {
    $(btnPro).trigger("click");
    return;
  }

  if (data.prosup == "Propietario") {
    $(btnPro).prop("disabled", true);
    btnPro[0].style.pointerEvents = "none";
    $(btnSup).trigger("click");
    //prueba de genero
    if (data.sexo !== "MASCULINO") {
      sltGeneroS[0].disabled = true;
      sltGeneroS[0].selectedIndex = 2;
    } else if (data.sexo === "FEMENINO") {
      sltGeneroS[0].disabled = true;
      sltGeneroS[0].selectedIndex = 1;
    }
  } else if (data.prosup == "Suplente") {
    $(btnSup).prop("disabled", true);
    btnSup[0].style.pointerEvents = "none";
    $(btnPro).trigger("click");
    sltGeneroP[0].disabled = true;

    if (data.sexo !== "MASCULINO") {
      sltGeneroP[0].selectedIndex = data.sexo == "MASCULINO" ? 1 : 2;
    }
  }
}

/*************************************************************************************************** */
let validarCampos = async (formulario) => {
  var form1Select = document.forms[formulario].getElementsByTagName("select");
  var form1Inputs = document.forms[formulario].getElementsByTagName("input");
  var campo;
  for (let i = 0; i < form1Inputs.length - 1; i++) {
    if ($(`#${form1Inputs[i].id}`).val() == "") {
      campo = $(`#${form1Inputs[i].id}`).siblings("label").text();
      if (
        campo == "Apellido Paterno" ||
        campo == "Correo Electrónico" ||
        campo == "CIC (Código de Identificación de Credencial para Votar)" ||
        campo == "Sobrenombre"
      )
        continue;
      swal("Error", `Verifique el campo ${campo}`, "error");
      throw new Error(`El campo ${campo} esta vacio`);
    }
  }
  for (let i = 0; i < form1Select.length; i++) {
    if ($(`#${form1Select[i].id}`).val() == "") {
      campo = $(`#${form1Select[i].id}`).siblings("label").text();
      swal("Error", `Verifique el campo ${campo}`, "error");
      throw new Error(`El campo ${campo} esta vacio`);
    }
  }
  return true;
};
/************************************************************************************************** */

function mensaje() {
  swal(
    "Se ha iniciado sesión en otro dispositivo",
    "Se cerrara la sesión actual",
    "info"
  );
}

function vaciarSlt(selector) {
  selector.attr("disabled", true);
  selector.html("<option value=''>Selecciona una opción</option>");
}

function limpiarPropietario() {
  $("#registroPropietario")[0].reset();
  $("#docPropietario")[0].reset();
  $("#registroSuplente")[0].reset();
  $("#docSuplente")[0].reset();
}

function limpiarSuplente() {
  $("#registroPropietario")[0].reset();
  $("#docPropietario")[0].reset();
  $("#registroSuplente")[0].reset();
  $("#docSuplente")[0].reset();
}
// esta es la peticion ajax post solo le pasas la url y la data
function sltPost(url, data) {
  return new Promise((resolve, reject) => {
    try {
      $.ajax({
        type: "POST",
        url: url,
        data: data,
      })
        .done(function (data) {
          try {
            data = JSON.parse(data);
            resolve(data);
          } catch (e) {
            //  console.log(data);
            console.log(e);
          }
        })
        .fail(function (jqXHR, textStatus) {
          reject(textStatus);
        });
    } catch (e) {
      console.error(e);
    }
  });
}

// esta funcion solo genera el select pasandole la data con la estructura iid y nombre
function sltGenerico(data = 0, selector, todo) {
  if (todo) {
    contenido = "<option value='Todos'>Todos</option>";
  } else {
    contenido = "<option value='0' >Selecciona una opción</option>";
  }
  data.map((item) => {
    contenido += `<option value = "${item.IID}" >${item.NOMBRE}</option>`;
  });
  selector.html(contenido);
}

// Esta funcion ordena los partido por su tipo ya sea por partido politico, coalision, candidatura comun o candidato independiente
function sltGenericoLabel(data, selector, todo) {
  if (todo) {
    contenido = "<option value='Todos'>Todos</option>";
  } else {
    contenido = "<option value='' >Selecciona una opción</option>";
  }

  lastCo = data[0].id_constitucion;
  lastpos = 0;
  aux = [[data[0]]];

  data.forEach((combinacion, index) => {
    if (index == 0) {
      return;
    }
    if (combinacion.id_constitucion == lastCo) {
      return (aux[lastpos] = [...aux[lastpos], combinacion]);
    }
    ++lastpos;
    lastCo = combinacion.id_constitucion;
    aux[lastpos] = [combinacion];
  });

  aux.map((cosntitucion) => {
    contenido += `<optgroup value="${cosntitucion[0].id_constitucion}" label="${cosntitucion[0].nombre_constitucion}">`;
    cosntitucion.map((item) => {
      contenido += `<option value="${item.id_partido}">${item.nombre_partido}</option>`;
    });
    contenido += "</optgroup>";
  });

  selector.html(contenido);
}

function generarCV(claveOriginal, usuario, documento, candidatura) {
  //var win = window.open(pathPdfs + documento + '.php?name=' + claveOriginal + '&user=' + usuario + '&candidatura=' + candidatura, '_blank');
  var win = window.open(
    pathPdfs +
      documento +
      ".php?name=" +
      claveOriginal +
      "&user=" +
      usuario +
      "&candidatura=" +
      candidatura,
    "_blank"
  );
  if (win) {
    win.focus();
  } else {
    alert("Porfavor habilíta las ventanas emergentes");
  }
}

function generarPDF(claveOriginal, documento, candidatura) {
  var win = window.open(
    pathPdfs +
      documento +
      ".php?name=" +
      claveOriginal +
      "&candidatura=" +
      candidatura,
    "_blank"
  );
  if (win) {
    win.focus();
  } else {
    alert("Porfavor habilíta las ventanas emergentes");
  }
}

//Función para validar una CURP
function curpValida(curp) {
  var re =
      /^([A-Z][AEIOUX][A-Z]{2}\d{2}(?:0[1-9]|1[0-2])(?:0[1-9]|[12]\d|3[01])[HM](?:AS|B[CS]|C[CLMSH]|D[FG]|G[TR]|HG|JC|M[CNS]|N[ETL]|OC|PL|Q[TR]|S[PLR]|T[CSL]|VZ|YN|ZS)[B-DF-HJ-NP-TV-Z]{3}[A-Z\d])(\d)$/,
    validado = curp.match(re);
  if (!validado)
    //Coincide con el formato general?
    return false;

  //Validar que coincida el dígito verificador
  function digitoVerificador(curp17) {
    //Fuente https://consultas.curp.gob.mx/CurpSP/
    var diccionario = "0123456789ABCDEFGHIJKLMNÑOPQRSTUVWXYZ",
      lngSuma = 0.0,
      lngDigito = 0.0;
    for (var i = 0; i < 17; i++)
      lngSuma = lngSuma + diccionario.indexOf(curp17.charAt(i)) * (18 - i);
    lngDigito = 10 - (lngSuma % 10);
    if (lngDigito == 10) return 0;
    return lngDigito;
  }

  if (validado[2] != digitoVerificador(validado[1])) return false;

  return true; //Validado
}

function sltTIpoElecion() {
  $.ajax({
    type: "POST",
    url: "servicios/selects.php",
    data: { tipo: "tipo_eleccion" },
  }).done(function (data) {
    data = JSON.parse(data);
    if (data.status_code == 502) {
      console.error(data);
      return;
    }
    data = data.filter((item) => item.IID == 1 || item.IID == 2);
    sltGenerico(data, $("#reg-tipoEleccion"));
    $('#reg-tipoEleccion option[value="0"]').prop("selected", "selected");
  });
}

function estados() {
  $.ajax({
    type: "POST",
    url: "servicios/selects.php",
    data: { tipo: "estados" },
  }).done(function (data) {
    data = JSON.parse(data);
    if (data.status_code == 502) {
      console.error(data);
      return 0;
    }

    contenido = "<option value=''>Selecciona una opción</option>";
    data.map((item) => {
      contenido += `<option value="${item.id_estado}">${item.nombre_estado}</option>`;
    });

    $("#reg-pro-sitenac").html(contenido);
    $("#sustitucion-sitenac").html(contenido);
    $("#reg-sup-sitenac").html(contenido);
    $("#lugar").html(contenido);
    $("#reg-m-pro-sitenac").html(contenido);
    $("#reg-m-sup-sitenac").html(contenido);
    $("#reg-c-pro-sitenac").html(contenido);
    $("#reg-c-sup-sitenac").html(contenido);
    $('.estados option[value="29"]').attr("selected", "selected");
  });
}

$(document).ready(function () {
  /*(async function cargarPartidosG() {
        data = { tipo: 'partidos' };
        const result = await sltPost("servicios/selects.php", data).then((resolve) => {
            if (resolve.ok) {
                sltGenericoLabel(resolve[0], $("#partidos-gubernatura", false));
            } else {
                swal("Error", "No hay registros de los partidos políticos", "error");
            }
        }, (reject) => console.error);
    })();*/

  $("#reg-distritos").change(function () {
    id = $("select[id=reg-distritos]").val();
    let contenido = " ";

    switch (id) {
      case "1":
        $("#reg-partidos-politicos").removeAttr("disabled");
        contenido = `<option value='' >Selecciona una opción</option><optgroup value="1" label="Partidos políticos"><option value="1">Partido Acción Nacional</option><option value="2">Partido Revolucionario Institucional</option><option value="3">Partido de la Revolución Democrática</option><option value="6">Movimiento Ciudadano</option><option value="8">Partido Encuentro Solidario</option><option value="9">Redes Sociales Progresistas</option><option value="10">Fuerza Social por México</option><option value="11">Partido Alianza Ciudadana</option><option value="12">Partido Socialista</option><option value="15">Impacto Social SI</option></optgroup><optgroup value="2" label="Coaliciones"><option value="19">Juntos Haremos Historia en Tlaxcala (MORENA/PT/PVEM/NUEVA ALIANZA TLAXCALA/ENCUENTRO SOCIAL)</option></optgroup>`;
        $("#reg-partidos-politicos").html(contenido);
        break;

      case "2":
        $("#reg-partidos-politicos").removeAttr("disabled");
        contenido = `<option value='' >Selecciona una opción</option><optgroup value="1" label="Partidos políticos"><option value="4">Partido Verde Ecologista de México</option><option value="5">Partido del Trabajo</option><option value="6">Movimiento Ciudadano</option><option value="7">Morena</option><option value="8">Partido Encuentro Solidario</option><option value="9">Redes Sociales Progresistas</option><option value="10">Fuerza Social por México</option><option value="13">Nueva Alianza Tlaxcala</option><option value="14">Encuentro Social Tlaxcala</option><option value="15">Impacto Social SI</option></optgroup><optgroup value="2" label="Coaliciones"><option value="18">Unidos por Tlaxcala (PAN/PRI/PRD/PAC/PS)</option></optgroup><optgroup value="4" label="Candidaturas independientes"><option value="20">Candidatura Independiente</option></optgroup>`;

        $("#reg-partidos-politicos").html(contenido);
        break;
      case "3":
        $("#reg-partidos-politicos").removeAttr("disabled");

        contenido = `<option value='' >Selecciona una opción</option><optgroup value="1" label="Partidos políticos"><option value="1">Partido Acción Nacional</option><option value="2">Partido Revolucionario Institucional</option><option value="3">Partido de la Revolución Democrática</option><option value="6">Movimiento Ciudadano</option><option value="8">Partido Encuentro Solidario</option><option value="9">Redes Sociales Progresistas</option><option value="10">Fuerza Social por México</option><option value="11">Partido Alianza Ciudadana</option><option value="12">Partido Socialista</option><option value="15">Impacto Social SI</option></optgroup><optgroup value="2" label="Coaliciones"><option value="19">Juntos Haremos Historia en Tlaxcala (MORENA/PT/PVEM/NUEVA ALIANZA TLAXCALA/ENCUENTRO SOCIAL)</option></optgroup>`;

        $("#reg-partidos-politicos").html(contenido);

        break;

      case "4":
        $("#reg-partidos-politicos").removeAttr("disabled");

        contenido = `<option value='' >Selecciona una opción</option><optgroup value="1" label="Partidos políticos"><option value="1">Partido Acción Nacional</option><option value="2">Partido Revolucionario Institucional</option><option value="3">Partido de la Revolución Democrática</option><option value="6">Movimiento Ciudadano</option><option value="8">Partido Encuentro Solidario</option><option value="9">Redes Sociales Progresistas</option><option value="10">Fuerza Social por México</option><option value="11">Partido Alianza Ciudadana</option><option value="12">Partido Socialista</option><option value="15">Impacto Social SI</option></optgroup><optgroup value="2" label="Coaliciones"><option value="19">Juntos Haremos Historia en Tlaxcala (MORENA/PT/PVEM/NUEVA ALIANZA TLAXCALA/ENCUENTRO SOCIAL)</option></optgroup>`;

        $("#reg-partidos-politicos").html(contenido);
        break;

      case "5":
        $("#reg-partidos-politicos").removeAttr("disabled");

        contenido = `<option value='' >Selecciona una opción</option><optgroup value="1" label="Partidos políticos"><option value="1">Partido Acción Nacional</option><option value="2">Partido Revolucionario Institucional</option><option value="3">Partido de la Revolución Democrática</option><option value="6">Movimiento Ciudadano</option><option value="8">Partido Encuentro Solidario</option><option value="9">Redes Sociales Progresistas</option><option value="10">Fuerza Social por México</option><option value="11">Partido Alianza Ciudadana</option><option value="12">Partido Socialista</option><option value="15">Impacto Social SI</option></optgroup><optgroup value="2" label="Coaliciones"><option value="19">Juntos Haremos Historia en Tlaxcala (MORENA/PT/PVEM/NUEVA ALIANZA TLAXCALA/ENCUENTRO SOCIAL)</option></optgroup>`;

        $("#reg-partidos-politicos").html(contenido);
        break;

      case "6":
        $("#reg-partidos-politicos").removeAttr("disabled");

        contenido = `<option value='' >Selecciona una opción</option><optgroup value="1" label="Partidos políticos"><option value="1">Partido Acción Nacional</option><option value="2">Partido Revolucionario Institucional</option><option value="3">Partido de la Revolución Democrática</option><option value="6">Movimiento Ciudadano</option><option value="8">Partido Encuentro Solidario</option><option value="9">Redes Sociales Progresistas</option><option value="10">Fuerza Social por México</option><option value="11">Partido Alianza Ciudadana</option><option value="12">Partido Socialista</option><option value="15">Impacto Social SI</option></optgroup><optgroup value="2" label="Coaliciones"><option value="19">Juntos Haremos Historia en Tlaxcala (MORENA/PT/PVEM/NUEVA ALIANZA TLAXCALA/ENCUENTRO SOCIAL)</option></optgroup>`;

        $("#reg-partidos-politicos").html(contenido);

        break;
      case "7":
        $("#reg-partidos-politicos").removeAttr("disabled");
        contenido = `<option value='' >Selecciona una opción</option><optgroup value="1" label="Partidos políticos"><option value="6">Movimiento Ciudadano</option><option value="8">Partido Encuentro Solidario</option><option value="9">Redes Sociales Progresistas</option><option value="10">Fuerza Social por México</option><option value="15">Impacto Social SI</option></optgroup><optgroup value="2" label="Coaliciones"><option value="18">Unidos por Tlaxcala (PAN/PRI/PRD/PAC/PS)</option><option value="19">Juntos Haremos Historia en Tlaxcala (MORENA/PT/PVEM/NUEVA ALIANZA TLAXCALA/ENCUENTRO SOCIAL)</option></optgroup>`;

        $("#reg-partidos-politicos").html(contenido);

        break;
      case "8":
        $("#reg-partidos-politicos").removeAttr("disabled");
        contenido = `<option value='' >Selecciona una opción</option><optgroup value="1" label="Partidos políticos"><option value="1">Partido Acción Nacional</option><option value="2">Partido Revolucionario Institucional</option><option value="3">Partido de la Revolución Democrática</option><option value="4">Partido Verde Ecologista de México</option><option value="5">Partido del Trabajo</option><option value="6">Movimiento Ciudadano</option><option value="7">Morena</option><option value="8">Partido Encuentro Solidario</option><option value="9">Redes Sociales Progresistas</option><option value="10">Fuerza Social por México</option><option value="11">Partido Alianza Ciudadana</option><option value="12">Partido Socialista</option><option value="13">Nueva Alianza Tlaxcala</option><option value="14">Encuentro Social Tlaxcala</option><option value="15">Impacto Social SI</option>`;

        $("#reg-partidos-politicos").html(contenido);
        break;

      case "9":
        $("#reg-partidos-politicos").removeAttr("disabled");
        contenido = `<option value='' >Selecciona una opción</option><optgroup value="1" label="Partidos políticos"><option value="6">Movimiento Ciudadano</option><option value="8">Partido Encuentro Solidario</option><option value="9">Redes Sociales Progresistas</option><option value="10">Fuerza Social por México</option><option value="15">Impacto Social SI</option></optgroup><optgroup value="2" label="Coaliciones"><option value="18">Unidos por Tlaxcala (PAN/PRI/PRD/PAC/PS)</option><option value="19">Juntos Haremos Historia en Tlaxcala (MORENA/PT/PVEM/NUEVA ALIANZA TLAXCALA/ENCUENTRO SOCIAL)</option></optgroup>`;

        $("#reg-partidos-politicos").html(contenido);

        break;

      case "10":
        $("#reg-partidos-politicos").removeAttr("disabled");
        contenido = `<option value='' >Selecciona una opción</option><optgroup value="1" label="Partidos políticos"><option value="6">Movimiento Ciudadano</option><option value="8">Partido Encuentro Solidario</option><option value="9">Redes Sociales Progresistas</option><option value="10">Fuerza Social por México</option><option value="15">Impacto Social SI</option></optgroup><optgroup value="2" label="Coaliciones"><option value="18">Unidos por Tlaxcala (PAN/PRI/PRD/PAC/PS)</option><option value="19">Juntos Haremos Historia en Tlaxcala (MORENA/PT/PVEM/NUEVA ALIANZA TLAXCALA/ENCUENTRO SOCIAL)</option></optgroup>`;

        $("#reg-partidos-politicos").html(contenido);

        break;
      case "11":
        $("#reg-partidos-politicos").removeAttr("disabled");

        contenido = `<option value='' >Selecciona una opción</option><optgroup value="1" label="Partidos políticos"><option value="1">Partido Acción Nacional</option><option value="2">Partido Revolucionario Institucional</option><option value="3">Partido de la Revolución Democrática</option><option value="6">Movimiento Ciudadano</option><option value="8">Partido Encuentro Solidario</option><option value="9">Redes Sociales Progresistas</option><option value="10">Fuerza Social por México</option><option value="11">Partido Alianza Ciudadana</option><option value="12">Partido Socialista</option><option value="15">Impacto Social SI</option></optgroup><optgroup value="2" label="Coaliciones"><option value="19">Juntos Haremos Historia en Tlaxcala (MORENA/PT/PVEM/NUEVA ALIANZA TLAXCALA/ENCUENTRO SOCIAL)</option></optgroup>`;

        $("#reg-partidos-politicos").html(contenido);

        break;

      case "12":
        $("#reg-partidos-politicos").removeAttr("disabled");
        contenido = `<option value='' >Selecciona una opción</option><optgroup value="1" label="Partidos políticos"><option value="1">Partido Acción Nacional</option><option value="2">Partido Revolucionario Institucional</option><option value="3">Partido de la Revolución Democrática</option><option value="4">Partido Verde Ecologista de México</option><option value="5">Partido del Trabajo</option><option value="6">Movimiento Ciudadano</option><option value="7">Morena</option><option value="8">Partido Encuentro Solidario</option><option value="9">Redes Sociales Progresistas</option><option value="10">Fuerza Social por México</option><option value="11">Partido Alianza Ciudadana</option><option value="12">Partido Socialista</option><option value="13">Nueva Alianza Tlaxcala</option><option value="14">Encuentro Social Tlaxcala</option><option value="15">Impacto Social SI</option>`;

        $("#reg-partidos-politicos").html(contenido);
        break;
      case "13":
        $("#reg-partidos-politicos").removeAttr("disabled");
        contenido = `<option value='' >Selecciona una opción</option><optgroup value="1" label="Partidos políticos"><option value="4">Partido Verde Ecologista de México</option><option value="5">Partido del Trabajo</option><option value="6">Movimiento Ciudadano</option><option value="7">Morena</option><option value="8">Partido Encuentro Solidario</option><option value="9">Redes Sociales Progresistas</option><option value="10">Fuerza Social por México</option><option value="13">Nueva Alianza Tlaxcala</option><option value="14">Encuentro Social Tlaxcala</option><option value="15">Impacto Social SI</option></optgroup><optgroup value="2" label="Coaliciones"><option value="18">Unidos por Tlaxcala (PAN/PRI/PRD/PAC/PS)</option></optgroup>`;

        $("#reg-partidos-politicos").html(contenido);

        break;
      case "14":
        $("#reg-partidos-politicos").removeAttr("disabled");
        contenido = `<option value='' >Selecciona una opción</option><optgroup value="1" label="Partidos políticos"><option value="4">Partido Verde Ecologista de México</option><option value="5">Partido del Trabajo</option><option value="6">Movimiento Ciudadano</option><option value="7">Morena</option><option value="8">Partido Encuentro Solidario</option><option value="9">Redes Sociales Progresistas</option><option value="10">Fuerza Social por México</option><option value="13">Nueva Alianza Tlaxcala</option><option value="14">Encuentro Social Tlaxcala</option><option value="15">Impacto Social SI</option></optgroup><optgroup value="2" label="Coaliciones"><option value="18">Unidos por Tlaxcala (PAN/PRI/PRD/PAC/PS)</option></optgroup>`;

        $("#reg-partidos-politicos").html(contenido);

        break;
      case "15":
        $("#reg-partidos-politicos").removeAttr("disabled");

        contenido = `<option value='' >Selecciona una opción</option><optgroup value="1" label="Partidos políticos"><option value="1">Partido Acción Nacional</option><option value="2">Partido Revolucionario Institucional</option><option value="3">Partido de la Revolución Democrática</option><option value="6">Movimiento Ciudadano</option><option value="8">Partido Encuentro Solidario</option><option value="9">Redes Sociales Progresistas</option><option value="10">Fuerza Social por México</option><option value="11">Partido Alianza Ciudadana</option><option value="12">Partido Socialista</option><option value="15">Impacto Social SI</option></optgroup><optgroup value="2" label="Coaliciones"><option value="19">Juntos Haremos Historia en Tlaxcala (MORENA/PT/PVEM/NUEVA ALIANZA TLAXCALA/ENCUENTRO SOCIAL)</option></optgroup>`;

        $("#reg-partidos-politicos").html(contenido);

        break;

      case "16":
        $("#reg-partidos-politicos").removeAttr("disabled");
        contenido = `<option value='' >Selecciona una opción</option><optgroup value="1" label="Partidos políticos"><option value="1">Partido Acción Nacional</option><option value="2">Partido Revolucionario Institucional</option><option value="3">Partido de la Revolución Democrática</option><option value="4">Partido Verde Ecologista de México</option><option value="5">Partido del Trabajo</option><option value="6">Movimiento Ciudadano</option><option value="7">Morena</option><option value="8">Partido Encuentro Solidario</option><option value="9">Redes Sociales Progresistas</option><option value="10">Fuerza Social por México</option><option value="11">Partido Alianza Ciudadana</option><option value="12">Partido Socialista</option><option value="13">Nueva Alianza Tlaxcala</option><option value="14">Encuentro Social Tlaxcala</option><option value="15">Impacto Social SI</option>`;

        $("#reg-partidos-politicos").html(contenido);

        break;
    }
  });

  /* $("#reg-distritos").change(async function(data) {
        id = $("select[id=reg-distritos]").val();
        console.log(id);
        if (id != 0) {
            data = { tipo: 'partidos', id_distrito: id, id_tipo_candidatura: 2 };
            await sltPost('servicios/selects.php', data).then((resolve) => {
                if (resolve.ok) {
                    console.log(resolve);
                    $("#reg-partidos-politicos").removeAttr("disabled");
                    sltGenericoLabel(resolve[0], $("#reg-partidos-politicos"));
                } else {
                    swal("Error", "No hay registros de los distritos", "error");
                    $("#reg-partidos-politicos").html("<option value=''>Selecciona una opción</option>");
                    $("#reg-partidos-politicos").attr("disabled", true);
                }
            }, (reject) => console.error);
        } else { $("#reg-partidos-politicos").attr("disabled", true); }
    });*/

  $("#reg-tipoEleccion").change(function (data) {
    id = $("select[id=reg-tipoEleccion]").val();
    if (id != 0) {
      $.ajax({
        type: "POST",
        url: "servicios/selects.php",
        data: { tipo: "distritos", id_eleccion: id },
      }).done(function (data) {
        $("#reg-distritos").removeAttr("disabled");
        sltGenerico(JSON.parse(data), $("#reg-distritos"));
      });
    } else {
      $("#reg-distritos").attr("disabled", true);
      $("#reg-distritos").html("");
    }
    $("#reg-partidos-politicos").attr("disabled", true);
    $("#reg-partidos-politicos").html("");
  });

  $("#reg-tipoEleccion").change(function () {
    var elemento = $("#reg-tipoEleccion").val();
    if (elemento == 2) {
      $("#area-prelacion").show();
    } else {
      $("#area-prelacion").hide();
    }
  });

  var pname = "";
  $(".drop-menu").hover(function () {
    $(".dropdown-menu").show();
  });

  function clearUser() {
    $("#user-name").val("");
    $("#user-app").val("");
    $("#user-apm").val("");
    $("#user-username").val("");
    $("#user-password").val("");
    $("#user-rol").val("");
  }

  $(".drop-menu").mouseleave(function () {
    $(".dropdown-menu").hide();
  });

  $(".ite-link").click(function () {
    pname = $(this).attr("data-page");
    if (pname == "exit") {
      $(".dashboard").hide();
      $(".login").show();
    } else {
      $(".contenido-pagina").hide();
      $(".ite-link").removeClass("activo");
      $(this).addClass("activo");
      $("." + pname).css("display", "block");
    }

    if (pname == "usuarios") {
      $.listarUsuarios();
    }
  });

  $(".update-user").on("click", function () {
    $("#tablaUsuarios").html();
    $.listarUsuarios();
  });

  $(".add-user").click(function () {
    $(".titulo-adminuser").html("Añadir Usuario");

    $("#cboContraseña").addClass("d-none");
    $("#passCambio").removeClass("d-none");
    $("#btns-save").html(
      '<button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button> <button type="button" class="btn btn-primary" id="btn_nuevoUsuario">Añadir Usuario</button>'
    );
    $("#modal-adminuser").modal("show");
  });

  $("#cbxCampioPass").on("change", function () {
    if ($(this).is(":checked")) {
      $("#passCambio").removeClass("d-none");
    } else {
      $("#passCambio").addClass("d-none");
    }
  });

  $(".candidato-info").click(function () {
    $("#modal-candidatura").modal("show");
  });

  function convertDate(inputFormat) {
    function pad(s) {
      return s < 10 ? "0" + s : s;
    }
    var d = new Date(inputFormat);
    return [pad(d.getDate() + 1), pad(d.getMonth() + 1), d.getFullYear()].join(
      "."
    );
  }

  $("#modal-adminuser").on("hidden.bs.modal", function () {
    clearUser(); //limpia los campós del formulario para llenar usuario
  });
});
