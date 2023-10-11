<?php
  require_once '../controladores/conndb.php';

  if ($_POST) {
    $usuario = $_POST["usuario"];
    $tipoAccion = $_POST["tipoAccion"];
    $claveOriginal = $_POST["claveOriginal"];
    $claveNuevo = $_POST["claveNuevo"];
    $motivoRenuncia = $_POST["motivoRenuncia"];
    $dia = $_POST["dia"];
    $hora = $_POST["hora"];

    $stmt= $DB_con->prepare('INSERT INTO historial(usuario, tipo, clv_original, clv_nuevo, motivo, dia, hora) VALUES ( "'.utf8_decode($usuario).'", "'.utf8_decode($tipoAccion).'", "'.utf8_decode($claveOriginal).'", "'.utf8_decode($claveNuevo).'", "'.utf8_decode($motivoRenuncia).'", "'.utf8_decode($dia).'", "'.utf8_decode($hora).'" );');
    $stmt->execute();
    $res = $stmt->get_result();
    
    if ( $res == false ) {
       $fila = array('datos' => 0);
       $respuesta = $fila;
    } else {
       $fila = array('datos' => 1);
       $respuesta = $fila;
    }
  }
  echo json_encode($respuesta);
?>
