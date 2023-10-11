<?php
  require_once '../../controladores/conndb.php';
  
  $tipo_eleccion = $_POST['tipo_eleccion'];
  $origen = $_POST['distrito'];
  $partido = $_POST['partido'];
  $tipo_candidatura = $_POST['tipo_candidatura'];
  $estado = $_POST['estado'];
  $genero = $_POST['genero'];
  $municipio = $_POST['municipio'];

  $datos =  array(
    $tipo_eleccion,
    $origen,
    $partido,
    $tipo_candidatura,
    $estado,
    $genero,
    $municipio
  );

  if($tipo_eleccion == 'Todos'){

    $datos = array(
      $tipo_candidatura, $estado, $genero
    );
    //este procedimiento es para todos los reportes 
    $query = verProcedimiento("Call getReportsAll(", $datos);
    //echo $query; 

    //consulta de solo comunidades para elecciones extraordinarias
    // $query = "SELECT 
    // candidatura_comunidad.nombre,
    // candidatura_comunidad.apellido_paterno,
    // candidatura_comunidad.apellido_materno,
    // candidatura_comunidad.genero,
    // candidatura_comunidad.propietario_suplente,
    // partidos_politicos.nombre_partido as nombre_partido_politico,
    // candidatura_comunidad.clave_elector,
          
    // candidatura_comunidad.num_emision,
    //       candidatura_comunidad.ocr,
    //       candidatura_comunidad.cic,
    //       candidatura_comunidad.seccion,
    //       candidatura_comunidad.fec_nacimiento,
    //       timestampdiff(Year,fec_nacimiento,'2021-06-06') as edad,
    // municipios.nombre_municipio as nombre_distrito,
    //       comunidades.nombre_comunidad,
    //       '' as num_regidor,
    // tipo_eleccion.nombre as nombre_candidatura,
    // candidatura_comunidad.estado,
    //       historial.dia
    // FROM candidatura_comunidad, tipo_eleccion, partidos_politicos, municipios, historial, comunidades
    // WHERE 
    // historial.clv_original = candidatura_comunidad.clave_elector
    //       AND historial.id_tipo_eleccion = candidatura_comunidad.candidatura
    //       AND historial.id_partido = candidatura_comunidad.partido_politico
    //       AND historial.tipo = 'Registro'
          
    //       AND candidatura_comunidad.partido_politico = partidos_politicos.id_partido
    // AND municipios.id_municipio = candidatura_comunidad.id_municipio
    // AND tipo_eleccion.id_eleccion = candidatura_comunidad.candidatura
    //       AND comunidades.id_comunidad = candidatura_comunidad.id_comunidad";
  }else {
 
    $query = verProcedimiento("CALL getInfoReportes( ", $datos );

  }
  

  $stmt = $DB_con -> prepare($query);
  // echo $query;
  $stmt -> execute();
  $res = $stmt->get_result();
  // echo var_dump($stmt);

  if( $stmt->error ){
    $fila = array( 
        'mensaje' => $stmt->error,
        "status_code" => 404
      );

  }else{

    if ($res->num_rows < 1) {

      $fila[] = array("datos" => 1);
  
    } else if($res->num_rows > 0){
  
      for ($i=0; $i < $res->num_rows ; $i++) {
        $candidatura_diputado = $res->fetch_assoc();
  
        $fila[] = array(
          "nombre"=>$candidatura_diputado["nombre"],
          "app"=>$candidatura_diputado["apellido_paterno"],
          "apm"=>$candidatura_diputado["apellido_materno"],
          "genero"=>$candidatura_diputado["genero"],
          "prosup"=>$candidatura_diputado["propietario_suplente"],
          "pp"=>$candidatura_diputado["nombre_partido_politico"],
          "clave"=>$candidatura_diputado["clave_elector"],

          "num_emision"=>$candidatura_diputado["num_emision"],
          "ocr"=>$candidatura_diputado["ocr"],
          "cic"=>$candidatura_diputado["cic"],
          "seccion"=>$candidatura_diputado["seccion"],


          "distrito"=>$candidatura_diputado["nombre_distrito"],
          "candidatura"=>$candidatura_diputado["nombre_candidatura"],
          "estado"=>$candidatura_diputado["estado"],
          "dia"=>$candidatura_diputado["dia"],
          "fecha_nacimiento"=>$candidatura_diputado["fec_nacimiento"],
          "edad"=>$candidatura_diputado["edad"],
          "nombre_comunidad"=>$candidatura_diputado["nombre_comunidad"],

        );
      }
  
    } else {
      $fila = array("datos"=>0);
    }
  }

  echo json_encode($fila);
 
 ?>
