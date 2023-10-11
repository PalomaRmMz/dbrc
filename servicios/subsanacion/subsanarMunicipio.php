<?php
  require_once '../../controladores/conndb.php';
  date_default_timezone_set('America/Mexico_city');

  function subsanarMunicipal($DB_con, $datos, $historial){

      $query = verProcedimiento("CALL subsanarMunicipal(", $datos);
      $stmt = $DB_con->prepare($query);
      $stmt->execute();
      $result = $stmt->get_result();

      if($stmt->error == ""){
         $stmt = null;
         $result = null;
         $query = verProcedimiento("CALL addHistorial(", $historial);
         $stmt = $DB_con->prepare($query);
         $stmt->execute();
         $result = $stmt->get_result();

         if ( $result) {
            $fila = array('status_code' => 404, "mensaje" => "Hubo un error al subsanar los datos");
            return $respuesta = $fila;
         } else {
            $fila = array('status_code' => 200);
            return $respuesta = $fila;
         }    
      }else{
         $fila = array('status_code' => 404, "mensaje" => $stmt->error);
         return $respuesta = $fila;
      }
   }


  if ($_POST) {

   
      $datos = array(
         $candidato_nombre = mb_strtoupper($_POST["candidato_nombre_rp"]),
         $candidato_ap_paterno = mb_strtoupper($_POST["candidato_ap_paterno_rp"]),
         $candidato_ap_materno = mb_strtoupper($_POST["candidato_ap_materno_rp"]),
         $candidato_genero = $_POST["candidato_genero_rp"],
         $idTipoCandidatura = $_POST["idTipoCandidatura"],
         $candidato_clave_elector = strtoupper($_POST["candidato_clave_elector_rp"]),
         $candidato_curp = strtoupper($_POST["candidato_curp_rp"]),
      
         //nuevos campos
         $candidato_num_emision = mb_strtoupper($_POST["candidato_num_emision_rp"]),
         $candidato_ocr = mb_strtoupper($_POST["candidato_ocr_rp"]),
         $candidato_cic = mb_strtoupper($_POST["candidato_cic_rp"]),
         $candidato_seccion = mb_strtoupper($_POST["candidato_seccion_rp"]),
         // fin nuevos campos

         $candidato_fec_nacimiento = $_POST["candidato_fec_nacimiento_rp"],
         $candidato_tiempo_residencia = strtoupper($_POST["candidato_tiempo_residencia_rp"]),
         $candidato_sobrenombre = ($_POST["candidato_sobrenombre_rp"]),
         $estado = $_POST["subEstado"], 
         $usuario = $_POST["usuarioActual"],
         $tipoAccion = $_POST["tipoAccion"],
         $claveOriginal = $_POST["claveOriginal"],
         $claveNuevo = $_POST["claveNuevo"],
         $motivoRenuncia = $_POST["motivoRenuncia"],
         $dia = date("d.m.Y"),
         $hora = date("h:i:sa"),

         // INICIO DE CAMBIOS DE ULTIMA HORA
         $carta3D3 = $_POST["carta3D3"],
         $cartaEleccion = $_POST["cartaEleccion"],
         $constAutOrganoPartidista = $_POST["constAutOrganoPartidista"],
         $manifestacionIndigena = $_POST["manifestacionIndigena"],
         $consVinculoComuni = $_POST["consVinculoComuni"],
         // FIN ULTIMOS CAMBIOS DE ULTIMA HORA

         $snr = $_POST["subSNR"],
         $reg = $_POST["subREG"],
         $act = $_POST["subACTA"],
         $copia = $_POST["subCOPIA"], 
         $credencial = $_POST["subCRED"],
         $aceptacion = $_POST["subACEPTACION"],
         $separacion = $_POST["subSEPARACION"],
         $radicacion = $_POST["subCONSTANCIA"],
         $nopenales = $_POST["subCARTA"],
         $noinahbilitado = $_POST["subESCRITO"],
         $manifiesto = $_POST["subMANIFESTACION"],
         $capacidad = $_POST["subCAPACIDAD"],
         $cedularfc = $_POST["subCEDULA"],
         $email = mb_strtolower($_POST['email']),
      );

      $nombreCompleto = $candidato_nombre.' '.$candidato_ap_paterno.' '.$candidato_ap_materno;
      $idTipoCandidatura = $_POST['idTipoCandidatura'];
      $candidato_clave_elector = strtoupper($_POST["candidato_clave_elector_rp"]);
      $candidato_curp = strtoupper($_POST["candidato_curp_rp"]);
      $claveOriginal = $_POST["claveOriginal"];

      $historial = array(
         $usuario = $_POST["usuarioActual"],
         $tipoAccion = $_POST["tipoAccion"],
         $nombreCompleto,
         $candidato_clave_elector = strtoupper($_POST["candidato_clave_elector_rp"]),
         $candidato_curp = strtoupper($_POST["candidato_curp_rp"]),
         '-',
         '-',
         '-',
         $dia = date("d.m.Y"),
         $hora = date("h:i:sa"),
         $idTipoCandidatura,
         $id_partido = $_POST['id_partido'],
         $id_distrito = $_POST['id_distrito'],
         $id_municipio = $_POST['id_municipio'],
         $id_comunidad = $_POST['id_comunidad'],
         $propietario_suplente = $_POST['propietario_suplente'],
         $estado = $_POST["subEstado"]
      );

      $existeCandidato = "CALL existeSubsanacion( '$candidato_clave_elector', '$candidato_curp', '$idTipoCandidatura');";
      $stmt = $DB_con->prepare($existeCandidato);
      $stmt->execute();
      $res = $stmt->get_result();
      // echo var_dump($res);
      if($res){

         $respuesta = array( 'mensaje' => $res->fetch_assoc()['mensaje'], 'status_code' => 404);

      } else {

         if($idTipoCandidatura == 6){

            if( $claveOriginal != $candidato_clave_elector){

               $query = "SELECT * FROM `candidatura_sindicatura` WHERE candidatura_sindicatura.clave_elector = '$candidato_clave_elector' ";
               $stmt = $DB_con->prepare($query);
               $stmt->execute();
               $res = $stmt->get_result();

               if($res->num_rows == 1){
                  $respuesta = array( 'mensaje' => "Ya existe un candidato con esa clave elector en candidatura sindicos", 'status_code' => 404);
                  echo json_encode($respuesta);
                  return;
               }
            }

            $respuesta = subsanarMunicipal($DB_con, $datos, $historial);
            
         }else if($idTipoCandidatura == 7){

            if( $claveOriginal != $candidato_clave_elector){

               $query = "SELECT * FROM `candidatura_regiduria` WHERE candidatura_regiduria.clave_elector = '$candidato_clave_elector' ";
               $stmt = $DB_con->prepare($query);
               $stmt->execute();
               $res = $stmt->get_result();

               if($res->num_rows == 1){
                  $respuesta = array( 'mensaje' => "Ya existe un regidor con esa clave elector", 'status_code' => 404);
                  echo json_encode($respuesta);
                  return;
               }
            }

            $respuesta = subsanarMunicipal($DB_con, $datos, $historial);

         }else if($idTipoCandidatura == 4){

            if( $claveOriginal != $candidato_clave_elector){

               $query = "SELECT * FROM `candidatura_ayuntamiento` WHERE candidatura_ayuntamiento.clave_elector = '$candidato_clave_elector' ";
               $stmt = $DB_con->prepare($query);
               $stmt->execute();
               $res = $stmt->get_result();

               if($res->num_rows == 1){
                  $respuesta = array( 'mensaje' => "Ya existe un candidato con esa clave elector en candidatura por el ayuntamiento", 'status_code' => 404);
                  echo json_encode($respuesta);
                  return;
               }
            }
            $respuesta = subsanarMunicipal($DB_con, $datos, $historial);
         }

      }
  }
  echo json_encode($respuesta);
?>