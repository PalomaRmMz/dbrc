<?php

$meses = array( 1 => 'Enero', 'Febrero', 'Marzo', 'Abril', 'Mayo', 'Junio', 'Julio', 'Agosto', 'Septiembre', 'Octubre', 'Noviembre', 'Diciembre' );

function verProcedimiento( $SP, $datos){
    
    for( $i = 0 ; $i < count($datos); $i++){
      $SP.=  "'".$datos[$i]."'";
      if($i + 1 < count($datos) ){
        $SP.=",";
      }
    }
    $SP .= ")";
    return $SP;
  }

?>