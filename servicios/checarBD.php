<?php
  require_once '../controladores/conndb.php';

  if ($_POST) {
    $nombre = $_POST["distrito"];
    $app = $_POST["partidopolitico"];

    $stmtpp = $DB_con->prepare("SELECT * FROM candidatura_diputado WHERE partido_politico = '".$nombre."' AND distrito = '".$app."' AND estado <> (Renuncia) ");
    $stmtpp -> execute();
    $res = $stmtpp->get_result();


    if ($res->num_rows >= 2) {
      $fila = array('datos' => 1);
      $respuesta = $fila;
    } else {
      $fila = array('datos' => 1);
      $respuesta = $fila;
    }
  }

  echo json_encode($respuesta);

 ?>
