<?php
  session_start() or die('Error iniciando gestor de variables de sesión');


  require_once '../controladores/conndb.php';
  date_default_timezone_set('America/Mexico_city');

  if ($_POST) {


    $logUsuario = $_POST["logUsuario"];
    $logPassword = $_POST["logPassword"];

    session_regenerate_id();

    $sesion_id = session_id();

    $query = "call validarUsuario( '$logUsuario', '$logPassword');";
    $stmt = $DB_con->prepare($query);
    $stmt->execute();
    $res = $stmt->get_result();

    $stmt = null;

    if ($res->num_rows == 0) {
      $fila = array('exito' => 0);
      $respuesta = $fila;
    } else if ($res->num_rows == 1){
      
      $usuarios = $res->fetch_assoc();

      $fila = array('nombre'=>$usuarios["nombre_capturista"],
      'app'=>$usuarios["app_capturista"],
      'usuarioact'=>$usuarios["usuario"],
      'rol'=>$usuarios["rol"],
      'estado'=>$usuarios["user_estado"],
      'exito'=>1);
      
      $respuesta = $fila; 
      
      $_SESSION['usuario'] = $usuarios["usuario"];
      $_SESSION['id'] = $sesion_id;
      $stmtUsus = $DB_con->prepare("UPDATE usuarios SET usuarios.sesion_id = '$sesion_id' WHERE usuarios.usuario = '$logUsuario'; ");
      $stmtUsus->execute();
      
    }

  } else {
    $fila = array('exito' => 2);
    $respuesta = $fila;
  }
  echo json_encode($respuesta);
?>
