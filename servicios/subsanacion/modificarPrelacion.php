<?php
  require_once '../../controladores/conndb.php';
  date_default_timezone_set('America/Mexico_city');

  if ($_POST) {

    $candidato_nombre = mb_strtoupper($_POST["candidato_nombre_rp"]);
    $candidato_ap_paterno = mb_strtoupper($_POST["candidato_ap_paterno_rp"]);
    $candidato_ap_materno = mb_strtoupper($_POST["candidato_ap_materno_rp"]);

    $candidato_prelacion = $_POST["candidato_preprelacion"];

    $candidato_fec_nacimiento = $_POST["candidato_fec_nacimiento_rp"];
    $candidato_genero = $_POST["candidato_genero_rp"];

    $candidato_partidopolitico = $_POST["candidato_partidopolitico"];
    $candidato_clave_elector = strtoupper($_POST["candidato_clave_elector_rp"]);
    $candidato_curp = strtoupper($_POST["candidato_curp_rp"]);
    $candidato_tiempo_residencia = strtoupper($_POST["candidato_tiempo_residencia_rp"]);
    $candidato_sobrenombre = ($_POST["candidato_sobrenombre_rp"]);

    $candidato_num_emision = mb_strtoupper($_POST["candidato_num_emision_rp"]);
    $candidato_ocr = mb_strtoupper($_POST["candidato_ocr_rp"]);
    $candidato_cic = mb_strtoupper($_POST["candidato_cic_rp"]);
    $candidato_seccion = mb_strtoupper($_POST["candidato_seccion_rp"]);
 
    $id_distrito = $_POST['id_distrito'];
    $id_municipio = $_POST['id_municipio'];
    $id_comunidad = $_POST['id_comunidad'];
    $id_partido = $_POST['id_partido'];
    $propietario_suplente = $_POST['propietario_suplente'];

    $candidato_prosup = $_POST["candidato_prosup"];
    $estado = $_POST["subEstado"];
    
    $usuario = $_POST["usuarioActual"];
    $tipoAccion = $_POST["tipoAccion"];
    $claveOriginal = $_POST["claveOriginal"];
    $claveNuevo = $_POST["claveNuevo"];

    $motivoRenuncia = $_POST["motivoRenuncia"];
    $dia = date("d.m.Y");
    $hora = date("h:i:sa");

    $snr = $_POST["subSNR"];
    $reg = $_POST["subREG"];
    $act = $_POST["subACTA"];
    $copia = $_POST["subCOPIA"];
    $credencial = $_POST["subCRED"];
    $aceptacion = $_POST["subACEPTACION"];
    $separacion = $_POST["subSEPARACION"];
    $radicacion = $_POST["subCONSTANCIA"];
    $nopenales = $_POST["subCARTA"];
    $noinahbilitado = $_POST["subESCRITO"];
    $manifiesto = $_POST["subMANIFESTACION"];
    $capacidad = $_POST["subCAPACIDAD"];
    $cedularfc = $_POST["subCEDULA"];
    $idTipoCandidatura = $_POST["idTipoCandidatura"];
    $email = $_POST['email'];
    $email = mb_strtolower($email);

    $stmtprelacion = $DB_con->prepare("SELECT * FROM candidatura_diputado WHERE candidatura = 'REPRESENTACIÓN PROPORCIONAL' AND partido_politico = '".utf8_decode($candidato_partidopolitico)."' AND prelacion = '".$candidato_prelacion."' AND propietario_suplente = '".$candidato_prosup."' ");
    $stmtprelacion->execute();
    $res = $stmtprelacion->get_result();

    if($res->num_rows > 0){

      $stmtchange= $DB_con->prepare("
        UPDATE candidatura_diputado
        SET
          prelacion = ''
          WHERE candidatura = 'REPRESENTACIÓN PROPORCIONAL' AND partido_politico = '".utf8_decode($candidato_partidopolitico)."' AND prelacion = '".$candidato_prelacion."' AND propietario_suplente = '".$candidato_prosup."' ");
      $stmtchange->execute();
      $res2 = $stmtchange->get_result();


      $stmt= $DB_con->prepare("
        UPDATE candidatura_diputado
        SET
          nombre = '".utf8_decode($candidato_nombre)."',
          apellido_paterno = '".utf8_decode($candidato_ap_paterno)."',
          apellido_materno = '".utf8_decode($candidato_ap_materno)."',
          fec_nacimiento = '".utf8_decode($candidato_fec_nacimiento)."',
          genero = '".utf8_decode($candidato_genero)."',
          clave_elector = '".utf8_decode($candidato_clave_elector)."',
          curp = '".utf8_decode($candidato_curp)."',


          num_emision =  '".$candidato_num_emision."',
          ocr =  '".$candidato_ocr."',
          cic =  '".$candidato_cic."',
          seccion =  '".$candidato_seccion."',


          tiempo_residencia = '".utf8_decode($candidato_tiempo_residencia)."',
          estado = '".utf8_decode($estado)."',
          sobrenombre = '".utf8_decode($candidato_sobrenombre)."',
          prelacion = '".utf8_decode($candidato_prelacion)."',
          email = '".$email."'
          WHERE clave_elector = '".$claveOriginal."' AND candidatura = ".$idTipoCandidatura." ");
          $stmt->execute();

          /* Guarda documentación */
          $stmt2 = $DB_con->prepare('
          UPDATE candidatura_documentado
          SET
             doc_snr_ine = "'.utf8_decode($snr).'",
             act_de_nacimiento  = "'.utf8_decode($act).'",
             copia_act_de_nacimiento  = "'.utf8_decode($copia).'",
             const_separacion_cargo  = "'.utf8_decode($separacion).'",
             escrito_bajo  = "'.utf8_decode($noinahbilitado).'",
             const_act_no_penales   = "'.utf8_decode($nopenales).'",
             solicitud_registro  = "'.utf8_decode($reg).'",
             cred_para_votar   = "'.utf8_decode($credencial).'",
             const_acept_postulacion  = "'.utf8_decode($aceptacion).'",
             const_residencia   = "'.utf8_decode($radicacion).'",
             manifiesto  = "'.utf8_decode($manifiesto).'",
             capacidad_economica  = "'.utf8_decode($capacidad).'",
             cedula_rfc  = "'.utf8_decode($cedularfc).'"
             WHERE clave_elector = "'.$claveOriginal.'" AND id_tipo_registro = "'.$idTipoCandidatura.'"  ');

           $stmt2->execute();
      /*  Actualiza la clave de elector cuando se subsana un la clave de elector*/
      $stmtdoc= $DB_con->prepare("UPDATE candidatura_documentado SET clave_elector = '".utf8_decode($candidato_clave_elector)."' WHERE clave_elector = '".$claveOriginal."' AND id_tipo_registro = '".$idTipoCandidatura."'  ");
      $stmtdoc->execute();
      if($candidato_clave_elector != $claveOriginal){
        /*  Actualiza la clave de elector cuando se subsana un la clave de elector*/
        $stmtdoc= $DB_con->prepare("UPDATE historial SET clv_original = '".utf8_decode($candidato_clave_elector)."' WHERE clv_original = '".$claveOriginal."' ");
        $stmtdoc->execute();
        /* Guarda en Historial  */
      }
      

      $nombreCompleto = $candidato_nombre.' '.$candidato_ap_paterno.' '.$candidato_ap_materno;
      $query = "INSERT INTO historial values(null, '$usuario', '$tipoAccion', '$nombreCompleto' , '$candidato_clave_elector',  '-',  '-', '$candidato_curp', '-', '$dia', '$hora',
          '$idTipoCandidatura', '$id_partido','$id_distrito', '$id_municipio', '$id_comunidad', '$propietario_suplente', '$estado' )";
      //echo $query;
      $stmt = $DB_con->prepare($query);
      $stmt->execute();


      $fila = array('datos' => 2);
      $respuesta = $fila;

    } else {
      $stmt= $DB_con->prepare("
        UPDATE candidatura_diputado
        SET
          nombre = '".utf8_decode($candidato_nombre)."',
          apellido_paterno = '".utf8_decode($candidato_ap_paterno)."',
          apellido_materno = '".utf8_decode($candidato_ap_materno)."',
          fec_nacimiento = '".utf8_decode($candidato_fec_nacimiento)."',
          genero = '".utf8_decode($candidato_genero)."',
          clave_elector = '".utf8_decode($candidato_clave_elector)."',
          curp = '".utf8_decode($candidato_curp)."',


          num_emision =  '".$candidato_num_emision."',
          ocr =  '".$candidato_ocr."',
          cic =  '".$candidato_cic."',
          seccion =  '".$candidato_seccion."',
    
          
          tiempo_residencia = '".utf8_decode($candidato_tiempo_residencia)."',
          estado = '".utf8_decode($estado)."',
          sobrenombre = '".utf8_decode($candidato_sobrenombre)."',
          prelacion = '".utf8_decode($candidato_prelacion)."',
          email = '".$email."'
          WHERE clave_elector = '".$claveOriginal."' AND candidatura = '".$idTipoCandidatura."'  ");
          $stmt->execute();

          /* Guarda documentación */
          $stmt2 = $DB_con->prepare('
          UPDATE candidatura_documentado
          SET
             doc_snr_ine = "'.utf8_decode($snr).'",
             act_de_nacimiento  = "'.utf8_decode($act).'",
             copia_act_de_nacimiento  = "'.utf8_decode($copia).'",
             const_separacion_cargo  = "'.utf8_decode($separacion).'",
             escrito_bajo  = "'.utf8_decode($noinahbilitado).'",
             const_act_no_penales   = "'.utf8_decode($nopenales).'",
             solicitud_registro  = "'.utf8_decode($reg).'",
             cred_para_votar   = "'.utf8_decode($credencial).'",
             const_acept_postulacion  = "'.utf8_decode($aceptacion).'",
             const_residencia   = "'.utf8_decode($radicacion).'",
             manifiesto  = "'.utf8_decode($manifiesto).'",
             capacidad_economica  = "'.utf8_decode($capacidad).'",
             cedula_rfc  = "'.utf8_decode($cedularfc).'"
             WHERE clave_elector = "'.$claveOriginal.'" AND id_tipo_registro = "'.$idTipoCandidatura.'"  ');

           $stmt2->execute();
      /*  Actualiza la clave de elector cuando se subsana un la clave de elector*/
          $stmtdoc= $DB_con->prepare("UPDATE candidatura_documentado SET clave_elector = '".utf8_decode($candidato_clave_elector)."' WHERE clave_elector = '".$claveOriginal."' AND id_tipo_registro = '".$idTipoCandidatura."'  ");
          $stmtdoc->execute();

          if($candidato_clave_elector != $claveOriginal){
            /*  Actualiza la clave de elector cuando se subsana un la clave de elector*/
            $stmtdoc= $DB_con->prepare("UPDATE historial SET clv_original = '".utf8_decode($candidato_clave_elector)."' WHERE clv_original = '".$claveOriginal."' AND id_tipo_eleccion = '".$idTipoCandidatura."'  ");
            $stmtdoc->execute();
            /* Guarda en Historial  */
          }
          

        $nombreCompleto = $candidato_nombre.' '.$candidato_ap_paterno.' '.$candidato_ap_materno;
         $query = "INSERT INTO historial values(null, '$usuario', '$tipoAccion', '$nombreCompleto' , '$candidato_clave_elector',  '-',  '-', '$candidato_curp', '-', '$dia', '$hora',
          '$idTipoCandidatura', '$id_partido','$id_distrito', '$id_municipio', '$id_comunidad', '$propietario_suplente', '$estado' )";
          //echo $query;
          $stmt = $DB_con->prepare($query);
          $stmt->execute();

          $fila = array('datos' => 1);
          $respuesta = $fila;
    }

/*
      if ( $stmt == false ) {
         $fila = array('datos' => 0);
         $respuesta = $fila;
      } else {
         $fila = array('datos' => 1);
         $respuesta = $fila;
      } */
  }
  echo json_encode($respuesta);
?>
