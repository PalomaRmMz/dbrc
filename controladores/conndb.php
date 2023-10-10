<?php
  require_once 'funciones.php';
 //header('Access-Control-Allow-Origin: http://registro-de-candidatura-registro-candidaturas.apps.us-west-1.starter.openshift-online.com');
  header("Access-Control-Allow-Headers: X-API-KEY, Origin, X-Requested-With, Content-Type, Accept, Access-Control-Request-Method");
  header("Access-Control-Allow-Methods: GET, POST, OPTIONS, PUT, DELETE");
  header("Allow: GET, POST, OPTIONS, PUT, DELETE");
  $method = $_SERVER['REQUEST_METHOD'];

  if($method == "OPTIONS") {
      
  }

  try{
    /*conexion azure   
    
      $host = "demoite2.mysql.database.azure.com";
      $port = "3306";
      $user = "user1@demoite2";
      $pass = 'Pa$$Usr1It3-';
      $db = "reg2018_bd";
    
      $DB_con = mysqli_connect($host, $user, $pass, $db); */
    
      $host = getenv("MYSQL_SERVICE_HOST");
      $port = getenv("MYSQL_SERVICE_POST");
      $user = getenv("databaseuser");
      $pass = getenv("databasepassword");
      $db = getenv("databasename");
    
      //$DB_con = @mysqli_connect($host, $user, $pass, $db);
      
      // conexion a base de datos local
     $DB_con = mysqli_connect('localhost', 'root', '', 'candidaturas');
     // $DB_con = mysqli_connect('localhost', 'candidaturas', 'candidaturas', 'candidaturas');


      if(!$DB_con){
        echo json_encode( array( 'status_code' => 502, 'mensaje' => mysqli_connect_error() ) );
        exit;
      }
      else {
        //echo ("connected");
        $DB_con->set_charset("utf8");
      }
  }catch(ExcException $e){
    echo $e;
  }
?>
