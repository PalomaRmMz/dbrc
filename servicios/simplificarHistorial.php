<?php
    require_once '../controladores/conndb.php';
    //Declaro variables  para mi consulta
    $uname = $_POST["username"];
    $clave_original = $_POST["clv_original"];
    //realizo mi consulta

    //comparo si existe una clave original
    if($clave_original != "") {//si no existe muestro los mismos resultados 2 veses
      $stmt = $DB_con->prepare("SELECT nombre, apellido_paterno, apellido_materno from candidatura_diputado where clave_elector ='". $clave_original ."' ");
      $nombreclv = "nombre";
      $appclv = "apellido_paterno";
      $apmclv = "apellido_materno";
    }else{//si existe mustro los valores correspondientes
      $stmt = $DB_con->prepare("SELECT nombre_capturista, app_capturista, apm_capturista FROM usuarios WHERE usuario = '". $uname ."'");
      $nombreclv = "nombre_capturista";
      $appclv = "app_capturista";
      $apmclv = "apm_capturista";
    }

    $stmt->execute();
    $res1 = $stmt->get_result();

    $stmt2 = $DB_con->prepare("SELECT nombre_capturista, app_capturista, apm_capturista FROM usuarios WHERE usuario = '". $uname ."' ");
    $stmt2->execute();
    $res2 = $stmt2->get_result();


    //asigno los registros de mi consulta a un arreglo
    if($res1->num_rows < 1 ) {
        $fila = array("datos" => 1);
      } else if ($res1->num_rows == 1) {

        $USER_clv = $res1 -> fetch_assoc();
        $USER_uname = $res2 -> fetch_assoc();
        $fila = array(
          "nombre_u" =>"". utf8_encode($USER_uname["nombre_capturista"]),
          "app_u" =>"". utf8_encode($USER_uname["app_capturista"]),
          "apm_u" =>"". utf8_encode($USER_uname["apm_capturista"]),

          "nombre_clv" =>"". utf8_encode($USER_clv[$nombreclv ]),
          "app_clv" =>"". utf8_encode($USER_clv[$appclv]),
          "apm_clv" =>"". utf8_encode($USER_clv[$apmclv]),
          "datos" => "2"
          );
      } else {
        $fila = array('datos' => 3);
      }
  echo json_encode($fila);
?>
