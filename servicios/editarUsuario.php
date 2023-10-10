<?php
  require_once '../controladores/conndb.php';

  $username = $_POST["username"];

  $stmt = $DB_con->prepare("SELECT nombre_capturista, app_capturista, apm_capturista, usuario, password, rol FROM usuarios WHERE usuario = '".$username."' ");
  $stmt->execute();
  $res = $stmt->get_result();

  if ($res->num_rows < 1 ) {
    $fila = array("datos"=>1);
    $respuesta = $fila;

  } else if ($res->num_rows == 1) {

    for ($i=0; $i < $res->num_rows ; $i++) {

      $usuarios = $res->fetch_assoc();
      $fila = array(
        "nombre"=>$usuarios["nombre_capturista"],
        "app"=>$usuarios["app_capturista"],
        "apm"=>$usuarios["apm_capturista"],
        "usuario"=>$usuarios["usuario"],
        "rol"=>$usuarios["rol"],
        "password"=>$usuarios["password"],
        "datos"=>2);

         $respuesta = $fila;
    }
  } else {
    $fila = array('datos' => 3);
    $respuesta = $fila;
  }

  echo json_encode($fila);
 ?>
