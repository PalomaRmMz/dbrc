<?php
  require_once '../../controladores/conndb.php';
  $clave_elector = $_POST["clave_elector"];


  $query = "CALL getRegistrosCandidatos('$clave_elector')";
  $stmt = $DB_con->prepare($query);
  // echo $query;
  $stmt->execute();
  $res = $stmt->get_result();
  $fila = [];


  // echo var_dump($stmt);
 
  if($stmt->error){

    $fila = array("status_code" => 404, "mensaje" => $stmt->error );

  } else {

    if( $res->num_rows < 1 ){
  
      $fila[] = array("status_code" => 0);
  
    }else if( $res->num_rows == 1 ){
  
      $candidatos = $res -> fetch_assoc();
   
      $fila[] = array(
        "nombre" => $candidatos["nombre"],
        "apellido_paterno" => $candidatos["apellido_paterno"],
        "apellido_materno" => $candidatos["apellido_materno"],
        "candidatura" => $candidatos["candidatura"],
        "id_candidatura" => $candidatos["id_candidatura"],
        "partido_politico" => $candidatos["partido_politico"],
        "distrito" => $candidatos["nombre_distrito"],
        "fec_nacimiento" => $candidatos["fec_nacimiento"],
        "genero" => $candidatos["genero"],
        "clave_elector" => $candidatos["clave_elector"],
        "curp" => $candidatos["curp"],
        "num_emision" => $candidatos["num_emision"],
        "ocr" => $candidatos["ocr"],
        "cic" => $candidatos["cic"],
        "seccion" => $candidatos["seccion"],


        "id_distrito" => $candidatos["id_distrito"],
        "id_municipio" => $candidatos["id_municipio"],
        "id_comunidad" => $candidatos["id_comunidad"],
        "id_partido" => $candidatos["id_partido"],  

        "tiempo_residencia" => $candidatos["tiempo_residencia"],
        "sobrenombre" => $candidatos["sobrenombre"],
        "prelacion" => $candidatos["prelacion"],
        "propietario_suplente" => $candidatos["propietario_suplente"],
        "id_documento" => $candidatos["id_documento"],
        "id_reg" => $candidatos["id_reg"],
        "datos" => 2,
        "email" => $candidatos["email"]
        );
  
    }else if( $res->num_rows > 1 ) {

      $fila[] = array("status_code" => 1);
      while( $item = $res->fetch_assoc() ) {
        $fila[] = array(
  
          "nombre" => $item["nombre"],
          "apellido_paterno" => $item["apellido_paterno"],
          "apellido_materno" => $item["apellido_materno"],
          "candidatura" => $item["candidatura"],
          "id_candidatura" => $item["id_candidatura"],
          "partido_politico" => $item["partido_politico"],
          "distrito" => $item["nombre_distrito"],
          "fec_nacimiento" => $item["fec_nacimiento"],
          "genero" => $item["genero"],
          "clave_elector" => $item["clave_elector"],
          "curp" => $item["curp"],
          "num_emision" => $candidatos["num_emision"],
          "ocr" => $candidatos["ocr"],
          "cic" => $candidatos["cic"],
          "seccion" => $candidatos["seccion"],
          "tiempo_residencia" => $item["tiempo_residencia"],
          "sobrenombre" => $item["sobrenombre"],
          "prelacion" => $item["prelacion"],
          "propietario_suplente" => $item["propietario_suplente"],
          "id_documento" => $item["id_documento"],
          "id_reg" => $item["id_reg"],
          "email" => $item["email"],
          );
      }
      
    }
  }

  $DB_con = null;
  $stmt = null;
  //echo $fila;
  echo json_encode($fila);
?>
