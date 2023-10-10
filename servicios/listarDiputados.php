<?php
  require_once '../controladores/conndb.php';

  $stmt = $DB_con->prepare('SELECT nombre, apellido_paterno, apellido_materno, genero, partido_politico, clave_elector, distrito, estado, propietario_suplente FROM candidatura_diputado');
  $stmt->execute();
  $res = $stmt->get_result();

  if ($res->num_rows < 1) {
    $fila = array("datos"=>1);
    $lista[] = $fila;
  } else if($res->num_rows > 0){
    for ($i=0; $i < $res->num_rows ; $i++) {
      $candidatura_diputado = $stmt->fetch_assoc();
      $fila = array("nombre"=>utf8_encode($candidatura_diputado["nombre"]),
                    "app"=>utf8_encode($candidatura_diputado["apellido_paterno"]),
                    "apm"=>utf8_encode($candidatura_diputado["apellido_materno"]),
                    "genero"=>utf8_encode($candidatura_diputado["genero"]),
                    "prosup"=>utf8_encode($candidatura_diputado["propietario_suplente"]),
                    "pp"=>utf8_encode($candidatura_diputado["partido_politico"]),
                    "clave"=>utf8_encode($candidatura_diputado["clave_elector"]),
                    "distrito"=>utf8_encode($candidatura_diputado["distrito"]),
                    "estado"=>utf8_encode($candidatura_diputado["estado"]));
                    $lista[] = $fila;
    }
  } else {
    $fila = array("datos"=>0);
    $lista[] = $fila;
  }

  echo json_encode($lista);
 ?>
