<?php
  require_once '../../controladores/conndb.php';
  date_default_timezone_set('America/Mexico_city');

  if ($_POST) {

    $nombre = mb_strtoupper($_POST["nombreSustitucion"]);
    $app = mb_strtoupper($_POST["appSustitucion"]);
    $apm = mb_strtoupper($_POST["apmSustitucion"]);
    $candidatura = $_POST["tipoCandidatura"];
    $pp = $_POST["partidoCandidatura"];
    $clv = strtoupper($_POST["clvSustitucion"]);
    $curp = strtoupper($_POST["curpSustitucion"]);


    $id_partido = strtoupper($_POST["id_partido"]);
    $id_distrito = strtoupper($_POST["id_distrito"]);
    $id_municipio = strtoupper($_POST["id_municipio"]);
    $id_comunidad = strtoupper($_POST["id_comunidad"]);

    $candidato_num_emision = strtoupper($_POST["candidato_num_emision"]);
    $candidato_ocr = strtoupper($_POST["candidato_ocr"]);
    $candidato_cic = strtoupper($_POST["candidato_cic"]);
    $candidato_seccion = strtoupper($_POST["candidato_seccion"]);


    $distrito = $_POST["distritoCandidatura"];
    $fechaReg = $_POST["fecnacnew"];
    $lugarNacimiento = $_POST["lugarNacimiento"];
    $tiempoResidencia = $_POST["timeSustitucion"];
    $alias = strtoupper($_POST["aliasSustitucion"]);
    $estado = $_POST["estado"];
    $usuario = $_POST["usuarioActual"];
    $prelacion = $_POST["newprelacion"];
    $idRegistro = $_POST['idRegistroSus'];
    $nombreOriginal = mb_strtoupper($_POST["nombreOriginal"]);
    $appOriginal = mb_strtoupper($_POST["appOriginal"]);
    $apmOriginal = mb_strtoupper($_POST["apmOriginal"]);


    // INICIO DE CAMBIOS DE ULTIMA HORA
    $newCarta3D3 = $_POST["newCarta3D3"];
    $newCartaEleccion = $_POST["newCartaEleccion"];
    $newConstAutOrganoPartidista = $_POST["newConstAutOrganoPartidista"];
    $newManifestacionIndigena = $_POST["newManifestacionIndigena"];
    $newConsVinculoComuni = $_POST["newConsVinculoComuni"];
    // FIN DE CAMBIOS DE ULTIMA HORA

    $snr = $_POST["newSNR"];
    $reg = $_POST["newReg"];
    $act = $_POST["newAct"];
    $copia = $_POST["newCopia"];
    $cred = $_POST["newCred"];
    $aceptacion = $_POST["newAceptacion"];
    $separacion = $_POST["newSeparacion"];
    $rad = $_POST["newRad"];
    $np = $_POST["newNP"];
    $inahbilitado = $_POST["newInahbilitado"];
    $me = $_POST["newME"];
    $ce = $_POST["newCE"];
    $cp = $_POST["newCP"];
    /* Clave Original */
    $claveOriginal = $_POST["claveOriginal"];
    $motivoSustitucion = $_POST["motivoSustitucion"];
    /* dia hora fecha */
    $dia = date("d.m.Y");
    $hora = date("h:i:sa");
    $email = $_POST['email'];
    $email = mb_strtolower($email);


    
    $stmtclv = $DB_con->prepare("SELECT * FROM candidatura_ayuntamiento WHERE clave_elector = '".$clv."' AND candidatura =  $candidatura ");
    $stmtclv->execute();
    $res1 = $stmtclv->get_result();
    $stmtcurp = $DB_con->prepare("SELECT * FROM candidatura_ayuntamiento WHERE curp = '".$curp."' ");
    $stmtcurp->execute();
    $res2 = $stmtcurp->get_result();


    if($res1->num_rows > 0){
      $fila = array('datos' => 1);
      $respuesta = $fila;
    } else if($res2->num_rows > 0) {
      $fila = array('datos' => 2);
      $respuesta = $fila;
    } else {
      /* Ingresamos la información  */


      /* Movemos y eliminamos el registro anterior */
      $stmtmov = $DB_con->prepare("
      
      INSERT INTO candidatura_renuncia( 
        nombre, apellido_paterno, apellido_materno, genero, partido_politico, candidatura, clave_elector, curp, num_emision, ocr, cic, seccion, distrito, municipio, comunidad, fec_nacimiento,
        tiempo_residencia, sobrenombre, estado, user_capturista, propietario_suplente, prelacion, fecha_registro)
        
        SELECT nombre, apellido_paterno, apellido_materno, genero, partido_politico, candidatura, clave_elector, curp, num_emision, ocr, cic, seccion, 'Circunscripción única' as distrito, id_municipio, 0 , fec_nacimiento, tiempo_residencia,
        sobrenombre, estado, user_capturista, propietario_suplente, '00' as prelacion, '$dia' as fecha_registro
        FROM candidatura_ayuntamiento 
        WHERE candidatura_ayuntamiento.clave_elector = '$claveOriginal';

      ");
      $stmtmov->execute();

      $stmtstatus = $DB_con->prepare("UPDATE candidatura_renuncia SET estado = 'Sustitucion' WHERE clave_elector = '".utf8_decode($claveOriginal)."' AND candidatura = 4 ");
      $stmtstatus->execute();


      $stmt = $DB_con->prepare("UPDATE candidatura_ayuntamiento SET 
         nombre = '".$nombre."',
         apellido_paterno = '".$app."',
         apellido_materno = '".$apm."',
         fec_nacimiento = '".$fechaReg."',
         lugarnacimiento = '".$lugarNacimiento."',
         clave_elector = '".$clv."',
         curp = '".$curp."',

         num_emision =  '".$candidato_num_emision."',
         ocr =  '".$candidato_ocr."',
         cic =  '".$candidato_cic."',
         seccion =  '".$candidato_seccion."',

         tiempo_residencia = '".$tiempoResidencia."',
         sobrenombre = '".$alias."',
         user_capturista = '".$usuario."',
         estado = '".$estado."',
         email = '".$email."'
      WHERE clave_elector = '".$claveOriginal."' AND candidatura = ".$candidatura."  ");
      $stmt->execute();

      /* Ingresamos la documentacion  */

      $documentos = array(
        $clv,

        $newCarta3D3,
        $newCartaEleccion,
        $newConstAutOrganoPartidista,
        $newManifestacionIndigena,
        $newConsVinculoComuni,

        $snr,
        $act,
        $copia,
        $separacion,
        $inahbilitado,
        $np,
        $reg,
        $cred,
        $aceptacion,
        $rad,
        $me,
        $ce,
        $cp,
        $candidatura,
        $claveOriginal
      );

      $queryDocument = verProcedimiento("CALL updateDocument(", $documentos);
      //echo $queryDocument;

      $insertarDocumentacion = "CALL updateDocument(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
      $stmt2 = $DB_con->prepare($queryDocument);
      $stmt2->execute();

      //$stmtdel->execute();
      /* Sustitucion en historial */
      $nombreCompleto = $nombreOriginal.' '.$appOriginal.' '.$apmOriginal;
      $nombre2 = $nombre.' '.$app.' '.$apm;
      
      $prop_sup = $_POST["propietario_suplente"];

      $strings = "INSERT INTO historial VALUES(null, '$usuario', 'Sustitucion', '$nombreCompleto' , '$claveOriginal', '$nombre2', '$clv', '$curp' ,'$motivoSustitucion', '$dia', 
      '$hora', '$candidatura', '$id_partido', '$id_distrito', '$id_municipio', '$id_comunidad', '$prop_sup', '$estado' );";

      $stmthistory= $DB_con->prepare($strings);      
      $stmthistory->execute();

      /* Registro en historial */
      $queryHistorial = "INSERT INTO historial VALUES(null, '$usuario', 'Registro', '".$nombre.' '.$app.' '.$apm."' , '$clv', '-', '-', '$curp' ,'-', '$dia', 
      '$hora', '$candidatura', '$id_partido', '$id_distrito', '$id_municipio', '$id_comunidad','$prop_sup', '$estado' );";
      $stmthistorial= $DB_con->prepare($queryHistorial);
      $stmthistorial->execute();

      $fila = array('datos' => 3);
      $respuesta = $fila;

    }
  } else {
    $fila = array('datos' => 0);
    $respuesta = $fila;
  }

  echo json_encode($respuesta);

 ?>
