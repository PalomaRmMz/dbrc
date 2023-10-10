<?php

 require_once 'conndb.php';
 date_default_timezone_set('America/Mexico_city');

 if ($_POST) {
   $clave = $_POST["clave"];
   $tipo = $_POST["tipo"];
   $capturista = $_POST["capturista"];

   $dia = date("d.m.Y");
   $hora = date("h:i:sa");

   $stmtdel = $DB_con->prepare("DELETE FROM candidatura_diputado WHERE clave_elector = '".$clave."' AND candidatura = '".utf8_decode($tipo)."' ");
   $stmtdel->execute();

   if ($stmtdel == false) {
     $fila = array('datos' => 0);
     $respuesta = $fila;
   } else {

     $stmtDelete= $DB_con->prepare('INSERT INTO registro_eliminado(clave_elector, capturista, fecha, hora) VALUES ( "'.$clave.'", "'.$capturista.'", "'.$dia.'","'.$hora.'" );');
     $stmtDelete->execute();

     $fila = array('datos'=> 1);
     $respuesta = $fila;
   }
 }
 echo json_encode($respuesta);
?>
