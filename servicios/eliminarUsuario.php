<?php
  require_once '../controladores/conndb.php';

  if ($_POST) {
    $username = $_POST["username"];
    $stmt = $DB_con->prepare("DELETE FROM usuarios WHERE usuario = '".utf8_decode($username)."' ");
    $stmt->execute();
    $res = $stmt->get_result();

    if ( $res == false) {
      $fila = array('datos' => 0);
      $respuesta = $fila;
    } else {
      $fila = array('datos'=> 1);
      $respuesta = $fila;
    }
  }
  echo json_encode($respuesta);
?>
