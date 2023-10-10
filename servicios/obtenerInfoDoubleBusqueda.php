<?php
  require_once '../controladores/conndb.php';

  $search = $_POST["search"];
  $tipo = $_POST["tipo"];

  $stmt = $DB_con->prepare("
    SELECT
      id,
      candidatura,
      nombre,
      apellido_paterno,
      apellido_materno,
      distrito,
      partido_politico,
      estado,
      curp,
	  propietario_suplente,
      clave_elector
    FROM candidatura_diputado WHERE clave_elector = '".$search."' AND id = '".$tipo."' ");
  $stmt->execute();
  $res = $stmt->get_result();

  if($res->num_rows < 1 ) {
    $fila = array("datos" => 1);
  } else if ($res->num_rows == 1) {

    $candidatos = $res -> fetch_assoc();
    $fila = array(
      "id" => utf8_encode($candidatos["id"]),
      "candidatura" => utf8_encode($candidatos["candidatura"]),
      "nombre" => utf8_encode($candidatos["nombre"]),
      "apellido_paterno" => utf8_encode($candidatos["apellido_paterno"]),
      "apellido_materno" => utf8_encode($candidatos["apellido_materno"]),
      "distrito" => utf8_encode($candidatos["distrito"]),
      "partido_politico" => utf8_encode($candidatos["partido_politico"]),
      "estado" => utf8_encode($candidatos["estado"]),
      "curp" => utf8_encode($candidatos["curp"]),
	  "propietario_suplente" => utf8_encode($candidatos["propietario_suplente"]),
      "clave_elector" => utf8_encode($candidatos["clave_elector"]),
      "datos" => 2
      );

  } else {
    $fila = array('datos' => 3);
  }
  $DB_con = null;
  $stmt = null;
  echo json_encode($fila);
 ?>
