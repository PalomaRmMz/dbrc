<?php
  require_once '../controladores/conndb.php';

  $usuario = $_POST["uname"];

  $stmt = $DB_con->prepare("SELECT
      nombre_capturista,
      app_capturista,
      apm_capturista

    FROM usuarios WHERE usuario = '".$usuario."' ");
  $stmt->execute();
  $res = $stmt->get_result();

  if($res->num_rows < 1 ) {
    $fila = array("datos" => 1);
  } else if ($res->num_rows == 1) {
    $candidatos = $res -> fetch_assoc();
    $fila = array(
      "nombre_cap" =>"". utf8_encode($candidatos["nombre_capturista"])." ".utf8_encode($candidatos["app_capturista"])." ".utf8_encode($candidatos["apm_capturista"]),
      "datos" => 2
      );
  } else {
    $fila = array('datos' => 3);
  }

  echo json_encode($fila);
 ?>