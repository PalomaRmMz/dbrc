<?php
  setlocale(LC_TIME, 'spanish');
  
/*   define('DBhost', 'localhost');
  define('DBuser', 'root');
  define('DBPass', '');
  define('DBname', 'reg2018_bd');  

	$año = date("Y");
  $mes = strftime("%B");
  
  try{

    $DB_con = new PDO("mysql:host=".DBhost.";dbname=".DBname,DBuser,DBPass);

  }catch(PDOException $e) {

    die($e->getMessage());

  } */


  $host = getenv("127.0.0.1");
  $port = getenv("MYSQL_SERVICE_POST");
  $user = getenv("databaseuser");
  $pass = getenv("databasepassword");
  $db = getenv("databasename");

  $con = mysql_connect($host, $user, $pass, $db);

  if(!$con){
    print("Not connected".mysql_error());
  }
  else {
    echo ("connected");
  }



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
