<?php
require_once '../controladores/conndb.php';
$dia = date("d.m.Y");
//consulta de los registros del historial GENERAL
$stmt_General = $DB_con->prepare('SELECT * FROM historial WHERE dia = "'.$dia.'" ');
$stmt_General->execute();
$res = $stmt_General->get_result();


//Asigno el resultado de la consulta a una arreglo
if ($res->num_rows < 1) {
  $fila_General = array("datos"=>1);
  $lista_General[] = $fila_General;
}else if($res->num_rows > 0){
  for ($i=0; $i< $res->num_rows ; $i++) {
    $General = $res->fetch_assoc();
    $fila_General = array(

       "usuario"=>utf8_encode($General["usuario"]),
       "usuario_nombre"=>utf8_encode($General["usuario_nombre"]),
       "tipo"=>utf8_encode($General["tipo"]),
       "nombre_clv"=>utf8_encode($General["nombre_clv"]),
       "clave_original"=>utf8_encode($General["clv_original"]),
       "nombre_clv_nuevo"=>utf8_encode($General["nombre_clv_nuevo"]),
       "clave_nuevo"=>utf8_encode($General["clv_nuevo"]),
       "motivo"=>utf8_encode($General["motivo"]),
       "dia"=>utf8_encode($General["dia"]),
       "hora"=>utf8_encode($General["hora"]),
  );
    $lista_General[] = $fila_General;
  }
} else {
  $fila_General = array("datos"=>0);
  $lista_General[] = $fila_General;
}
$DB_con = null;
$stmt_General = null; 
echo json_encode($lista_General);
?>
