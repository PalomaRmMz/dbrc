<?php

   require_once '../../controladores/conndb.php';

   $search = $_POST["search"];
   $id_documento  = $_POST['id_documento'];

   $stmt = $DB_con->prepare("SELECT * FROM candidatura_documentado WHERE clave_elector = '".$search."' AND id = '".$id_documento."' ");
   $stmt->execute();
   $res = $stmt->get_result();

    if($res->num_rows < 1 ) {
      
      $fila[] = array("datos" => 1);

    } else if ($res->num_rows == 1) {

      $candidatodocs = $res->fetch_assoc();

      // con FILTER_VALIDATE_BOOLEAN y el metodo filter_var transformo el string true o false a boleano

      $fila[] = array(
       "SNR" => filter_var($candidatodocs["doc_snr_ine"], FILTER_VALIDATE_BOOLEAN),
       "ACT" => filter_var($candidatodocs["act_de_nacimiento"], FILTER_VALIDATE_BOOLEAN),
       "SNR" => filter_var($candidatodocs["doc_snr_ine"], FILTER_VALIDATE_BOOLEAN),
       "COPIA" => $candidatodocs["copia_act_de_nacimiento"],
       "SEPARACION" => $candidatodocs["const_separacion_cargo"],
       "ESCRITO" => filter_var($candidatodocs["escrito_bajo"], FILTER_VALIDATE_BOOLEAN),
       "NP" => filter_var($candidatodocs["const_act_no_penales"], FILTER_VALIDATE_BOOLEAN),
       "REG" => filter_var($candidatodocs["solicitud_registro"], FILTER_VALIDATE_BOOLEAN),
       "CRED" => filter_var($candidatodocs["cred_para_votar"], FILTER_VALIDATE_BOOLEAN),
       "ACEPTACION" => filter_var($candidatodocs["const_acept_postulacion"], FILTER_VALIDATE_BOOLEAN),
       "RESIDENCIA" => filter_var($candidatodocs["const_residencia"], FILTER_VALIDATE_BOOLEAN),
       "MANIFIESTO" => filter_var($candidatodocs["manifiesto"], FILTER_VALIDATE_BOOLEAN),
       "CAPACIDAD" => filter_var($candidatodocs["capacidad_economica"], FILTER_VALIDATE_BOOLEAN),
       "RFC" => filter_var($candidatodocs["cedula_rfc"], FILTER_VALIDATE_BOOLEAN),

       "CARTA3" => filter_var($candidatodocs["carta_3_3"], FILTER_VALIDATE_BOOLEAN),
       "CARTA_REELECCION" => $candidatodocs["carta_reeleccion"],
       "CONST_AUTORIZACION" => $candidatodocs["const_autorizacion_organo"],
       "MANIFES_AUTOADCRIPCION" => $candidatodocs["manifes_autoadcripcion"],
       "CONSTANCIA_VINCULO" => $candidatodocs["constancia_vinculo_comuni"],


       "datos" => 2
       );

    } else {
      $fila[] = array('datos' => 3);
    }
    $DB_con = null;
    $stmt = null; 
    echo json_encode($fila);

 ?>
