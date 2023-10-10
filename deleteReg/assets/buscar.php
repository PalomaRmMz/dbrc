<?php
 require_once 'conndb.php';

 $clave = $_POST["clave"];
 $tipo = $_POST["tipo"];

 $stmt = $DB_con->prepare("SELECT * FROM candidatura_diputado WHERE clave_elector = '".$clave."' AND candidatura = '".utf8_decode($tipo)."' ");
 $stmt->execute();

  if ($stmt->rowCount() == 1) {
     $candidatos = $stmt ->fetch(PDO::FETCH_ASSOC);
      $fila = array(
        "nombre" => utf8_encode($candidatos["nombre"]),
        "apellido_paterno" => utf8_encode($candidatos["apellido_paterno"]),
        "apellido_materno" => utf8_encode($candidatos["apellido_materno"]),
        "candidatura" => utf8_encode($candidatos["candidatura"]),
        "distrito" => utf8_encode($candidatos["distrito"]),
        "partido_politico" => utf8_encode($candidatos["partido_politico"]),
        "curp" => utf8_encode($candidatos["curp"]),
        "user_capturista"=>utf8_encode($candidatos["user_capturista"]),
        'exito' => 1
        );
  } else {
    $fila = array("exito" => 2);
  }

 echo json_encode($fila);

?>
