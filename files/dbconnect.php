<?php
/**
 * D�tecte l'environnement de l'appli : sosgardes ou dentistes ou maisons medicales
 */

    $user = "root";
    $mdp = "password";
    $nombase = 'gardes';

$db = mysql_connect('db', $user, $mdp);
if(! mysql_select_db($nombase, $db))
{
  die('erreur de connexion � la base de donn�es : ' . mysql_error());
}

if(!function_exists('esc'))
{
  function esc($a)
  {
    return $a;
  }
}
?>
