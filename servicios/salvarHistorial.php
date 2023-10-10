<?php
  require_once '../controladores/conndb.php';

  $usuario = $_POST["usuario"];
  $usuario_Nombre = $_POST["usuario_nombre"];
  $tipoAccion = $_POST["tipo"];
  $nombre_clv = $_POST["claveOriginal_nombre"];
  $claveOriginal = $_POST["claveOriginal"];
  $nombre_clv_nuevo = $_POST["claveNuevo_nombre"];
  $claveNuevo = $_POST["claveNuevo"];
  $motivoRenuncia = $_POST["motivo"];
  $dia = date("d.m.Y");
  $hora = date("h:i:sa");

  if ($_POST) {
    $query = 'INSERT INTO historial(usuario, usuario_nombre, tipo, nombre_clv, clv_original, nombre_clv_nuevo, clv_nuevo, motivo, dia, hora) VALUES ( "'.utf8_decode($usuario).'", "'.utf8_decode($usuario_Nombre).'", "'.utf8_decode($tipoAccion).'", "'.utf8_decode($nombre_clv).'", "'.utf8_decode($claveOriginal).'","'.utf8_decode($nombre_clv_nuevo).'", "'.utf8_decode($claveNuevo).'", "'.utf8_decode($motivoRenuncia).'", "'.utf8_decode($dia).'", "'.utf8_decode($hora).'" );';
    echo $query;
    $stmt= $DB_con->prepare($query);
    $stmt->execute();
    $res = $stmt->get_result();


    if ( $res ) {
      $fila = array('datos' => 0);
      $respuesta = $fila;
    } else {
      $fila = array('datos' => 1);
      $respuesta = $fila;
    }
  }

  echo json_encode($respuesta);
?>
