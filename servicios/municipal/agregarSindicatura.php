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
    $fechaNacimiento = $_POST["fechaNacimiento"];
    $lugarNacimiento = $_POST["lugarNacimiento"];
    $tiempoRes = $_POST["tiempoRes"];
    $sobrenombre = mb_strtoupper($_POST["sobrenombre"]);
    $estado = $_POST["estado"];
    $usuario = $_POST["capturista"];
    $propietario_suplente = $_POST["propietario_suplente"];
    $municipio = $_POST['municipio'];


    // Documentacion 
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


    $dia = date("d.m.Y");
    $hora = date("h:i:sa");

    $datos = array( 
        $nombre,
        $apellidop,
        $apellidom,
        $genero,
        $partidoP,
        $municipio,
        6,
        $clv,
        $curp,
        $fechaNacimiento,
        $lugarNacimiento,
        $tiempoRes,
        $sobrenombre,
        $estado,
        $usuario,
        $propietario_suplente,

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
        6,
        'Registro',
        $nombre.' '.$apellidop.' '.$apellidom,
        $dia,
        $hora,
        $politicaP,
        $tipoEleccion
    );


    $existeCandidato = "CALL EXIST_CANDIDATO( '$clv', '$curp');";
    $stmt = $DB_con->prepare($existeCandidato);
    $stmt->execute();
    $res = $stmt->get_result();
    // echo var_dump($res);
    
    if($res){
        $respuesta = array( 'mensaje' => $res->fetch_assoc()['mensaje'], 'status' => false );
        
    }else{

        $stmt = $DB_con->prepare("SELECT * FROM candidatura_sindicatura WHERE candidatura_sindicatura.partido_politico = '$partidoP' and candidatura_sindicatura.id_municipio = '$municipio' and candidatura_sindicatura.propietario_suplente = '$propietario_suplente' ");
        $stmt->execute();
        $res = $stmt->get_result();
        $result = $res->fetch_assoc();
        
        if($result){

            $respuesta = array( 'mensaje' => 'Este partido político / coalición / independiente ya está registrado', 'status' => false );

        }else{

        // este metodo muestra la consulta que se genera o mejor dicho la crea manual esto fue hecho par apruebas
        $query = verProcedimiento("CALL addMunicipal( ", $datos );
        //echo $query;
        // $insertarDatos = "CALL addMunicipal(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?,  ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?,  ?, ?, ?, ?, ?, ?)";
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