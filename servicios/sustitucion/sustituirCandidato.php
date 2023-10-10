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
    $distrito = $_POST["distritoCandidatura"];
    $id_partido = $_POST['id_partido'];
    
    $id_distrito = $_POST['id_distrito'];
    $id_municipio = $_POST['id_municipio'];
    $id_comunidad = $_POST['id_comunidad'];


    $fechaReg = $_POST["fecnacnew"];

    $lugarNacimiento = $_POST["lugarNacimiento"];
    $tiempoResidencia = $_POST["timeSustitucion"];
    $alias = strtoupper($_POST["aliasSustitucion"]);

    $genero = $_POST["genero"];
    $propietario_suplente = $_POST["propietario_suplente"];
    $estado = $_POST["estado"];

    $usuario = $_POST["usuarioActual"];
    $prelacion = $_POST["newprelacion"];
    $idRegistro = $_POST['idRegistroSus'];



    $id_partido = strtoupper($_POST["id_partido"]);
    $id_distrito = strtoupper($_POST["id_distrito"]);
    $id_municipio = strtoupper($_POST["id_municipio"]);
    $id_comunidad = strtoupper($_POST["id_comunidad"]);

    $candidato_num_emision = strtoupper($_POST["candidato_num_emision"]);
    $candidato_ocr = strtoupper($_POST["candidato_ocr"]);
    $candidato_cic = strtoupper($_POST["candidato_cic"]);
    $candidato_seccion = strtoupper($_POST["candidato_seccion"]);
    $email = $_POST['email'];
    $email = mb_strtolower($email);

    /* validaciones */

    $nombreOriginal = mb_strtoupper($_POST["nombreOriginal"]);
    $appOriginal = mb_strtoupper($_POST["appOriginal"]);
    $apmOriginal = mb_strtoupper($_POST["apmOriginal"]);

    /* Aqui metemos la documentacion */

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

    $stmtclv = $DB_con->prepare("SELECT * FROM candidatura_diputado WHERE clave_elector = '".$clv."' AND candidatura =$candidatura ");
    $stmtclv->execute();
    $res1 = $stmtclv->get_result();

    $stmtcurp = $DB_con->prepare("SELECT * FROM candidatura_diputado WHERE curp = '".$curp."' ");
    $stmtcurp->execute();
    $res2 = $stmtcurp->get_result();

    if($res1->num_rows > 0){
      $fila = array('datos' => 1);
      $respuesta = $fila;
    } else if($res2->num_rows > 0) {
      $fila = array('datos' => 2);
      $respuesta = $fila;
    } else {

      /* Movemos y eliminamos el registro anterior */
      $stmtmov = $DB_con->prepare("
      INSERT INTO candidatura_renuncia(
        nombre, apellido_paterno, apellido_materno, genero,  partido_politico, candidatura, clave_elector, curp, num_emision, ocr, cic, seccion, distrito, municipio, comunidad,
        fec_nacimiento, tiempo_residencia, sobrenombre, estado, user_capturista, propietario_suplente, prelacion, fecha_registro) 

        SELECT nombre, apellido_paterno, apellido_materno, genero, partido_politico, candidatura, clave_elector, curp, num_emision, ocr, cic, seccion, distrito, 0, 0, fec_nacimiento, tiempo_residencia, sobrenombre, estado, user_capturista, propietario_suplente, prelacion 
        , '$dia' as fecha_registro
        FROM candidatura_diputado 
        WHERE clave_elector = '$claveOriginal' and candidatura  = $candidatura;");
      $stmtmov->execute();
      $res = $stmtmov->get_result();

      $stmtstatus = $DB_con->prepare("UPDATE candidatura_renuncia SET estado = 'Sustitucion' WHERE clave_elector = '".utf8_decode($claveOriginal)."' AND  ( candidatura = 1 OR candidatura = 2 ) ");
      $stmtstatus->execute();

      /* Ingresamos la información  */
      $stmt = $DB_con->prepare("UPDATE candidatura_diputado SET 
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
         prelacion = '".$prelacion."',
         email = '".$email."'
      WHERE clave_elector = '".utf8_decode($claveOriginal)."' AND candidatura = ".$candidatura."  ");
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


      $queryH = "INSERT INTO historial values(null, '$usuario', 'Sustitución', '".$nombreOriginal.' '.$appOriginal.' '.$apmOriginal."', '$claveOriginal', '".$nombre.' '.$app.' '.$apm."', '$clv',
      '$curp', '$motivoSustitucion', '$dia', '$hora', '$candidatura', '$id_partido', '$id_distrito', '$id_municipio', '$id_comunidad', '$propietario_suplente', '$estado');";    
      $stmthistory= $DB_con->prepare($queryH);    
      $stmthistory->execute();

      /* Registro en historial */

      $historial = array( 
        $usuario, 
        "Registro", 
        $nombre.' '.$app.' '.$apm, 
        $clv, 
        '-',
        '-', 
        '-', 
        $dia, 
        $hora,
        $candidatura
      );

      $queryHistorial = 
      "INSERT INTO historial VALUES(null, '$usuario', 'Registro', '".$nombre.' '.$app.' '.$apm."', '$clv', '-', '-', '$curp', '-', '$dia', 
      '$hora', '$candidatura', '$id_partido', '$id_distrito', '$id_municipio', '$id_comunidad', '$propietario_suplente', '$estado');";
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
