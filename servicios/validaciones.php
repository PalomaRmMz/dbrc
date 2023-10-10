<?php
  require_once '../controladores/conndb.php';
  date_default_timezone_set('America/Mexico_city');
  
  $tipoV = $_POST['tipo'];

  switch($tipoV){
    case 'existsOtraCandi':
        $clave_elector = $_POST['clave_elector'];
        $curp = $_POST['curp'];
        existeOtraCandidatura($DB_con , $clave_elector, $curp);
    break;
  }
  

  function existeOtraCandidatura($DB_con, $clave_elector, $curp){

    $stmt = $DB_con->prepare("SELECT * FROM candidatura_gubernatura WHERE candidatura_gubernatura.clave_elector = '$clave_elector' OR candidatura_gubernatura.curp = '$curp' ");
    $stmt->execute();
    $res = $stmt->get_result();
    $result = $res->fetch_assoc();

    if($result){
      $respuesta = array( 'mensaje' => 'Ya existe un registro con esa clave elector o curp en candidatura para gubernatura', 'status' => -1 );
      echo json_encode($respuesta);
    }else{

      $stmt = $DB_con->prepare("SELECT * FROM candidatura_diputado WHERE candidatura_diputado.clave_elector = '$clave_elector' OR candidatura_diputado.curp = '$curp' ");
      $stmt->execute();
      $res = $stmt->get_result();
      $result = $res->fetch_assoc();
      
      if($result){
        //$respuesta = array( 'mensaje' => 'Ya existe un registro con esa clave elector o curp en candidatura para diputado', 'status' => 0 );
        $respuesta = array( 'mensaje' => 'Ya existe un registro con esa clave elector o curp en candidatura para diputado', 'status' => -1 );
        echo json_encode($respuesta);
      }else{
        $respuesta = array( 'mensaje' => 'No existe registro', 'status' => 1 );
        echo json_encode($respuesta);
      }
    }
 } // end function

?>