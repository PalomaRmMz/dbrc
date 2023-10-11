<?php
  require_once '../../controladores/conndb.php';
  date_default_timezone_set('America/Mexico_city');

    // Datos personales
    $nombre =  mb_strtoupper($_POST["nombre"]);
    $apellidop = mb_strtoupper($_POST["apellidop"]);
    $apellidom = mb_strtoupper($_POST["apellidom"]);
    $genero = $_POST["genero"];
    $partidoP = $_POST["partidoP"];
    $clv = mb_strtoupper($_POST["clv"]);
    $curp = mb_strtoupper($_POST["curp"]);

    // nuevos campos
    $num_emision = $_POST['num_emision'];
    $ocr = $_POST['ocr'];
    $cic = $_POST['cic'];
    $seccion = $_POST['seccion'];

    $fechaNacimiento = $_POST["fechaNacimiento"];
    $lugarNacimiento = $_POST["lugarNacimiento"];
    $tiempoRes = $_POST["tiempoRes"];
    $sobrenombre = mb_strtoupper($_POST["sobrenombre"]);
    $estado = $_POST["estado"];
    $usuario = $_POST["capturista"];
    $propietario_suplente = $_POST["propietario_suplente"];
    $comunidad = $_POST['comunidad'];
    $correoCom = $_POST["emailCom"];
    $correoCom = mb_strtolower($correoCom);

    // Documentacion 

    $carta3D3 = $_POST["carta3D3"];
    $cartaEleccion = $_POST["cartaEleccion"];
    $constAutOrganoPartidista = $_POST["constAutOrganoPartidista"];
    $manifestacionIndigena = $_POST["manifestacionIndigena"];
    $consVinculoComuni = $_POST["consVinculoComuni"];

    $documentSNR = $_POST["documentSNR"];
    $solicitudRC = $_POST["solicitudRC"];
    $credencialINE = $_POST["credencialINE"];
    $actaNacimentio = $_POST["actaNacimentio"];
    $copiaActa = $_POST["copiaActa"];
    $contanciaResidencia = $_POST["contanciaResidencia"];
    $contanciaPostulacion = $_POST["contanciaPostulacion"];
    $constanciaSeparacion = $_POST["constanciaSeparacion"];
    $proInahbilitado = $_POST["proInahbilitado"];
    $antecedentesNP = $_POST["antecedentesNP"];
    $documentManifestacion = $_POST["documentManifestacion"];
    $informeCE = $_POST["informeCE"];
    $cedulaIF = $_POST["cedulaIF"];
    $municipio = $_POST["municipio"];
    $politicaP = $_POST['politicaP'];

    $dia = date("d.m.Y");
    $hora = date("h:i:sa");

    $datos = array(
        $municipio,
        $nombre,
        $apellidop,
        $apellidom,
        $genero,
        $partidoP,
        $comunidad,
        5,
        $clv,
        $curp,
        
        // nuevos campos
        $num_emision,
        $ocr,
        $cic,
        $seccion,
        // fin nuevos
        
        $fechaNacimiento,
        $lugarNacimiento,
        $tiempoRes,
        $sobrenombre,
        $estado,
        $usuario,
        $propietario_suplente,

        $carta3D3,
        $cartaEleccion,
        $constAutOrganoPartidista,
        $manifestacionIndigena,
        $consVinculoComuni,

        $documentSNR,
        $actaNacimentio,
        $copiaActa,
        $constanciaSeparacion,
        $proInahbilitado,
        $antecedentesNP,
        $solicitudRC,
        $credencialINE,
        $contanciaPostulacion,
        $contanciaResidencia,
        $documentManifestacion,
        $informeCE,
        $cedulaIF,
        5,
        'Registro',
        $nombre.' '.$apellidop.' '.$apellidom,
        $dia,
        $hora,
        $politicaP,
        $correoCom
    );

    $existeCandidato = "CALL EXIST_CANDIDATO( '$clv', '$curp');";
    $stmt = $DB_con->prepare($existeCandidato);
    $stmt->execute();
    $res = $stmt->get_result();
    

    if($res){
      $respuesta = array( 'mensaje' => $res->fetch_assoc()['mensaje'], 'status' => false );
      
    }else{

      $stmt = $DB_con->prepare("SELECT * FROM candidatura_comunidad WHERE candidatura_comunidad.clave_elector = '$clv' AND candidatura_comunidad.propietario_suplente = '$propietario_suplente' ");
      $stmt->execute();
      $res = $stmt->get_result();
      $result = $res->fetch_assoc();
      
      if($result){

        $respuesta = array( 'mensaje' => 'Este partido político / coalición / independiente ya está registrado', 'status' => false );

      }else{

        $query = verProcedimiento("CALL addComunidad( ", $datos );


        // $insertarDatos = "CALL addComunidad(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?,  ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?,  ?, ?, ?, ?, ?, ?, ?)";
        $stmt= $DB_con->prepare($query);
        $stmt->execute();

        $res = $stmt->get_result();
        $result = $res->fetch_assoc();

        if( $result['MENSAJE'] == 1 ) {
          $respuesta = array( 'mensaje' => 'Registro completo', 'status' => true );
        }else{
          $respuesta = array( 'mensaje' => 'Hubo un error', 'status' => false );
        }

      }
    }

    $DB_con = null;
    $stmt = null;

    echo json_encode( $respuesta );
?>