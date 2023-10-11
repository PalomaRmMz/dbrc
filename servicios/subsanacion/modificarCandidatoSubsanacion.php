<?php
  require_once '../../controladores/conndb.php';
  date_default_timezone_set('America/Mexico_city');

  if ($_POST) {

    $candidato_nombre = mb_strtoupper($_POST["candidato_nombre_rp"]);
    $candidato_ap_paterno = mb_strtoupper($_POST["candidato_ap_paterno_rp"]);
    $candidato_ap_materno = mb_strtoupper($_POST["candidato_ap_materno_rp"]);
    $candidato_fec_nacimiento = $_POST["candidato_fec_nacimiento_rp"];
    $candidato_genero = $_POST["candidato_genero_rp"];
    $candidato_clave_elector = strtoupper($_POST["candidato_clave_elector_rp"]);
    $candidato_curp = strtoupper($_POST["candidato_curp_rp"]);
    $candidato_tiempo_residencia = strtoupper($_POST["candidato_tiempo_residencia_rp"]);
    $candidato_sobrenombre = ($_POST["candidato_sobrenombre_rp"]);
    $estado = $_POST["subEstado"];

   //nuevos campos
   $candidato_num_emision = mb_strtoupper($_POST["candidato_num_emision_rp"]);
   $candidato_ocr = mb_strtoupper($_POST["candidato_ocr_rp"]);
   $candidato_cic = mb_strtoupper($_POST["candidato_cic_rp"]);
   $candidato_seccion = mb_strtoupper($_POST["candidato_seccion_rp"]);

   $id_distrito = $_POST['id_distrito'];
   $id_municipio = $_POST['id_municipio'];
   $id_comunidad = $_POST['id_comunidad'];
   $id_partido = $_POST['id_partido'];
   $propietario_suplente = $_POST['propietario_suplente'];


   // fin nuevos campos

    $usuario = $_POST["usuarioActual"];
    $tipoAccion = $_POST["tipoAccion"];
    $claveOriginal = $_POST["claveOriginal"];
    $claveNuevo = $_POST["claveNuevo"];

    $motivoRenuncia = $_POST["motivoRenuncia"];

    $dia = date("d.m.Y");
    $hora = date("h:i:sa");


    $carta3D3 = $_POST["carta3D3"];
    $cartaEleccion = $_POST["cartaEleccion"];
    $constAutOrganoPartidista = $_POST["constAutOrganoPartidista"];
    $manifestacionIndigena = $_POST["manifestacionIndigena"];
    $consVinculoComuni = $_POST["consVinculoComuni"];

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


    $query = "
    UPDATE candidatura_diputado
    SET
      nombre = '".$candidato_nombre."',
      apellido_paterno = '".$candidato_ap_paterno."',
      apellido_materno = '".$candidato_ap_materno."',
      fec_nacimiento = '".$candidato_fec_nacimiento."',
      genero = '".$candidato_genero."',
      clave_elector = '".$candidato_clave_elector."',
      curp = '".$candidato_curp."',

      num_emision =  '".$candidato_num_emision."',
      ocr =  '".$candidato_ocr."',
      cic =  '".$candidato_cic."',
      seccion =  '".$candidato_seccion."',


      tiempo_residencia = '".$candidato_tiempo_residencia."',
      estado = '".$estado."',
      sobrenombre = '".$candidato_sobrenombre."',
      email = '".$email."'
      WHERE clave_elector = '".$claveOriginal."' AND candidatura = '".$idTipoCandidatura."' ";
    $stmt= $DB_con->prepare($query);

        $stmt->execute();
        $res = $stmt->get_result();


        // guarda documentacion
        $stmt2 = $DB_con->prepare('
        UPDATE candidatura_documentado
        SET

        carta_3_3 = "'.$carta3D3.'",
        carta_reeleccion = "'.$cartaEleccion.'",
        const_autorizacion_organo = "'.$constAutOrganoPartidista.'",
        manifes_autoadcripcion = "'.$manifestacionIndigena.'",
        constancia_vinculo_comuni = "'.$consVinculoComuni.'",

         doc_snr_ine = "'.$snr.'",
         act_de_nacimiento  = "'.$act.'",
         copia_act_de_nacimiento  = "'.$copia.'",
         const_separacion_cargo  = "'.$separacion.'",
         escrito_bajo  = "'.$noinahbilitado.'",
         const_act_no_penales   = "'.$nopenales.'",
         solicitud_registro  = "'.$reg.'",
         cred_para_votar   = "'.$credencial.'",
         const_acept_postulacion  = "'.$aceptacion.'",
         const_residencia   = "'.$radicacion.'",
         manifiesto  = "'.$manifiesto.'",
         capacidad_economica  = "'.$capacidad.'",
         cedula_rfc  = "'.$cedularfc.'"
         WHERE clave_elector = "'.$claveOriginal.'"  AND id_tipo_registro = "'.$idTipoCandidatura.'" ');
        //echo var_dump($stmt2);
         $stmt2->execute();
         $res2 = $stmt2->get_result();


         //  Actualiza la clave de elector cuando se subsana un la clave de elector
        $stmtdoc= $DB_con->prepare("UPDATE candidatura_documentado SET clave_elector = '".utf8_decode($candidato_clave_elector)."' WHERE clave_elector = '".$claveOriginal."' AND id_tipo_registro = ".$idTipoCandidatura." ");
        $stmtdoc->execute();
        // Actualiza la clave de elector cuando se subsana un la clave de elector
        if($candidato_clave_elector != $claveOriginal){
            $queryH = "UPDATE historial SET clv_original = '".utf8_decode($candidato_clave_elector)."' WHERE clv_original = '".$claveOriginal."'  AND id_tipo_eleccion = ".$idTipoCandidatura." ";
            $stmthistorial= $DB_con->prepare($queryH);
            $stmthistorial->execute();
        }
         // Guarda en Historial 

         $nombreCompleto = $candidato_nombre.' '.$candidato_ap_paterno.' '.$candidato_ap_materno;
         $query = "
         INSERT INTO historial values(null, '$usuario', '$tipoAccion', '$nombreCompleto' , '$candidato_clave_elector',  '-',  '-', '$candidato_curp', '-', '$dia', '$hora',
          '$idTipoCandidatura', '$id_partido','$id_distrito', '$id_municipio', '$id_comunidad', '$propietario_suplente', '$estado')";
          //echo $query;
         $stmt = $DB_con->prepare($query);
         $stmt->execute();
         $res3 = $stmt->get_result();
      if ( $res3) {
         $fila = array('datos' => 0);
         $respuesta = $fila;
      } else {
         $fila = array('datos' => 1);
         $respuesta = $fila;
      }
  }
  echo json_encode($respuesta);
?>
