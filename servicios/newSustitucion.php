<?php
  require_once '../controladores/conndb.php';
  date_default_timezone_set('America/Mexico_city');
  if($_POST){
    $nombre = $_POST["nombreSustitucion"];
    $app = $_POST["appSustitucion"];
    $apm = $_POST["apmSustitucion"];
    $genero = $_POST["generoSustitucion"];
    $pp = $_POST["partidoCandidatura"];
    $candidatura = $_POST["tipoCandidatura"];
    $clv = $_POST["claveElector"];
    $curp = $_POST["curpSustitucion"];
    $distrito = $_POST["distritoSustitucion"];

    $fechaReg = $_POST["fechanacimiento"];
    $estado = $_POST["estado"];
    $prelacion = $_POST["prelacion"];
    $usuario = $_POST["capturista"];

    $tiempoResidencia = $_POST["timeSustitucion"];
    $alias = $_POST["aliasSustitucion"];
    $prosup = $_POST["newsup"];

      //Validaciones para valorar en la base de Datos
    $nombre =mb_strtoupper($nombre,'UTF-8');
    $app =mb_strtoupper($app,'UTF-8');
    $apm =mb_strtoupper($apm,'UTF-8');
    $clv = strtoupper($clv);
    $curp = strtoupper($curp);
    $tiempoResidencia = strtoupper($tiempoResidencia);

    //documentacion
    $snr = $_POST["docsnr"];
    $reg = $_POST["regcandidatura"];
    $act = $_POST["acta"];
    $copia = $_POST["copiaacta"];
    $credencial = $_POST["credencial"];
    $aceptacion = $_POST["aceptacion"];
    $separacion = $_POST["supSeparacion"];
    $radicacion = $_POST["radicacion"];
    $nopenales = $_POST["noPenales"];
    $noinahbilitado = $_POST["noInahbilitado"];
    $manifiesto = $_POST["manifiesto"];
    $capacidad = $_POST["capacidad"];
    $cedularfc = $_POST["cedularfc"];

    $clvBaja = $_POST["clvBaja"];

    //Historial
    $usuario = $_POST["usuario"];
    $tipoAccion = "Sustitucion";
    $claveOriginal = $_POST["claveOriginal"];
    $claveNuevo = $_POST["claveNuevo"];
    $motivoRenuncia = $_POST["motivoRenuncia"];
    $dia = date("d.m.Y");
    $hora = date("h:i:sa");

    $stmtclv = $DB_con->prepare("SELECT * FROM candidatura_diputado WHERE clave_elector = '".$clv."' ");
    $stmtclv->execute();
    $res1 = $stmtclv->get_result();

    $stmtcurp = $DB_con->prepare("SELECT * FROM candidatura_diputado WHERE curp = '".$curp."' ");
    $stmtcurp->execute();
    $res2 = $stmtcurp->get_result();


    if ($res1->num_rows == 1) {
      $fila = array('datos' => 1);
      $respuesta = $fila;
    } else if($res2->num_rows == 1) {
      $fila = array('datos' => 2);
      $respuesta = $fila;
    } else {

      $stmt = $DB_con->prepare('INSERT INTO candidatura_diputado(nombre, apellido_paterno, apellido_materno, genero, partido_politico, candidatura, clave_elector, curp, distrito, fec_nacimiento, tiempo_residencia, sobrenombre, estado, user_capturista, propietario_suplente, prelacion) VALUES ("'.utf8_decode($nombre).'",
      "'.utf8_decode($app).'", "'.utf8_decode($apm).'", "'.utf8_decode($genero).'", "'.utf8_decode($pp).'", "'.utf8_decode($candidatura).'", "'.utf8_decode($clv).'", "'.utf8_decode($curp).'", "'.utf8_decode($distrito).'",   "'.utf8_decode($fechaReg).'",
      "'.utf8_decode($tiempoResidencia).'", "'.utf8_decode($alias).'", "'.utf8_decode($estado).'", "'.utf8_decode($usuario).'", "'.utf8_decode($prosup).'", "'.utf8_decode($prelacion).'"); ');
      $stmt->execute();
      $res = $stmt->get_result();


      $stmtdocs = $DB_con->prepare('INSERT INTO candidatura_documentado(clave_elector, doc_snr_ine, act_de_nacimiento, copia_act_de_nacimiento, const_separacion_cargo, escrito_bajo, const_act_no_penales, solicitud_registro, cred_para_votar, const_acept_postulacion, const_residencia, manifiesto, capacidad_economica, cedula_rfc)
      VALUES ("'.utf8_decode($clv).'", "'.utf8_decode($snr).'", "'.utf8_decode($act).'", "'.utf8_decode($copia).'", "'.utf8_decode($separacion).'",
      "'.utf8_decode($noinahbilitado).'", "'.utf8_decode($nopenales).'", "'.utf8_decode($reg).'", "'.utf8_decode($credencial).'", "'.utf8_decode($aceptacion).'", "'.utf8_decode($radicacion).'", "'.utf8_decode($manifiesto).'", "'.utf8_decode($capacidad).'", "'.utf8_decode($cedularfc).'");');

      $stmtdocs->execute();
      $res = $stmtdocs->get_result();
      // $stmtbaja = $DB_con->prepare("UPDATE candidatura_diputado SET estado = 'Baja' WHERE curp = '".$clvBaja."' ");
      // $stmtbaja->execute();

      $stmtHistory= $DB_con->prepare('INSERT INTO historial(usuario, tipo, nombre_clv, clv_original, nombre_clv_nuevo, clv_nuevo, motivo, dia, hora VALUES ( "'.utf8_decode($usuario).'", "'.utf8_decode($tipoAccion).'", "'.utf8_decode($nombre).''.utf8_decode($app).''.utf8_decode($apm).'", "'.utf8_decode($claveOriginal).'", "Nombre_nuevo", "'.utf8_decode($claveNuevo).'", "'.utf8_decode($motivoRenuncia).'", "'.utf8_decode($dia).'", "'.utf8_decode($hora).'" );');
      $stmtHistory->execute();

      $fila = array('datos' => 3);
      $respuesta = $fila;

      $stmtmov = $DB_con->prepare("INSERT INTO candidatura_renuncia(nombre, apellido_paterno, apellido_materno, genero, partido_politico, candidatura, clave_elector, curp, distrito, fec_nacimiento, tiempo_residencia, sobrenombre, estado, user_capturista, propietario_suplente, prelacion) SELECT nombre, apellido_paterno, apellido_materno, genero, partido_politico, candidatura, clave_elector, curp, distrito, fec_nacimiento, tiempo_residencia, sobrenombre, estado, user_capturista, propietario_suplente, prelacion FROM candidatura_diputado WHERE clave_elector = '".utf8_decode($claveOriginal)."' ");
    $stmtmov->execute();

    $stmtdel = $DB_con->prepare("DELETE FROM candidatura_diputado WHERE clave_elector = '".utf8_decode($claveOriginal)."' ");
    $stmtdel->execute();
    }
/*
    if($stmt->num_rows == 1){
      $fila = array('datos' => 1);
      $respuesta = $fila;
    } else {
      $fila = array('datos' => 2);
      $respuesta = $fila;
    } */
  } else {
    $fila = array('datos' => 0);
    $respuesta = $fila;
  }

  echo json_encode($respuesta);
?>
