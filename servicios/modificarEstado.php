<?php
  require_once '../controladores/conndb.php';

  if ($_POST) {

    
    $username = $_POST["username"];
    $estado = $_POST["uestado"];
    
    $stmt= $DB_con->prepare("UPDATE usuarios SET user_estado = '".utf8_decode($estado)."' WHERE usuario = '".$username."' ");
    $stmt->execute();
    $res = $stmt->get_result();

    if($estado != "Activo"){
      session_destroy();
    }

    if ( $stmt->affected_rows == 0 ) {
      $fila = array('datos' => 0);
      $respuesta = $fila; 
    } else {
      $fila = array('datos' => 1);
      $respuesta = $fila;
    }
  }
  
  echo json_encode($respuesta);
?>
