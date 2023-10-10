<?php
  require_once '../controladores/conndb.php';
  
  $valores = isset($_POST['inputs']) ? $_POST['inputs'] : [];
  
  for( $i = 0; $i < count($valores); $i++ ){
    switch($valores[$i]['nombre']){
      case 'tipo_eleccion_repo': $valores[$i]['nombre'] = "candidatura"; break;
      case 'distrito_repo': $valores[$i]['nombre'] = "distrito"; break;
      case 'partido_repo': $valores[$i]['nombre'] = "partido_politico"; break;
      case 'tipo_candidatura_repo': $valores[$i]['nombre'] = "propietario_suplente"; break;
      case 'estado_repo': $valores[$i]['nombre'] = "estado"; break;
      case 'genero_repo': $valores[$i]['nombre'] = "genero"; break;
    }
  }

  $query_add = "";

  for( $i = 0; $i < count($valores); $i++) {
    if($i == 0){
      $query_add = " WHERE " .$valores[$i]["nombre"]." = '".$valores[$i]["valor"]."' ";
    }else {
      $query_add = $query_add .= " AND ". $valores[$i]['nombre']." = '".$valores[$i]['valor']."' ";
    }
  } 

  $query_str = "
  SELECT 
    candidatura_diputado.nombre,
    candidatura_diputado.apellido_paterno,
    candidatura_diputado.apellido_materno,
    candidatura_diputado.genero,
    candidatura_diputado.propietario_suplente,
    combinaciones.nombre as nombre_partido_politico,
    candidatura_diputado.clave_elector,
    distrito.nombre as nombre_distrito,
    tipo_eleccion.nombre as nombre_candidatura,
    candidatura_diputado.estado
  FROM candidatura_diputado, tipo_eleccion, combinaciones, distrito";

  $col = str_replace("candidatura_diputado", "candidatura_renuncia", $query_str);

  $other_query = " UNION " . $col;

  $and = sizeof($valores) < 1 ? "WHERE": "AND";
  
  $query_idD = " $and tipo_eleccion.id_eleccion = candidatura_diputado.candidatura AND combinaciones.id_combinaciones = candidatura_diputado.partido_politico AND 
  distrito.id_distrito = candidatura_diputado.distrito";

  $query_idR = str_replace("candidatura_diputado", "candidatura_renuncia", $query_idD);

  $query_str = $query_str . $query_add . $query_idD . $other_query . $query_add . $query_idR;
  // echo var_dump($query_str);

  $stmt = $DB_con -> prepare($query_str);
  $stmt -> execute();
  $fila = [];

  if ($stmt->rowCount() < 1) {
    $fila[] = array("datos" => 1);

  } else if($stmt->rowCount() > 0){

    for ($i=0; $i < $stmt->rowCount() ; $i++) {
      $candidatura_diputado = $stmt->fetch(PDO::FETCH_ASSOC);
      $fila[] = array("nombre"=>utf8_encode($candidatura_diputado["nombre"]),
                    "app"=>utf8_encode($candidatura_diputado["apellido_paterno"]),
                    "apm"=>utf8_encode($candidatura_diputado["apellido_materno"]),
                    "genero"=>utf8_encode($candidatura_diputado["genero"]),
                    "prosup"=>utf8_encode($candidatura_diputado["propietario_suplente"]),
                    "pp"=>$candidatura_diputado["nombre_partido_politico"],
                    "clave"=>utf8_encode($candidatura_diputado["clave_elector"]),
                    "distrito"=>utf8_encode($candidatura_diputado["nombre_distrito"]),
                    "candidatura"=>utf8_encode($candidatura_diputado["nombre_candidatura"]),
                    "estado"=>utf8_encode($candidatura_diputado["estado"]));
    }
  } else {
    $fila = array("datos"=>0);
  }

  echo json_encode($fila);
 
 ?>
