<?php

	define('DBhost', 'localhost');
	define('DBuser', 'candidaturas');
	define('DBPass', 'candidaturas');
	define('DBname', 'prep_casilla');

	$_POST = json_decode(file_get_contents('php://input'), true);

	try{
		$DB_con = new PDO("mysql:host=".DBhost.";dbname=".DBname, DBuser, DBPass);
	}catch(PDOException $e){
		die($e->getMessage());
	}

	$json = array();

	
	// se Actualizan los paths de las imagenes
	if (isset($_POST['idUser']) && isset($_POST['idTipoEleccion']) && isset($_POST['idDistrito']) && isset($_POST['idMunicipio']) && isset($_POST['idComunidad'])
		&& isset($_POST['idSeccion']) && isset($_POST['idCasilla']) && isset($_POST['path1']) && isset($_POST['path2']) && && isset($_POST['path3']) ) {
		
		$path_1 = $_POST['path1'];
		$path_2 = $_POST['path2'];
		$path_3 = $_POST['path3'];
		
		$id_user = $_POST['idUser'];
		$idTipoEleccion = $_POST['idTipoEleccion'];
		$idDistrito = $_POST['idDistrito'];
		$idMunicipio = $_POST['idMunicipio'];
		$idComunidad = $_POST['idComunidad'];
		$idSeccion = $_POST['idSeccion'];
		$idCasilla = $_POST['idCasilla'];
		
		$consulta = "UPDATE actas
						set path_1 = '".$path_1."', 
							path_2 = '".$path_2."', 
							path_3 = '".$path_3."'
					WHERE id_usuario = '".$id_user."' 
					AND id_districto = '".$idDistrito."' 
					AND id_tipo_eleccion = '".$idTipoEleccion."'
					AND id_tipo_casilla = '".$idCasilla."'
					AND id_seccion = '".$idSeccion."'";

		
    	$stmt = $DB_con -> prepare($consulta);
		$stmt -> execute();

		if ($stmt->rowCount() < 1) {
		    $fila = array("status" => "No se insertaron datos");
		    $lista[][] = $fila;
		} else if($stmt->rowCount() > 0){
		    for ($i=0; $i < $stmt->rowCount(); $i++) {
		      $seguridad = $stmt->fetch(PDO::FETCH_ASSOC);
		      $lista['paths'][] = $seguridad;
		    }
		} else {
		    $fila = array("status"=>"Error");
		    $lista[] = $fila;
		}

  		echo json_encode($lista);
	}

	//Return json of Insert status
	if (isset($_GET['id_user'])&isset($_GET['imei'])) {

		
		$id_user = $_GET['id_user'];
		$imei = $_GET['imei'];
		
		$consulta = "UPDATE usuarios set imei = '".$imei."' WHERE id_user = '".$id_user."'";

    		$stmt = $DB_con -> prepare($consulta);
		$stmt -> execute();

		if ($stmt->rowCount() < 1) {
		    $fila = array("status" => "No se insertaron datos");
		    $lista[][] = $fila;
		} else if($stmt->rowCount() > 0){
		    for ($i=0; $i < $stmt->rowCount(); $i++) {
		      $seguridad = $stmt->fetch(PDO::FETCH_ASSOC);
		      $lista['status'][] = $seguridad;
		    }
		} else {
		    $fila = array("status"=>"Error");
		    $lista[] = $fila;
		}

  		echo json_encode($lista);
	}

	//Return json of Insert Auth0
        if (isset($_GET['userAuth0'])&isset($_GET['passAuth0'])) {


                $userAuth0 = $_GET['userAuth0'];

		$passAuth0 = $_GET['passAuth0'];

                $consulta = "UPDATE configuracion set userAuth0 = '".$userAuth0."',passAuth0 = '".$passAuth0."' WHERE 1 ";

                $stmt = $DB_con -> prepare($consulta);
                $stmt -> execute();

                if ($stmt->rowCount() < 1) {
                    $fila = array("status" => "No se insertaron datos");
                    $lista[][] = $fila;
                } else if($stmt->rowCount() > 0){
                    for ($i=0; $i < $stmt->rowCount(); $i++) {
                      $seguridad = $stmt->fetch(PDO::FETCH_ASSOC);
                      $lista['status'][] = $seguridad;
                    }
                } else {
                    $fila = array("status"=>"Error");
                    $lista[] = $fila;
                }

                echo json_encode($lista);
        }

	//Return json of Insert an user
	if (isset($_GET['registerU']) && isset($_GET['user_name']) && isset($_GET['user_last_names']) && isset($_GET['user_pass']) && isset($_GET['imei']) && isset($_GET['user_act'])) {

		
		$user_name = utf8_decode($_GET['user_name']);
		$user_last_names = utf8_decode($_GET['user_last_names']);
		$user_pass = $_GET['user_pass'];
		$imei = $_GET['imei'];
                $user_act = $_GET['user_act'];

		
		$consulta = "INSERT INTO usuarios (user_name, user_password, user_last_names, imei, user_active)
					 values ('".$user_name."', '".$user_pass."', '".$user_last_names."', '".$imei."', '".$user_act."');";

    	$stmt = $DB_con -> prepare($consulta);
		$stmt -> execute();

		if ($stmt->rowCount() < 1) {
		    $fila = array("status" => "No se insertaron datos");
		    $lista[][] = $fila;
		} else if($stmt->rowCount() > 0){
		    for ($i=0; $i < $stmt->rowCount(); $i++) {
		      $seguridad = $stmt->fetch(PDO::FETCH_ASSOC);
		      $lista['status'][] = $seguridad;
		    }
		} else {
		    $fila = array("status"=>"Error");
		    $lista[] = $fila;
		}

  		echo json_encode($lista);
	}

	//Return json of Insert user_active
    	if (isset($_GET['user_imei2'])&isset($_GET['user_active'])) {
        	$imei = $_GET['user_imei2'];
		$user_active = $_GET['user_active'];

        	$consulta = "UPDATE usuarios set user_active = '".$user_active."' WHERE imei = '".$imei."' ";

        	$stmt = $DB_con -> prepare($consulta);
        	$stmt -> execute();

        	if ($stmt->rowCount() < 1) {
            		$fila = array("status" => "No se insertaron datos");
            		$lista[][] = $fila;
        	} else if($stmt->rowCount() > 0){
            		for ($i=0; $i < $stmt->rowCount(); $i++) {
              			$seguridad = $stmt->fetch(PDO::FETCH_ASSOC);
              			$lista['status'][] = $seguridad;
            		}
        	} else {
            		$fila = array("status"=>"Error");
            		$lista[] = $fila;
        	}
        	echo json_encode($lista);
    }
?>
