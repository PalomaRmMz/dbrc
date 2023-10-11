<?php
  require_once '../controladores/conndb.php';
  date_default_timezone_set('America/Mexico_city');

  if ($_POST) {

    $nombre = $_POST["nombre"];
    $app = $_POST["apellidoPaterno"];
    $apm = $_POST["apellidoMaterno"];
    $genero = $_POST["genero"];
    $pp = $_POST["partidoPolitico"];
    $candidatura = $_POST["candidatura"];
    $clv = $_POST["claveElector"];
    $curp = $_POST["curp"];
    
    $reg_pro_num_emision = mb_strtoupper($_POST["reg_pro_num_emision"]);
    $reg_pro_ocr = mb_strtoupper($_POST["reg_pro_ocr"]);
    $reg_pro_CIC = mb_strtoupper($_POST["reg_pro_CIC"]);
    $reg_pro_seccion = mb_strtoupper($_POST["reg_pro_seccion"]);

    $distrito = $_POST["distrito"];
    $fechaReg = $_POST["fecha"];
    $sitePropietario = $_POST["sitePropietario"];
    $tiempoResidencia = $_POST["tiempoResidencia"];
    $alias = $_POST["sobrenombre"];
    $estado = $_POST["estado"];
    $prelacion = $_POST["prelacion"];
    $usuario = $_POST["capturista"];
    $prosup = $_POST["prosup"];
    //Validaciones para valorar en la base de Datos
    // $nombre =strtoupper($nombre);
    // $app =strtoupper($app);
    // $apm =strtoupper($apm);

    $nombre =mb_strtoupper($nombre,'UTF-8');
    $app =mb_strtoupper($app,'UTF-8');
    $apm =mb_strtoupper($apm,'UTF-8');

    $clv = strtoupper($clv);
    $curp = strtoupper($curp);
    $tiempoResidencia = strtoupper($tiempoResidencia);
    $alias =mb_strtoupper($alias);
    //documentacion

    $supCarta3D3 = $_POST["supCarta3D3"];
    $supCartaEleccion = $_POST["supCartaEleccion"];
    $supConstAutOrganoPartidista = $_POST["supConstAutOrganoPartidista"];
    $supManifestacionIndigena = $_POST["supManifestacionIndigena"];
    $supConsVinculoComuni = $_POST["supConsVinculoComuni"];

    $snr = $_POST["docsnr"];
    $reg = $_POST["regcandidatura"];
    $act = $_POST["acta"];
    $copia = $_POST["copiaacta"];
    $credencial = $_POST["credencial"];
    $aceptacion = $_POST["aceptacion"];
    $separacion = $_POST["supSeparacion"];
    $radicacion = $_POST["radicacion"];
    $nopenales = $_POST["nopenales"];
    $noinahbilitado = $_POST["noinahbilitado"];
    $manifiesto = $_POST["manifiesto"];
    $capacidad = $_POST["capacidad"];
    $cedularfc = $_POST["cedularfc"];
    $politicaP = $_POST['politicaP'];
    

    $dia = date("d.m.Y");
    $hora = date("h:i:sa");
    $email = $_POST['email'];
    $email = mb_strtolower($email);

    $stmt = $DB_con->prepare("SELECT * FROM candidatura_comunidad WHERE candidatura_comunidad.clave_elector = '$clv' OR candidatura_comunidad.curp = '$curp' ");
    $stmt->execute();
    $res = $stmt->get_result();
    $result = $res->fetch_assoc();

    if($result){
      
      $respuesta = array( 'mensaje' => 'Ya existe un registro con esa clave elector o curp en candidatura para comunidad', 'status' => false );

    }else{

      $stmt = $DB_con->prepare("SELECT * FROM candidatura_ayuntamiento WHERE candidatura_ayuntamiento.clave_elector = '$clv' OR candidatura_ayuntamiento.curp = '$curp'");
      $stmt->execute();
      $res = $stmt->get_result();
      $result = $res->fetch_assoc();

      if($result){
       $respuesta = array( 'mensaje' => 'Ya existe un registro con esa clave elector o curp en candidatura para ayuntamiento', 'status' => false );
      }else {

        $query = "SELECT clave_elector FROM candidatura_diputado WHERE clave_elector = '".utf8_decode($clv)."' UNION SELECT clave_elector FROM candidatura_renuncia WHERE clave_elector = '".utf8_decode($clv)."' ";
        $stmtclv = $DB_con->prepare($query);
        $stmtclv->execute();
        $res1 = $stmtclv->get_result();
    
        $stmtcurp = $DB_con->prepare("SELECT clave_elector FROM candidatura_diputado WHERE curp = '".$curp."' UNION SELECT clave_elector FROM candidatura_renuncia WHERE clave_elector = '".utf8_decode($clv)."' ");
        $stmtcurp->execute();
        $res2 = $stmtcurp->get_result();
  
        if ($res1->num_rows == 1) {
          $respuesta = array( 'mensaje' => 'Ya existe un registro con esta clave de usuario', 'status' => false );
        } else if($res2->num_rows == 1){
          $respuesta = array( 'mensaje' => 'Ya existe un registro con este curp', 'status' => false );
          
        } else {
    
          // 'Ya existe un propietario de este partido politico con este numero de prelacion'
          //$stmt = $DB_con->prepare('CALL addDiputacion(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)');

          $datos = array(
            $nombre,
            $app,
            $apm,
            $genero,
            $pp,
            $candidatura,
            $clv,
            $curp,

            $reg_pro_num_emision,
            $reg_pro_ocr,
            $reg_pro_CIC,
            $reg_pro_seccion,



            $distrito,
            $fechaReg,
            $sitePropietario,
            $tiempoResidencia,
            $alias,
            $estado,
            $usuario,
            $prosup,
            $prelacion,


            $supCarta3D3,
            $supCartaEleccion,
            $supConstAutOrganoPartidista,
            $supManifestacionIndigena,
            $supConsVinculoComuni,

            $snr,
            $act,
            $copia,
            $separacion,
            $noinahbilitado,
            $nopenales,
            $reg,
            $credencial,
            $aceptacion,
            $radicacion,
            $manifiesto,
            $capacidad,
            $cedularfc,            
            2,

            'Registro',
            $nombre.' '.$app.' '.$apm,
            $dia,
            $hora,
            $politicaP,
            $email
          );


          $query = verProcedimiento("CALL addDiputacion( ", $datos );
          $stmt = $DB_con->prepare($query);
          $stmt->execute();
          $res = $stmt->get_result();
          
          
          $respuesta = array( 'mensaje' => 'Se agrego correctamente', 'status' => true );
        }
      }
    }
  } 
  $stmtclv = null;
  $stmtcurp = null;
  $stmtpp = null;
  $DB_con = null;
  echo json_encode($respuesta);
  ?>