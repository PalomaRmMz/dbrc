<?php
  require_once '../../controladores/conndb.php';

  $clave_elector = $_POST["clave_elector"];
  $query = "CALL getInfoCandidato('".$clave_elector."')";
  $stmt = $DB_con->prepare($query);
  $stmt->execute();
  $res = $stmt->get_result();

  if($res->num_rows < 1 ) {
    $fila[] = array("datos" => 1);

  } else if ($res->num_rows == 1) {

    $candidatos = $res -> fetch_assoc();
    $fila[] = array(
      "id_reg" => $candidatos["id"],
      "nombre" => $candidatos["nombre"],
      "apellido_paterno" => $candidatos["apellido_paterno"],
      "apellido_materno" => $candidatos["apellido_materno"],
      "propietario_suplente" => $candidatos["propietario_suplente"],
      "curp" => $candidatos["curp"],

      "num_emision" => $candidatos["num_emision"],
      "cic" => $candidatos["cic"],
      "ocr" => $candidatos["ocr"],
      "seccion" => $candidatos["seccion"],

      "code_candidatura" =>  $candidatos["candidatura"],
      "candidatura" => $candidatos["nombre_candidatura"],
      "distrito" => $candidatos["nombre_distrito"],

      "id_distrito" => $candidatos["id_distrito"],
      "id_municipio" => $candidatos["id_municipio"],
      "id_comunidad" => $candidatos["id_comunidad"],

      "lugarnacimiento" => $candidatos["lugarnacimiento"],
      "partido_politico" => $candidatos["nombre_partido_politico"],
      "id_partido" => $candidatos["id_partido"],
      "genero" => $candidatos["genero"],
      "propietario_suplente" => $candidatos["propietario_suplente"],
      "estado" => $candidatos["estado"],
      "prelacion" => $candidatos["prelacion"],
      "datos" => 2
      );
  } else if( $res->num_rows > 1 ) {
    
    $fila[] = array('datos' => 3);

    while( $item = $res->fetch_assoc() ) {
      $fila[] = array(
      "id_reg" => $item["id"],
      "nombre" => $item["nombre"],
      "apellido_paterno" => $item["apellido_paterno"],
      "apellido_materno" => $item["apellido_materno"],
      "propietario_suplente" => $item["propietario_suplente"],
      "curp" => $item["curp"],
      
      "num_emision" => $candidatos["num_emision"],
      "cic" => $candidatos["cic"],
      "ocr" => $candidatos["ocr"],
      "seccion" => $candidatos["seccion"],
      "code_candidatura" =>  $item["candidatura"],
      "candidatura" => $item["nombre_candidatura"],
      "distrito" => $item["nombre_distrito"],
      "id_distrito" => $candidatos["id_distrito"],
      "id_municipio" => $candidatos["id_municipio"],
      "id_comunidad" => $candidatos["id_comunidad"],
      "lugarnacimiento" => $item["lugarnacimiento"],
      "partido_politico" => $item["nombre_partido_politico"],
      "genero" => $item["genero"],
      "propietario_suplente" => $candidatos["propietario_suplente"],
      "estado" => $candidatos["estado"],
      "prelacion" => $item["prelacion"],
      );
    }


  }
  $DB_con = null;
  $stmt = null;
  echo json_encode($fila);
 ?>




    