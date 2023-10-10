<?php

session_start();
require_once '../../controladores/conndb.php';
date_default_timezone_set('America/Mexico_city');


if(isset($_SESSION['usuario'])){

    $usuarioActual = $_SESSION['usuario'];

    $stmt = $DB_con->prepare("SELECT sesion_id FROM usuarios WHERE usuario = '".$usuarioActual."' ");
    $stmt->execute();
    $res = $stmt->get_result();

    if($res->num_rows > 0){

        if( $res->fetch_assoc()['sesion_id'] ==  $_SESSION['id'] ){
            $resultado = array('exito' => 1);
        }else{
            $resultado = array('exito' => 2);
            session_unset();
            session_destroy();
            session_write_close();
            setcookie(session_name(),'',0,'/');
        }

    }else{
        $resultado = array('exito' => 3);
        session_destroy();
    }
    echo json_encode($resultado);
}else{
    $resultado = array('exito' => 4);
    session_unset();
    session_destroy();
    session_write_close();
    setcookie(session_name(),'',0,'/');
    echo json_encode($resultado);
}
?>