<?php
  require_once '../controladores/conndb.php';
  if ($_POST) {
    $nombre = mb_strtoupper($_POST["nombre"]);
    $apellidoPaterno = mb_strtoupper($_POST["apellidoPaterno"]);
    $apellidoMaterno = mb_strtoupper($_POST["apellidoMaterno"]);
    $nombreDUsuario = $_POST["nombreDUsuario"];
    $userpassword = $_POST["userpassword"];
    $userrol = $_POST["userrol"];
 

    $query = "call nuevoUsuario( '$nombre', '$apellidoPaterno', '$apellidoMaterno', '$nombreDUsuario', '$userpassword', '$userrol', 'Activo' );";
    $stmt = $DB_con->prepare($query);
    // echo $query;
    $stmt->execute();
    $res = $stmt->get_result();

    if ($stmt->affected_rows == 1) {
      $fila = array('datos' => 1);
      $respuesta = $fila;
    } else {
      $fila = array('datos' => 2);
      $respuesta = $fila;
    }

  } else {
    $fila = array('datos' => 0);
    $respuesta = $fila;
  }

  echo json_encode($respuesta);
?>
