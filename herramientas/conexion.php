<?php
    $servidor = "mysql:dbname=bd_productos_sanetta;host=localhost";
    $user = "root";
    $pass = "";
    try 
    {
        $pdo = new PDO($servidor, $user, $pass, array(PDO::MYSQL_ATTR_INIT_COMMAND => "SET NAMES utf8"));
    } 
    catch (PDOException $e) 
    {
        echo "conexion fallida" .$e->getMessage();
    }

?>