<?php
  require_once '../controladores/conndb.php';

  $clave_elector = $_POST["clave_elector"];
  $tipo = $_POST["tipo"];

  $stmt = $DB_con->prepare("
    SELECT
      id,
      nombre,
      apellido_paterno,
      apellido_materno,
      candidatura,
      partido_politico,
      distrito,
      fec_nacimiento,
      genero,
      clave_elector,
      curp,
      tiempo_residencia,
      sobrenombre,
      prelacion,
      propietario_suplente
    FROM candidatura_diputado WHERE clave_elector = '".$clave_elector."' AND candidatura = '".$tipo."' ");
  $stmt->execute();

  if($stmt -> rowCount() < 1 ) {
    $fila = array("datos" => 1);
  }  else if ($stmt -> rowCount() == 2){
    $fila = array("datos" => 3);
  } else if ($stmt -> rowCount() == 1) {
    $candidatos = $stmt -> fetch(PDO::FETCH_ASSOC);
    $fila = array(
      "id" => utf8_encode($candidatos["id"]),
      "nombre" => utf8_encode($candidatos["nombre"]),
      "apellido_paterno" => utf8_encode($candidatos["apellido_paterno"]),
      "apellido_materno" => utf8_encode($candidatos["apellido_materno"]),
      "candidatura" => utf8_encode($candidatos["candidatura"]),
      "partido_politico" => utf8_encode($candidatos["partido_politico"]),
      "distrito" => utf8_encode($candidatos["distrito"]),
      "fec_nacimiento" => utf8_encode($candidatos["fec_nacimiento"]),
      "genero" => utf8_encode($candidatos["genero"]),
      "clave_elector" => utf8_encode($candidatos["clave_elector"]),
      "curp" => utf8_encode($candidatos["curp"]),
      "tiempo_residencia" => utf8_encode($candidatos["tiempo_residencia"]),
      "sobrenombre" => utf8_encode($candidatos["sobrenombre"]),
      "prelacion" => utf8_encode($candidatos["prelacion"]),
      "propietario_suplente" => utf8_encode($candidatos["propietario_suplente"]),
      "datos" => 2
      );
  } else {
    $fila = array('datos' => 3);
  }
  $DB_con = null;
  $stmt = null;
  echo json_encode($fila);
 ?>
