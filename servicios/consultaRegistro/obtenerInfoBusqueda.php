<?php
  require_once '../../controladores/conndb.php';

  $search = $_POST["search"];
  $query = "CALL getInfoSubsanacion('".$search."')";  
  $stmt = $DB_con->prepare($query);
  $stmt->execute();
  $res = $stmt->get_result();
  // echo var_dump($res);

  if($res->num_rows < 1 ) {
    $fila[] = array("datos" => 1);

  } else if ($res->num_rows > 1){

    $fila[] = array("datos" => 4);

    for ($i=0; $i < $res->num_rows ; $i++) {
      $item = $res->fetch_assoc();
      $fila[] = array(
        "id_reg" => $item["id"],
        "candidatura" => $item["candidatura"],
        "id_candidatura" => $item["id_candidatura"],
        "nombre" => $item["nombre"],
        "apellido_paterno" => $item["apellido_paterno"],
        "apellido_materno" => $item["apellido_materno"],
        "distrito" => $item["nombre_distrito"],
        "partido_politico" => $item["partido_politico"],
        "estado" => $item["estado"],
        "curp" => $item["curp"],
        "propietario_suplente" => $item["propietario_suplente"],
        "clave_elector" => $item["clave_elector"],
        "idDocumento" => $item["id_documento"]
      );
    }


  } else if ($res->num_rows == 1) {

    $candidatos = $res->fetch_assoc();
    $fila[] = array(
      "id_reg" => $candidatos["id"],
      "candidatura" => $candidatos["candidatura"],
      "id_candidatura" => $candidatos["id_candidatura"],
      "nombre" => $candidatos["nombre"],
      "apellido_paterno" => $candidatos["apellido_paterno"],
      "apellido_materno" => $candidatos["apellido_materno"],
      "distrito" => $candidatos["id_distrito"],
      "partido_politico" => $candidatos["partido_politico"],
      "estado" => $candidatos["estado"],
      "curp" => $candidatos["curp"],
	    "propietario_suplente" => $candidatos["propietario_suplente"],
      "clave_elector" => $candidatos["clave_elector"],
      "idDocumento" => $candidatos["id_documento"],
      "datos" => 2
      );

  } else {
    $fila[] = array('datos' => 3);
  }
  $DB_con = null;
  $stmt = null;
  echo json_encode($fila);
 ?>
