<?php
  require_once '../controladores/conndb.php';

  $stmt = $DB_con->prepare('SELECT nombre_capturista, app_capturista, apm_capturista, usuario, rol, user_estado FROM usuarios');
  $stmt->execute();
  $res = $stmt->get_result();


  if ($res->num_rows < 1) {
    $fila = array("datos"=>1);
    $lista[] = $fila;

  }else if($res->num_rows > 0){

    for ($i=0; $i< $res->num_rows ; $i++) {
      $usuarios = $res->fetch_assoc();
      $fila = array("nombre"=>$usuarios["nombre_capturista"],
         "app"=>$usuarios["app_capturista"],
         "apm"=>$usuarios["apm_capturista"],
         "usuario"=>$usuarios["usuario"],
         "rol"=>$usuarios["rol"],
         "estado"=>$usuarios["user_estado"]);
      $lista[] = $fila;
    }
  } else {
    $fila = array("datos"=>0);
    $lista[] = $fila;
  }

  echo json_encode($lista);
 ?>
