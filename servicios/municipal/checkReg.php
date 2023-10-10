<?php

    require_once '../../controladores/conndb.php';
    date_default_timezone_set('America/Mexico_city');


    $tipo = $_POST['tipo'];

    switch($tipo){
    
        case 'cargarRegidor':
            cargarRegidor($DB_con);
        break;
        case 'validarTipoEleccion':
            validarTipoEleccion($DB_con);
        break; 
        case 'checkRegidor':
            checkRegidor($DB_con);
        break;
    }


    function cargarRegidor($DB_con){

        if($_POST){
    
            $idMunicipio = $_POST['idMunicipio'];
            $query = "SELECT * FROM municipios WHERE municipios.id_municipio = '$idMunicipio' ";
            // echo $query;
            $stmt = $DB_con->prepare($query);
            $stmt->execute();
            $result = $stmt->get_result();
        
            if( $result->num_rows > 0 ){
    
                $municipio = $result->fetch_assoc();
    
                $fila = array(
                    "num_regidores" => $municipio['num_regidores'],
                    "status_code" => true
                );
            }else {
                $fila = array(
                    "status_code" => false,
                    "mensaje" => "No se encontro el registro"
                );
            }
            echo json_encode($fila);
        } // end cargarRegidor
    }// end cargarRegidor 

    function checkRegidor($DB_con){

        $ordenSindicatura = $_POST['ordenSindicatura'];
        $idMunicipio = $_POST['idMunicipio'];
        $idPartido = $_POST['idPartido'];

        $query = " SELECT genero, num_regidor FROM candidatura_regiduria WHERE candidatura_regiduria.id_municipio = '$idMunicipio' AND candidatura_regiduria.partido_politico = '$idPartido'  ORDER BY num_regidor DESC";
        //echo $query;
        $stmt = $DB_con->prepare($query);
        $stmt->execute();
        $result = $stmt->get_result();

        if($result->num_rows != 0){
 
            $response = array( "status_code" => 200 );
            $response['REGAFULL'] = true;
            $response['generoAnt'] = $result->fetch_assoc()['genero'];
            $response['num_regidor'] = $result->fetch_assoc()['num_regidor'];
            
            $query = "SELECT genero, num_regidor FROM candidatura_regiduria WHERE candidatura_regiduria.id_municipio = '$idMunicipio' AND candidatura_regiduria.partido_politico = '$idPartido' AND num_regidor = '$ordenSindicatura' ORDER BY genero DESC";
            //echo $query;
            
            
            $stmt = $DB_con->prepare($query);
            $stmt->execute();
            $result = $stmt->get_result();
            

            if($result->num_rows == 1){
                
                $candidato = $result->fetch_assoc();
                $response['REGACT'] = false;
                $response[] = array(
                    "num_regidor" => $candidato['num_regidor'],
                    "genero" => $candidato['genero'],
                );
                
            } else if($result->num_rows == 0) {

                $response['REGACT'] = true;
                $response['REGAFULL'] = $ordenSindicatura - 1 ==  $response['num_regidor'] ? true : false;
            }
            //echo var_dump($response);
        }else if($result->num_rows == 0){

            $response = array( "status_code" => 404 );
            $response['REGAFULL'] = $ordenSindicatura == 1 ? true : false;
            $response['REGACT'] = true;

            $query = " SELECT genero, candidatura FROM candidatura_sindicatura WHERE candidatura_sindicatura.id_municipio = '$idMunicipio' AND candidatura_sindicatura.partido_politico = '$idPartido'; ";
            $stmt = $DB_con->prepare($query);
            $stmt->execute();
            $result = $stmt->get_result();
            $candidato = $result->fetch_assoc();
            $response[] = array(                
                "candidatura" => $candidato['candidatura'],
                "genero" => $candidato['genero']
            );
        }
        echo json_encode($response);
    }

    function validarTipoEleccion($DB_con){
        if($_POST){

            $idMunicipio = $_POST['idMunicipio'];
            $idPartido = $_POST['idPartido'];
            $tipoEleccion = $_POST['tipoEleccion'];

            $query = "Call validarCSRMunicipio( '$idMunicipio', '$tipoEleccion', '$idPartido' );";

            $stmt = $DB_con->prepare($query);
            $result = $stmt->execute();
            $result = $stmt->get_result();
        
            if($result->num_rows == 2){

                $response = array( "status_code" => 200 );
                $candidato = $result->fetch_assoc();
                $response[] = array(
                    "partidoPolitico" => $candidato['partido_politico'],
                    "idMunicipio" => $candidato['id_municipio'],
                    "candidatura" => $candidato['candidatura'],
                    "genero" => $candidato['genero']
                );
                $stmt = null;
                $result = null;

                if($tipoEleccion == 6){
                    $query1 = "SELECT * FROM candidatura_sindicatura WHERE id_municipio = '$idMunicipio' and partido_politico = '$idPartido'; ";
    
                    $stmt2 = $DB_con->prepare($query1);
                    $stmt2->execute();
                    $result2 = $stmt2->get_result();
    
                    if($stmt2){
                        $response['num_sindicatos'] = $result2->num_rows ;
                    }else {
                        $response['num_sindicatos'] = 0 ;
                    }
                    
                }
                //echo var_dump($stmt2);
            }else {
                $response = array(
                    "mensaje" => 'No se encontro registros',
                    "status_code" => 404
                );
            }

            echo json_encode($response);
            
        }else {
            $response = array(
                "status_code" =>  404,
                "mensaje" => 'No se encontraron los datos POST'
            );
            echo json_encode($response);
        }

    }// end if post

?>