<?php
  require_once '../controladores/conndb.php';

if ($_POST) {
    $username = $_POST["username"];


    $stmt= $DB_con->prepare("UPDATE usuarios SET user_estado = 'Inactivo' WHERE usuario = '".$username."' ");
    $stmt->execute();
    $res = $stmt->get_result();
   
    if ( $stmt->affected_rows > 0 ) {
      $fila = array('datos' => 0);
      $respuesta = $fila; 
    } else {
      $fila = array('datos' => 1);
      $respuesta = $fila;
    }
  }

  echo json_encode($respuesta);
?>
