<?php
  require_once '../controladores/conndb.php';

  if ($_POST) {
    $username = $_POST["username"];
    $nombre = $_POST["nombre"];
    $apellidoPaterno = $_POST["apellidoPaterno"];
    $apellidoMaterno = $_POST["apellidoMaterno"];
    $usuario = $_POST["nombreDUsuario"];
    $password = $_POST["userpassword"];
    $rol = $_POST["userrol"];

    $query = "call editarUsuario('$nombre', '$apellidoPaterno', '$apellidoMaterno', '$usuario', '$password', '$rol');";
    $stmt= $DB_con->prepare($query);    
    $stmt->execute();

    if( $stmt->error ){
      $respuesta = array( "status_code" => 400, "mensaje" => $stmt->error );
    }else {

      if ( $stmt->affected_rows == 0 ) {
        $fila = array('status_code' => 404, "mensaje" => 'No se modificó ningún registro');
        $respuesta = $fila; 
      } else {
        $fila = array('status_code' => 200, "Mensaje se modifico correctamente");
        $respuesta = $fila;
      }
    }
  }
  echo json_encode($respuesta);
?>
