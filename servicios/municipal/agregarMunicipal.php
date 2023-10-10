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
    $correoMuni = $_POST["emailMuni"];
    $correoMuni = mb_strtolower($correoMuni);
    
    

    // nuevos campos
    $num_emision = $_POST['num_emision'];
    $ocr = $_POST['ocr'];
    $cic = $_POST['cic'];
    $seccion = $_POST['seccion'];
    // fin de nuevos campos

    $fechaNacimiento = $_POST["fechaNacimiento"];
    $lugarNacimiento = $_POST["lugarNacimiento"];
    $tiempoRes = $_POST["tiempoRes"];
    $sobrenombre = mb_strtoupper($_POST["sobrenombre"]);
    $estado = $_POST["estado"];
    $usuario = $_POST["capturista"];
    $propietario_suplente = $_POST["propietario_suplente"];
    $municipio = $_POST['municipio'];
    


    // Documentacion 

    // INICIO CAMPOS DE ULTIMA HORA
    $carta3D3 = $_POST["carta3D3"];
    $cartaEleccion = $_POST["cartaEleccion"];
    $constAutOrganoPartidista = $_POST["constAutOrganoPartidista"];
    $manifestacionIndigena = $_POST["manifestacionIndigena"];
    $consVinculoComuni = $_POST["consVinculoComuni"];
    //FIN DE CAMPOS DE ULTIMA HORA

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

    $tipoEleccion = $_POST['tipoEleccion'];
    $regidor = $_POST['ordenSindicatura'];

 
    $dia = date("d.m.Y");
    $hora = date("h:i:sa");

    $datos = array( 
        $nombre,
        $apellidop,
        $apellidom,
        $genero,
        $partidoP,
        $municipio,
        $clv,
        $curp,
        // nuevos campos
        $num_emision,
        $ocr,
        $cic,
        $seccion,
        // fin nuevos campos
        $fechaNacimiento,
        $lugarNacimiento,
        $tiempoRes,
        $sobrenombre,
        $estado,
        $usuario,
        $propietario_suplente,

        // INICIO DE CAMPOS DE ULTIMA HORA
        $carta3D3,
        $cartaEleccion,
        $constAutOrganoPartidista,
        $manifestacionIndigena,
        $consVinculoComuni,
        // FIN DE CAMPOS DE ULTIMA HORA

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
        'Registro',
        $nombre.' '.$apellidop.' '.$apellidom,
        $dia,
        $hora,
        $politicaP,
        $tipoEleccion,
        $regidor,
        $correoMuni
    );


    $existeCandidato = "CALL EXIST_CANDIDATO( '$clv', '$curp');";
    $stmt = $DB_con->prepare($existeCandidato);
    $stmt->execute();
    $res = $stmt->get_result();
    // echo var_dump($res);
    if($res){
      $respuesta = array( 'mensaje' => $res->fetch_assoc()['mensaje'], 'status' => false );
      
    }else{

      $query = "";

      if($tipoEleccion == 4){

        // echo "tipo eleccion: $tipoEleccion";
        $query = "SELECT * FROM candidatura_ayuntamiento WHERE candidatura_ayuntamiento.clave_elector = '$clv' OR candidatura_ayuntamiento.curp = '$curp'";

      }else if( $tipoEleccion == 6 ){
        // echo "tipo eleccion: $tipoEleccion";
        $query = "SELECT * FROM candidatura_sindicatura WHERE candidatura_sindicatura.clave_elector = '$clv' AND candidatura_sindicatura.id_municipio = '$municipio' AND candidatura_sindicatura.propietario_suplente = '$propietario_suplente'; ";

      }else if($tipoEleccion == 7){
        // echo "tipo eleccion: $tipoEleccion";
        $query = "
        SELECT * FROM candidatura_regiduria WHERE
        candidatura_regiduria.clave_elector = '$clv' 
        AND candidatura_regiduria.id_municipio = '$municipio' 
        AND candidatura_regiduria.propietario_suplente = '$propietario_suplente'
        AND candidatura_regiduria.num_regidor = '$regidor'; ";
      }

      $stmt = $DB_con->prepare($query);
      $stmt->execute();
      $res = $stmt->get_result();
      $result = $res->fetch_assoc();
      
      if($result){

        $respuesta = array( 'mensaje' => 'Este partido político / coalición / independiente ya está registrado', 'status' => false );

      }else{

        // este metodo muestra la consulta que se genera o mejor dicho la crea manual esto fue hecho par apruebas
        $query = verProcedimiento("CALL addMunicipal( ", $datos );
        // $insertarDatos = "CALL addMunicipal(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?,  ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?,  ?, ?, ?, ?, ?, ?)";
        $stmt= $DB_con->prepare($query);
        
        // echo $query;
        $stmt->execute();  

        if($stmt->error == null){
          
          $res = $stmt->get_result();  
          $result = $res->fetch_assoc();

          if( $result['MENSAJE'] == 1 ) {

            $respuesta = array( 'mensaje' => 'Registro completo', 'status' => true );

          } else {

            $respuesta = array( 'mensaje' => 'Hubo un error', 'status' => false );
          }

        } else {
          //echo var_dump($stmt->error);
          $respuesta = array( 'mensaje' => "Algo salio mal en la base de datos consulte al administrador", 'status' => false );
        }
      }
    }

    $DB_con = null;
    $stmt = null;
    echo json_encode( $respuesta );
?>