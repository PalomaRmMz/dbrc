<?php 

require_once '../controladores/conndb.php';

//$clave_elector = $_POST["clave_elector"];

$tipo_slt = $_POST["tipo"];


switch($tipo_slt) {

    case 'tipo_eleccion':
        tipo_eleccion($DB_con);
    break;

    case 'distritos':
        $id_eleccion = $_POST['id_eleccion'];
        distritos($DB_con, $id_eleccion);
    break;

    case 'partidos':
        combinaciones($DB_con);
    break;

    case 'estados':
        getEstados($DB_con);
    break;

    case 'municipios':
        getMunicipios($DB_con);

    break;

    case 'municipiosParticipantes':
        getMunicipiosParticipantes($DB_con);
    break;
    
    case 'comunidades':
        $id_municipio = $_POST['id_municipio'];
        getComunidades($DB_con, $id_municipio);
    break;

    case 'ordenSindicatura':
        $idMunicipio = $_POST['idMunicipio'];
        getOrdenSindicatura($DB_con, $idMunicipio);
        break;
}




function getOrdenSindicatura($DB_con, $idMunicipio){

    try{
        $query = "SELECT * FROM orden_sindicatura WHERE orden_sindicatura.id_municipio = '$idMunicipio'; ";
        $stmt = $DB_con->prepare($query);
        $res = $stmt->execute();

        $res = $stmt->get_result();
        
        $result = [];

        if($res->num_rows > 0){
            for( $i = 0; $i < $res->num_rows; $i++ ){
                $item = $res->fetch_assoc();
                $tmp = array(
                    "IIDOrden" => $item['id_orden_sindicatura'],
                    "numOrden" => $item['numero_sindicaturas']
                );
                array_push($result, $tmp);
            }
            $DB_con = null;
            $stmt = null;
            echo json_encode($result);
        }
    }catch(ExcException $e){
        echo $e;
    }
}

function tipo_eleccion($DB_con){
    $stmt = $DB_con->prepare("SELECT * FROM tipo_eleccion;");
    $stmt->execute();
    $res = $stmt->get_result();
    $result = [];
    if( $res->num_rows > 0 ) {
        for ($i=0; $i < $res->num_rows ; $i++) {
            $item = $res->fetch_assoc();
            $tmp = array(
                "IID" => $item['id_eleccion'],
                "NOMBRE" => $item['nombre']
                );
            array_push($result, $tmp);
        }
        $DB_con = null;
        $stmt = null; 
        echo json_encode($result);
    }
}

/* function tipo_eleccion($DB_con){
    $stmt = $DB_con->prepare("SELECT * FROM tipo_eleccion where id_eleccion=5;");
    $stmt->execute();
    $res = $stmt->get_result();
    $result = [];
    if( $res->num_rows > 0 ) {
        for ($i=0; $i < $res->num_rows ; $i++) {
            $item = $res->fetch_assoc();
            $tmp = array(
                "IID" => $item['id_eleccion'],
                "NOMBRE" => $item['nombre']
                );
            array_push($result, $tmp);
        }
        $DB_con = null;
        $stmt = null; 
        echo json_encode($result);
    }
} */


function distritos($DB_con, $id_eleccion) {
    $stmt = $DB_con->prepare("SELECT * FROM distrito WHERE id_eleccion = $id_eleccion");
    $stmt->execute();
    $res = $stmt->get_result();

    $result = [];
    $i = 1;
    if( $res->num_rows > 0) {
        while( $item = $res->fetch_assoc() ){            
            //echo var_dump($item);
            if($i < 10) $it = "0".$i;
            else{ $it = $i; }

            $tmp = array(
                "IID" => $item['id_distrito'],
                "NOMBRE" =>  $it."  ".$item['nombre']
            );
            array_push($result, $tmp);
            $i++;
        }
        $DB_con = null;
        $stmt = null;
        echo json_encode($result);
    }
}

function combinaciones($DB_con){
    
    $sqlQuery = "CALL getSlctPartidos()";
    $stmt = $DB_con->prepare($sqlQuery);
    $stmt->execute();
    $res = $stmt->get_result();

    $result = [];
    $items = [];

    if( $res->num_rows > 0) {

        $result = array( "ok" => true );
        while( $item = $res->fetch_assoc() ){
            $items[] = array(
                "id_partido" => $item['id'],
                "nombre_partido" =>  $item['nombre_partido'],
                "nombre_constitucion" => $item['nombre_constitucion'],
                "id_constitucion" => $item['id_constitucion']
            );
            //array_push($result, $tmp);
        }
        $result[] = $items;
    }else{
        $result[] = array( "ok" => false );
    }

    $DB_con = null;
    $stmt = null;
    echo json_encode($result);
}

/* function combinaciones($DB_con){
    
   se agrega consulta para elecciones extraordinarias solo partidos participantes
   $sqlQuery = "SELECT partidos_politicos.id_partido as id, partidos_politicos.nombre_partido AS nombre_partido, partidos_politicos.tipo_constitucion as id_constitucion, tipo_constitucion.nombre as nombre_constitucion 
   FROM partidos_politicos, tipo_constitucion 
   WHERE partidos_politicos.tipo_constitucion = 1 AND tipo_constitucion.id_constitucion = 1;";
    $stmt = $DB_con->prepare($sqlQuery);
    $stmt->execute();
    $res = $stmt->get_result();

    $result = [];
    $items = [];

    if( $res->num_rows > 0) {

        $result = array( "ok" => true );
        while( $item = $res->fetch_assoc() ){
            $items[] = array(
                "id_partido" => $item['id'],
                "nombre_partido" =>  $item['nombre_partido'],
                "nombre_constitucion" => $item['nombre_constitucion'],
                "id_constitucion" => $item['id_constitucion']
            );
        }
        $result[] = $items;
    }else{
        $result[] = array( "ok" => false );
    }

    $DB_con = null;
    $stmt = null;
    echo json_encode($result);
} */


