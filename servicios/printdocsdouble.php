<?php

   require_once '../controladores/conndb.php';

   $search = $_POST["search"];
   $id = $_POST["id"];
   $stmt = $DB_con->prepare("SELECT * FROM candidatura_documentado WHERE id = '".$id."' AND clave_elector = '".$search."' ");
   $stmt->execute();

    if($stmt -> rowCount() < 1 ) {
      $fila = array("datos" => 1);
    } else if ($stmt -> rowCount() == 1) {

      $candidatodocs = $stmt ->fetch(PDO::FETCH_ASSOC);
      $fila = array(
       "SNR" => utf8_encode($candidatodocs["doc_snr_ine"]),
       "ACT" => utf8_encode($candidatodocs["act_de_nacimiento"]),
       "SNR" => utf8_encode($candidatodocs["doc_snr_ine"]),
       "COPIA" => utf8_encode($candidatodocs["copia_act_de_nacimiento"]),
       "SEPARACION" => utf8_encode($candidatodocs["const_separacion_cargo"]),
       "ESCRITO" => utf8_encode($candidatodocs["escrito_bajo"]),
       "NP" => utf8_encode($candidatodocs["const_act_no_penales"]),
       "REG" => utf8_encode($candidatodocs["solicitud_registro"]),
       "CRED" => utf8_encode($candidatodocs["cred_para_votar"]),
       "ACEPTACION" => utf8_encode($candidatodocs["const_acept_postulacion"]),
       "RESIDENCIA" => utf8_encode($candidatodocs["const_residencia"]),
       "MANIFIESTO" => utf8_encode($candidatodocs["manifiesto"]),
       "CAPACIDAD" => utf8_encode($candidatodocs["capacidad_economica"]),
       "RFC" => utf8_encode($candidatodocs["cedula_rfc"]),
       "datos" => 2
       );

    } else {
      $fila = array('datos' => 3);
    }
    $DB_con = null;
    $stmt = null;
    echo json_encode($fila);

 ?>
