<?php
  require_once '../../controladores/conndb.php';
  date_default_timezone_set('America/Mexico_city');
  
    // Datos personales
    $nombre =  mb_strtoupper($_POST["nombre"]);
    $apellidop = mb_strtoupper($_POST["apellidop"]);
    $apellidom = mb_strtoupper($_POST["apellidom"]);
    $genero = $_POST["genero"];
    $partidoP = $_POST["partidoP"];
    $fechaNacimiento = $_POST["fechaNacimiento"];
    $lugarNacimiento = $_POST["lugarNacimiento"];
    $clv = mb_strtoupper($_POST["clv"]);
    $curp = mb_strtoupper($_POST["curp"]);
    $num_emision = $_POST['num_emision'];
    $ocr = $_POST['ocr'];
    $cic = $_POST['cic'];
    $seccion = $_POST['seccion'];
    $tiempoRes = $_POST["tiempoRes"];
    $estado = $_POST["estado"];
    $sobrenombre = mb_strtoupper($_POST["sobrenombre"]);
    $usuario = $_POST["capturista"];
    $correoGob = $_POST["emailGob"];
    $correoGob = mb_strtolower($correoGob);
    

    

    // Documentacion 

    // cambios ultima hora
    $carta3D3 = $_POST['carta3D3'];
    $cartaEleccion = $_POST['cartaEleccion'];
    $constAutOrganoPartidista = $_POST['constAutOrganoPartidista'];
    $manifestacionIndigena = $_POST['manifestacionIndigena'];
    $consVinculoComuni = $_POST['consVinculoComuni'];
    // fin cambios ultima hora

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

    $politicaP = $_POST['politicaP'];

    $dia = date("d.m.Y");
    $hora = date("h:i:sa");
  
    $datos = array( 
    $nombre,
    $apellidop,
    $apellidom,
    $genero,
    $partidoP,
    $fechaNacimiento,
    $lugarNacimiento,
    $clv,
    $curp,
    // nuevos campos
    $num_emision,
    $ocr,
    $cic,
    $seccion,
    // fin nuevos campos
    $tiempoRes,
    $estado,
    $sobrenombre,
    $usuario,
    3,
    //inicio ultimos cambios
    $carta3D3,
    $cartaEleccion,
    $constAutOrganoPartidista,
    $manifestacionIndigena,
    $consVinculoComuni,
    // fin ultimos cambios 
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
    3,
    'Registro',
    $nombre.' '.$apellidop.' '.$apellidom,
    $dia,
    $hora,
    $politicaP,
    $correoGob
  );


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

        $query = verProcedimiento("CALL addGubernatura( ", $datos );
        //echo $query;
        $stmt= $DB_con->prepare($query);
        $stmt->execute();    
        $res = $stmt->get_result();
        $result = $res->fetch_assoc();
        
        if( $result['MENSAJE'] == 1 ) {
    
          $fila[] = array('datos' => 1);
          $respuesta = array( 'mensaje' => 'Registro exitoso', 'status' => true );
        } else if( $result['MENSAJE'] == 0 ){
    
          $respuesta = array( 'mensaje' => 'Este partido político / coalición / independiente ya está registrado', 'status' => false );

        }else if ( $result['MENSAJE'] == -1 || $result['MENSAJE'] == -2) {
    
          $respuesta = array( 'mensaje' => 'Ya existe un registro con esa clave elector o curp en candidatura para ayuntamiento', 'status' => false );
        }
      }

    }
    // este metodo muestra la consulta que se genera o mejor dicho la crea manual esto fue hecho par apruebas

    $DB_con = null;
    $stmt = null;
    echo json_encode( $respuesta );
?>