function getEstados($DB_con) {
    $stmt = $DB_con->prepare("SELECT * FROM estados");
    $stmt->execute();

    $res = $stmt->get_result();

    $result = [];
    if( $res->num_rows > 0 ) {
        for ($i=0; $i < $res->num_rows ; $i++) {
            $item = $res->fetch_assoc();
            $result[] = array(
                "id_estado" => $item['id_estado'],
                "nombre_estado" => $item['nombre_estado']
            );
        }
    }
    $DB_con = null;
    $stmt = null;
    echo json_encode($result);
}


function getMunicipios($DB_con){
    $stmt = $DB_con->prepare("SELECT * FROM municipios");
    $stmt->execute();

    $res = $stmt->get_result();

    $result = [];
    $items = [];
    if( $res->num_rows > 0 ){
        $result = array( "ok" => true );

        for ($i=0; $i < $res->num_rows ; $i++) {
            $item = $res->fetch_assoc();

            $items[] = array(
                "IID" => $item['id_municipio'],
                "NOMBRE" => $item['nombre_municipio']
            );
        }
        $result[] = $items;
    }else{
        $result[] = array( "ok" => false );
    }
    $DB_con = null;
    $stmt = null;
    echo json_encode($result);
}

function getMunicipiosParticipantes($DB_con) {

    $stmt = $DB_con->prepare("Call getMuniParticipantes();");
    $stmt->execute();

    $res = $stmt->get_result();

    $result = [];
    $items = [];
    if( $res->num_rows > 0 ){
        $result = array( "ok" => true );

        for ($i=0; $i < $res->num_rows ; $i++) {
            $item = $res->fetch_assoc();

            $items[] = array(
                "IID" => $item['id_municipio'],
                "NOMBRE" => $i + 1 .'. '.$item['nombre_municipio']
            );
        }

        $result[] = $items;
    }else{
        $result[] = array( "ok" => false );
    }
    $DB_con = null;
    $stmt = null;
    echo json_encode($result);
}


/* function getMunicipiosParticipantes($DB_con) {

    $stmt = $DB_con->prepare("SELECT DISTINCT id_municipio, nombre_municipio FROM municipios WHERE id_municipio IN (6,9,24,45,53)");
    $stmt->execute();

    $res = $stmt->get_result();

    $result = [];
    $items = [];
    if( $res->num_rows > 0 ){
        $result = array( "ok" => true );

        for ($i=0; $i < $res->num_rows ; $i++) {
            $item = $res->fetch_assoc();

            $items[] = array(
                "IID" => $item['id_municipio'],
                "NOMBRE" => $i + 1 .'. '.$item['nombre_municipio']
            );
        }

        $result[] = $items;
    }else{
        $result[] = array( "ok" => false );
    }
    $DB_con = null;
    $stmt = null;
    echo json_encode($result);
} */

function getComunidades($DB_con, $id_municipio){

    $stmt = $DB_con->prepare("SELECT * FROM comunidades WHERE comunidades.id_municipio = $id_municipio");
    $stmt->execute();
    $res = $stmt->get_result();

    $result = [];
    $items = [];

    if( $res->num_rows > 0 ){
        $result = array( "ok" => true );

        for ($i=0; $i < $res->num_rows ; $i++) {
            $item = $res->fetch_assoc();

            $items[] = array(
                "IID" => $item['id_comunidad'],
                "NOMBRE" => $item['nombre_comunidad']
            );
        }

        $result[] = $items;
    }else{
        $result[] = array( "ok" => false );
    }
    $DB_con = null;
    $stmt = null;
    echo json_encode($result);
}
/* function getComunidades($DB_con, $id_municipio){

    if($id_municipio==6){
        $id_comunidad=44;
    }
    
    if($id_municipio==9){
        $id_comunidad=50;
    }

    if($id_municipio==24){
        $id_comunidad=139;
    }

    if($id_municipio==45){
        $id_comunidad=189;
    }

    if($id_municipio==53){
        $id_comunidad=260;
    }
    $stmt = $DB_con->prepare("SELECT * FROM comunidades WHERE id_municipio = $id_municipio and id_comunidad = $id_comunidad");                  
    $stmt->execute();
    $res = $stmt->get_result();

    $result = [];
    $items = [];

    if( $res->num_rows > 0 ){
        $result = array( "ok" => true );

        for ($i=0; $i < $res->num_rows ; $i++) {
            $item = $res->fetch_assoc();

            $items[] = array(
                "IID" => $item['id_comunidad'],
                "NOMBRE" => $item['nombre_comunidad']
            );
        }

        $result[] = $items;
    }else{
        $result[] = array( "ok" => false );
    }
    $DB_con = null;
    $stmt = null;
    echo json_encode($result);

} */

?>