<?php
 require_once '../../controladores/conndb.php';

 $clave_elector = $_POST["clave_elector"];
 $id_candidatura = $_POST["id_candidatura"];

 $query = "SELECT * FROM historial WHERE clv_original = '".$clave_elector."' AND  id_tipo_eleccion = '".$id_candidatura."'  ";
 $stmt = $DB_con->prepare($query);
 $stmt->execute();
 $res = $stmt->get_result();


 if($res->num_rows < 1 ) {
   $fila = array("datos" => 1);
   $lista[] = $fila;
 } else if ($res->num_rows > 0) {
     for ($i=0; $i< $res->num_rows ; $i++) {
       $usuarios = $res->fetch_assoc();
       $fila = array("usuario" => utf8_encode($usuarios["usuario"]),
            "tipo" => utf8_encode($usuarios["tipo"]),
            "clave_original" => utf8_encode($usuarios["clv_original"]),
            "dia" => utf8_encode($usuarios["dia"]),
            "hora" => utf8_encode($usuarios["hora"])
          );
       $lista[] = $fila;
     }
 } else {
   $fila = array('datos' => 3);
   $lista[] = $fila;
 }
 $DB_con = null;
 $stmt = null; 
 echo json_encode($lista);
?>
