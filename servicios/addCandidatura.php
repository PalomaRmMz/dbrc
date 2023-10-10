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
    $reg_pro_num_emision = mb_strtoupper($_POST["reg_pro_num_emision"]);
    $reg_pro_ocr = mb_strtoupper($_POST["reg_pro_ocr"]);
    $reg_pro_CIC = mb_strtoupper($_POST["reg_pro_CIC"]);
    $reg_pro_seccion = mb_strtoupper($_POST["reg_pro_seccion"]);
    $curp = $_POST["curp"];
    $distrito = $_POST["distrito"];
    $fechaReg = $_POST["fecha"];
    $sitePropietario = $_POST["sitePropietario"];
    $tiempoResidencia = $_POST["tiempoResidencia"];
    $alias = $_POST["sobrenombre"];
    $estado = $_POST["estado"];
    $prelacion = $_POST["prelacion"];
    $usuario = $_POST["capturista"];
    $prosup = $_POST["prosup"];

    $nombre = mb_strtoupper($nombre,'UTF-8');
    $app = mb_strtoupper($app,'UTF-8');
    $apm = mb_strtoupper($apm,'UTF-8');

    $clv = strtoupper($clv);
    $curp = strtoupper($curp);
    $tiempoResidencia = strtoupper($tiempoResidencia);
    $alias = mb_strtoupper($alias);

    //documentacion
    $supCarta3D3 = $_POST["propCarta3D3"];
    $supCartaEleccion = $_POST["propCartaEleccion"];
    $supConstAutOrganoPartidista = $_POST["propConstAutOrganoPartidista"];
    $supManifestacionIndigena = $_POST["propManifestacionIndigena"];
    $supConsVinculoComuni = $_POST["propConsVinculoComuni"];

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
    $politicaP = $_POST["politicaP"];
    
    $dia = date("d.m.Y");
    $hora = date("h:i:sa");
    //$email = mb_strtolower($_POST['email']);
    $email = $_POST["email"];
    $email = mb_strtolower($email);

    $stmt = $DB_con->prepare("SELECT * FROM candidatura_comunidad WHERE candidatura_comunidad.clave_elector = '$clv' OR candidatura_comunidad.curp = '$curp' ");
    $stmt->execute();
    $result = $stmt->get_result();
    $result = $result->fetch_assoc();
    if($result){
      
      $respuesta = array( 'mensaje' => 'Ya existe un registro con esa clave elector o curp en candidatura para comunidad', 'status' => false );
 
    }else{

      $stmt = $DB_con->prepare("SELECT * FROM candidatura_ayuntamiento WHERE candidatura_ayuntamiento.clave_elector = '$clv' OR candidatura_ayuntamiento.curp = '$curp'");
      $stmt->execute();
      $result = $stmt->get_result();
      $result = $result->fetch_assoc();

      if($result){
       $respuesta = array( 'mensaje' => 'Ya existe un registro con esa clave elector o curp en candidatura para ayuntamiento', 'status' => false );
      }else {

 
        $stmtclv = $DB_con->prepare("SELECT candidatura_diputado.clave_elector FROM candidatura_diputado WHERE clave_elector = '".utf8_decode($clv)."' UNION SELECT candidatura_renuncia.clave_elector FROM candidatura_renuncia WHERE clave_elector = '".utf8_decode($clv)."' ");
        $stmtclv->execute();
        $stmtclvres = $stmtclv->get_result();

        $stmtcurp = $DB_con->prepare("SELECT candidatura_diputado.curp FROM candidatura_diputado WHERE curp = '".$curp."' UNION SELECT candidatura_renuncia.clave_elector FROM candidatura_renuncia WHERE clave_elector = '".utf8_decode($clv)."' ");
        $stmtcurp->execute();
        $stmtcurpres = $stmtcurp->get_result();

        $stmtpp = $DB_con->prepare("SELECT candidatura_diputado.partido_politico FROM candidatura_diputado WHERE partido_politico = '".$pp."' AND distrito = '".$distrito."' AND propietario_suplente = '".$prosup."' ");
        $stmtpp -> execute();
        $stmtppres = $stmtpp->get_result();

       /* if ($stmtclvres->num_rows == 1) {
          $respuesta = array( 'mensaje' => 'Ya existe un registro con esa clave elector o curp en candidatura para diputado', 'status' => true );
        } else if($stmtcurpres->num_rows == 1){
          $respuesta = array( 'mensaje' => 'Ya existe un registro con esa clave elector o curp en candidatura para diputado', 'status' => true );
        } else if($stmtppres->num_rows == 1){
          $respuesta = array( 'mensaje' => 'Ya se ha agregado las candidaturas para este partido político en este distrito', 'status' => false );
        } else {*/
          


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
          
         // echo $datos;

          // $stmt = $DB_con->prepare('CALL addDiputacion(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?,  ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?,  ?, ?, ?, ?)');
          $stmt = $DB_con->prepare($query);
          $stmt->execute();
          $res = $stmt->get_result();
          $respuesta = array( 'mensaje' => 'Se agrego correctamente', 'status' => true );
        //}
      }
    }
  }
  $stmtclv = null;
  $stmtcurp = null;
  $stmtpp = null;
  $DB_con = null;
  echo json_encode($respuesta);
 // echo $datos;
?>
