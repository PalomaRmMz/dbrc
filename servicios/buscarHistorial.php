<?php
 require_once '../controladores/conndb.php';

   $dia = $_POST["dia"];
   $usuario = $_POST["usuario"];
   $tipo = $_POST["estado"];


   if ($dia == 'NaN.NaN.NaN') {
     $dia = '';
   } else {
     # code...
   }

   $query_str = "SELECT * FROM historial ";

    if ($dia != '') {
      $query_add = " WHERE dia = '".$dia."' ";

      if ($usuario != '') {
          $query_add = $query_add . " AND usuario = '".$usuario."' ";
      }

      if ($tipo != '') {
          $query_add = $query_add . " AND tipo = '".$tipo."' ";
      }
    } elseif ($usuario != '') {
        $query_add = " WHERE usuario = '".$usuario."' ";

        if ($tipo != '') {
            $query_add = $query_add . " AND tipo = '".$tipo."' ";
        }

        if ($dia != '') {
            $query_add = $query_add . " AND dia = '".$dia."' ";
        }
    } elseif ($tipo != '') {
        $query_add = " WHERE tipo = '".$tipo."' ";

        if ($usuario != '') {
            $query_add = $query_add . " AND usuario = '".$usuario."' ";
        }

        if ($dia != '') {
            $query_add = $query_add . " AND dia = '".$dia."' ";
        }
    }

    $query_str = $query_str . $query_add;
    $stmt = $DB_con -> prepare($query_str);
    $stmt -> execute();
    $res = $stmt->get_result();

    if ($res->num_rows < 1) {
      $fila_General = array("datos"=>1);
      $lista_General[] = $fila_General;
    }else if($res->num_rows > 0){
      
      for ($i=0; $i< $res->num_rows ; $i++) {
        $General = $res->fetch_assoc();
        $fila_General = array(

           "usuario"=>utf8_encode($General["usuario"]),
           "tipo"=>utf8_encode($General["tipo"]),
           "nombre_clv"=>utf8_encode($General["nombre_clv"]),
           "clave_original"=>utf8_encode($General["clv_original"]),
           "nombre_clv_nuevo"=>utf8_encode($General["nombre_clv_nuevo"]),
           "clave_nuevo"=>utf8_encode($General["clv_nuevo"]),
           "motivo"=>utf8_encode($General["motivo"]),
           "dia"=>utf8_encode($General["dia"]),
           "hora"=>utf8_encode($General["hora"]));
        $lista_General[] = $fila_General;
      }
    } else {
      $fila_General = array("datos"=>0);
      $lista_General[] = $fila_General;
    }

   echo json_encode($lista_General);
?>
