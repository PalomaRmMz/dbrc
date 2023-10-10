   <?php
    require_once '../controladores/conndb.php';

    $search = $_POST["search"];
    $id_tipo_eleccion = $_POST["idTipoEleccion"];


    $query = "SELECT
    usuario,
    tipo,
    clv_original,
    dia,
    hora
  FROM historial WHERE clv_original = '".$search."' AND id_tipo_eleccion = ".$id_tipo_eleccion."
  ORDER BY id DESC
  LIMIT 1";
    $stmt = $DB_con->prepare($query);
    $stmt->execute();
    $res = $stmt->get_result();

    if($res->num_rows < 1 ) {
      $fila = array("datos" => 1);
    } else if ($res->num_rows == 1) {

      $usuarios = $res->fetch_assoc();
      $fila = array(
        "usuario" => utf8_encode($usuarios["usuario"]),
        "tipo" => utf8_encode($usuarios["tipo"]),
        "clave_original" => utf8_encode($usuarios["clv_original"]),
        "dia" => utf8_encode($usuarios["dia"]),
        "hora" => utf8_encode($usuarios["hora"]),
        'datos' => 2
        );

    } else {
      $fila = array('datos' => 3);
    }
    $DB_con = null;
    $stmt = null; 
    echo json_encode($fila);
   ?>
