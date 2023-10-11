<?php
    require_once '../../controladores/conndb.php';
    date_default_timezone_set('America/Mexico_city');

    if($_POST){


        $tipoEleccion = isset($_POST['tipoEleccion']) ? $_POST['tipoEleccion'] : 0;
        $distrito = isset($_POST['distrito']) ? $_POST['distrito'] : 0 ;
        $comunidad = isset($_POST['comunidad']) ? $_POST['comunidad'] : 0;
        $partido = isset($_POST['partido']) ? $_POST['partido'] : 0;
        $prelacion = isset($_POST['prelacion']) ? $_POST['prelacion'] : 0;
        $tipoCand = isset($_POST['tipoCand']) ? $_POST['tipoCand'] : 0;
        $ordenSindicatura = isset($_POST['ordenSindicatura']) ? $_POST['ordenSindicatura'] : 0;

        $query = "call validarSexo( '$tipoEleccion', '$distrito', '$comunidad', '$partido', '$prelacion', '$tipoCand', '$ordenSindicatura' )";

        // echo $query;
        
        $stmt = $DB_con->prepare($query);
        $stmt->execute();

        $res = $stmt->get_result();
        
        if($res->num_rows == 1 ) {
            $result = $res->fetch_assoc();
            $resultado = array( 
                'status_code' => 200,
                'sexo' => $result['genero'],
                'prosup' => $result['propietario_suplente'] 
            );
        }else if($res->num_rows == 2){
            $resultado = array(
                'status_code' => 201
            );
        }else {
            $resultado = array(
                'status_code' => 404,
                'mensaje' => 'No se encontro registro'
            );
        }
        echo json_encode($resultado);
    }
?>