<?php
  require_once '../../controladores/conndb.php';

  $clave_elector = $_POST["clave_elector"];

  $stmt = $DB_con->prepare("CALL getInfoCandidato('".$clave_elector."')");
  $stmt->execute();
  $res = $stmt->get_result();

  $result = [];

  if($res->num_rows < 1 ) {
    $result[] = array("datos" => 1);
  } 
  if( $res->num_rows ==  1 ) {

    for ($i=0; $i < $res->num_rows ; $i++) {
      $item = $res->fetch_assoc();
      $result[] = array(
        "id" => $item["id"],
        "nombre" => $item["nombre"],
        "apellido_paterno" => $item["apellido_paterno"],
        "apellido_materno" => $item["apellido_materno"],
        "propietario_suplente" => $item["propietario_suplente"],
        "curp" => $item["curp"],

        "num_emision" => $item["num_emision"],
        "cic" => $item["cic"],
        "ocr" => $item["ocr"],
        "seccion" => $item["seccion"],

        "id_distrito" => $item["id_distrito"],
        "id_municipio" => $item["id_municipio"],
        "id_comunidad" => $item["id_comunidad"],
        "id_partido" => $item["id_partido"],


        "code_candidatura" => $item["candidatura"],
        "candidatura" => $item["nombre_candidatura"],
        "distrito" => $item["nombre_distrito"],
        "partido_politico" => $item["nombre_partido_politico"],
        "genero" => $item["genero"],
        "datos" => 2
      );
    }
  }else if( $res->num_rows > 1 ){

    $result[] = array( "datos" => 3 );

    for ($i=0; $i < $res->num_rows ; $i++) {
      $item = $res->fetch_assoc();
      $result[] = array(
          "id" => $item["id"],
          "nombre" => $item["nombre"],
          "apellido_paterno" => $item["apellido_paterno"],
          "apellido_materno" => $item["apellido_materno"],
          "propietario_suplente" => $item["propietario_suplente"],
          "curp" => $item["curp"],

          "num_emision" => $item["num_emision"],
          "cic" => $item["cic"],
          "ocr" => $item["ocr"],
          "seccion" => $item["seccion"],
  
          "id_distrito" => $item["id_distrito"],
          "id_municipio" => $item["id_municipio"],
          "id_comunidad" => $item["id_comunidad"],
          "id_partido" => $item["id_partido"],  


          "code_candidatura" => $item["candidatura"],
          "candidatura" => $item["nombre_candidatura"],
          "distrito" => $item["nombre_distrito"],
          "partido_politico" => $item["nombre_partido_politico"],
          "genero" => $item["genero"]
      );
  }
  }

  $DB_con = null;
  $stmt = null;
  echo json_encode($result);
 ?>
