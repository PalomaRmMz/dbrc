<?php

 define('DBhost', 'localhost');
 define('DBuser', 'root');
 define('DBPass', 'pelo2018');
 define('DBname', 'reg2018_bd');

 try{

  $DB_con = new PDO("mysql:host=".DBhost.";dbname=".DBname,DBuser,DBPass);

 }catch(PDOException $e){

  die($e->getMessage());
  }

?>
