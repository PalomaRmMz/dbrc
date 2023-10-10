<?php
  require_once '../../controladores/conndb.php';
  date_default_timezone_set('America/Mexico_city');

  if ($_POST) {

    $usuario = $_POST["usuarioActual"];
    $tipoAccion = $_POST["tipoAccion"];
    $claveOriginal = $_POST["claveOriginal"];
    $claveNuevo = $_POST["claveNuevo"];
    $motivoRenuncia = $_POST["motivoRenuncia"];
    $dia = date("d.m.Y");
    $hora = date("h:i:sa");

    $nombre = $_POST["nombre"];
    $appRenuncia = $_POST["apellido_paterno"];
    $apmRenuncia = $_POST["apellido_materno"];

    $idTipoCandidatura = $_POST['idTipoCandidatura'];
    $idRegCandidatura = $_POST['idRegCandidatura'];


    $id_partido = $_POST['id_partido'];
    $id_distrito = $_POST['id_distrito'];
    $id_municipio = $_POST['id_municipio'];
    $id_comunidad = $_POST['id_comunidad'];
    


    $curp = $_POST['curp'];


    $datos = array( 
      $idTipoCandidatura,
      $usuario,
      $tipoAccion,
      $nombre.' '.$appRenuncia.' '.$apmRenuncia,
      $claveOriginal,
      $claveNuevo,
      $curp,
      $motivoRenuncia,
      $dia,
      $hora,
      $id_partido,
      $id_distrito,
      $id_municipio,
      $id_comunidad,
      $idRegCandidatura
    );
        
    //$queryString = 'CALL candidaturaRenuncia(?, ?, ?, ?, ?, ?, ?, ?, ?, ?);';

    $query = verProcedimiento("CALL candidaturaRenuncia( ", $datos );
    //echo var_dump($query);
    $stmt = $DB_con->prepare($query);
    $stmt->execute();
    $res = $stmt->get_result();

    if ( $res ) {
       $fila = array('datos' => 0);
       $respuesta = $fila;
    } else {
       $fila = array('datos' => 1);
       $respuesta = $fila;
    }
    $DB_con = null;
    $stmtmov = null;
    $stmtstatus = null;
    $stmtdel = null;
    $stmt = null;
  }
  echo json_encode($respuesta);
?>
