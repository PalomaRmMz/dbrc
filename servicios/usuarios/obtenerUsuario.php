<?php
    require_once '../../controladores/conndb.php';

    $usuarioActual = $_POST["usuarioActual"];
    

    $stmt = $DB_con->prepare("SELECT nombre_capturista, app_capturista, apm_capturista, usuario, rol FROM usuarios WHERE usuario = '".$usuarioActual."' ");
    $stmt->execute();
    $res = $stmt->get_result();


    if ($res->num_rows < 1) {
      $fila = array("datos"=>1);
      $respuesta = $fila;
    } else if($res->num_rows == 1){

      for ($i=0; $i < $res->num_rows ; $i++) {
        $usuarios = $res->fetch_assoc();
        $fila = array("nombre_act"=>$usuarios["nombre_capturista"],
                      "app_act"=>$usuarios["app_capturista"],
                      "apm_act"=>$usuarios["apm_capturista"],
                      "usuario_act"=>$usuarios["usuario"],
                      "rol"=>$usuarios["rol"],
                      "datos"=>2);
        $respuesta = $fila;
      }
      
    } else {
      $fila = array('datos' => 0);
      $respuesta = $fila;
    }
  $DB_con = null;
  $stmt = null;   
  echo json_encode($fila);
?>
